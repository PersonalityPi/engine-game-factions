#include "UXSystem.h"

#include "Configuration/IConfiguration.hpp"
using namespace Configuration;

#include "System/Memory.cxx"

#include "Management/Management.h"
#include "Logging/Logger.h"
using namespace Logging;


BOOL __stdcall DllMain( HANDLE hModule, DWORD ul_reason_for_call, LPVOID lpReserved )
{
	return true;
}

extern "C" void __stdcall Initialize( Management* management, Logger* logger )
{
	//Management::Initialize( management );
	//Logger::Initialize( logger );
}

extern "C" ISystem* __stdcall CreateSystem( IConfiguration* configuration )
{
	return new UX::UXSystem( );
}

extern "C" void __stdcall DestroySystem( ISystem* system )
{
	delete system;
	system = 0;
}