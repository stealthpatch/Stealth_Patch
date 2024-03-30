#include "stdafx.h"

static bool IsGermanBinary(void)
{
	// The location of the PDB string in the **German binary**
	// Note: This will point to arbitrary data in any other version
	const char* pStr = (const char*)0xB61694;

	// Target PDB string for the **German binary**
	const char pdb[] = "C:\\projects_pc\\cod\\codsrc\\src\\obj\\t5\\CoDSteam_CEG_German_bin\\BlackOps.pdb";

	size_t len = _countof(pdb);

	DWORD dwProtect = 0;
	VirtualProtect((LPVOID)pStr, len + 1, PAGE_EXECUTE_READ, &dwProtect);

	bool result = strncmp(pStr, pdb, len) == 0;

	VirtualProtect((LPVOID)pStr, len + 1, dwProtect, &dwProtect);

	return result;
}

BOOL StealthPatch_Init(HMODULE hModule)
{
	//
	// Make sure that the user is not running the German version of Black Ops
	//
	ASSERT_MSG(!IsGermanBinary(), "The German version of Call of Duty: Black Ops is not supported!");

	//
	// Disable STDOUT buffering
	//
	setvbuf(stdout, nullptr, _IONBF, 0);

	//
	// Bypass CEG's code hashes
	//
	Patch_CEG();

	//
	// Sys_CheckCrashOrRerun, EAX = TRUE
	//
	PatchMemory(0x004F1930, (PBYTE)"\xB8\x01\x00\x00\x00\xC3", 6);

	//
	// Bypass deletion of 'steam_appid.txt'
	//
	PatchMemory(0x008B41AF, (PBYTE)"\x90\x90", 2);
	PatchMemory(0x008B41A5, (PBYTE)"\x90\x90\x90\x90\x90", 5); // fopen
	PatchMemory(0x008B41B3, (PBYTE)"\x90\x90\x90\x90\x90", 5); // fclose

	//
	// Force sv_vac 0
	//
	PatchMemory(0x005A272C, (PBYTE)"\x00", 1);
	PatchMemory(0x005A272E, (PBYTE)"\x00", 1);
	PatchMemory(0x00655051, (PBYTE)"\x90\x90\x90\x90\x90", 5);

	//
	// Disable steam kicking users for random reasons
	//
	PatchMemory(0x008B4240, (PBYTE)"\xC3", 1);// KickClientFromSteamGameServer
	PatchMemory(0x00616628, (PBYTE)"\xEB", 1);// Runframe

	//
	// Bring power to the players.
	//
	//Detours::X86::DetourFunction((PBYTE)0x004C8890, (PBYTE)&Com_LoadLevelFastFiles);

	return TRUE;
}

BOOL APIENTRY DllMain(HMODULE hModule, DWORD ul_reason_for_call, LPVOID lpReserved)
{
	if (ul_reason_for_call == DLL_PROCESS_ATTACH)
	{
		DisableThreadLibraryCalls(hModule);
		return StealthPatch_Init(hModule);
	}

	return TRUE;
}
