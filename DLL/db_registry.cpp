#include "stdafx.h"

static_assert(GENERIC_READ == 0x80000000, "GENERIC_READ must have a value of 0x80000000");
static_assert((FILE_FLAG_OVERLAPPED | FILE_FLAG_NO_BUFFERING) == 0x60000000, "(FILE_FLAG_OVERLAPPED | FILE_FLAG_NO_BUFFERING) must have a value of 0x60000000");
static_assert(FILE_SHARE_READ == 0x1, "FILE_SHARE_READ must have a value of 0x1");
static_assert(OPEN_EXISTING == 0x3, "OPEN_EXISTING must have a value of 0x3");

// List of supported mod zone names
// These will be checked (in order) as long as a zone for the previous name exists
static const char* g_modZones[] = {
	"mod",
	"mod1",
	"mod2",
	"mod3",
	"mod4",
	"mod5",
	"mod6",
	"mod7"
};

const char* DB_GetXAssetTypeName(int type)
{
	ASSERT(type >= 0 && type < ASSET_TYPE_COUNT);

	return g_assetNames[type];
}

void DB_SyncXAssets()
{
	R_BeginRemoteScreenUpdate();
	Sys_SyncDatabase();
	R_EndRemoteScreenUpdate(nullptr);
	SocketRouter_EmergencyFrame("DB_SyncXAssets");
	DB_PostLoadXZone();
}

void* DB_ReallocXAssetPool(XAssetType type, unsigned int size)
{
	int assetSize = DB_GetXAssetTypeSize(type);
	void* assetPool = malloc(size * assetSize + sizeof(void*));
	DB_XAssetPool[type] = assetPool;
	g_poolSize[type] = size;

	return assetPool;
}

int DB_FinishedLoadingAssets()
{
	return ((int(__cdecl*)())0x006714E0)();
}