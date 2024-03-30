// pch.h: This is a precompiled header file.
// Files listed below are compiled only once, improving build performance for future builds.
// This also affects IntelliSense performance, including code completion and many code browsing features.
// However, files listed here are ALL re-compiled if any one of them is updated between builds.
// Do not add files here that you will be updating frequently as this negates the performance advantage.

#ifndef PCH_H
#define PCH_H

// add headers that you want to pre-compile here
#define _WINSOCK_DEPRECATED_NO_WARNINGS
#define WIN32_LEAN_AND_MEAN

#include "framework.h"

#include <windows.h>
#include <stdio.h>
#include <intrin.h>
#include <Psapi.h>
#include <shellapi.h>
#include <winsock2.h>
#include <time.h>
#include <vector>
#include <unordered_map>
#include <algorithm>

#include "CEG.h"

#pragma comment(lib, "../build/Release/Detours.lib")
#include "../Shared/Detours/Detours.h"

#include "common.h"
#include "shared_utility.h"
#include "db_registry.h"
#include "vanilla.h"
#include "dvar.h"

#endif //PCH_H
