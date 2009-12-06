/**/
#pragma once
#ifndef WIN32CLOCK_H
#define WIN32CLOCK_H

#include <windows.h>
#include <mmsystem.h>

#include "IClock.hpp"

namespace Platform
{
	class GAMEAPI Win32Clock : public IClock
	{

	public:

		~Win32Clock( ) { };

		Win32Clock( )
			: m_endFrameTime( 0 )
			, m_startFrameTime( timeGetTime( ) )
		{

		}

		float GetDeltaMilliseconds( );

		inline float GetTime( ) const { return static_cast< float >( timeGetTime( ) ); };

	private:

		DWORD m_endFrameTime;
		DWORD m_startFrameTime;

	};
}

#endif
