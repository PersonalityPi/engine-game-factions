#include "SoundSystem.h"

#include "SoundScene.h"

#include "Management/Management.h"

#include "IO/IResource.hpp"
using namespace Resources;

#include "IO/FileBuffer.hpp"
using namespace IO;

#include "Configuration/ConfigurationTypes.hpp"
using namespace Configuration;

namespace Sound
{
	ISystemScene* SoundSystem::CreateScene()
	{
		ISoundScene* scene = new SoundScene( this );
		scene->Initialize( );
		return scene;
	}

	void SoundSystem::Initialize( IConfiguration* configuration )
	{
		m_configuration = configuration;
		m_configuration->SetDefault( ConfigSections::Sound, ConfigItems::Sound::SFXVolume, 99 );
		m_configuration->SetDefault( ConfigSections::Sound, ConfigItems::Sound::MusicVolume, 99 );

		FMOD_RESULT result;
		m_fmodSystem = 0;

		result = System_Create( &m_fmodSystem );

		if ( result != FMOD_OK )
		{
			// failed to create FMOD System
		}

		unsigned int version = 0;

		result = m_fmodSystem->getVersion( &version );

		if ( version < FMOD_VERSION )
		{
			// wrong FMOD version
		}

		int driverCount = 0;
		result = m_fmodSystem->getNumDrivers( &driverCount );


		if ( driverCount < 1 )
		{
			result = m_fmodSystem->setOutput( FMOD_OUTPUTTYPE_NOSOUND );
		}
		else
		{
			FMOD_CAPS driverCaps;
			FMOD_SPEAKERMODE speakerMode;

			result = m_fmodSystem->getDriverCaps( 0, &driverCaps, 0, 0, &speakerMode );

			if ( result != FMOD_OK )
			{
				// could not get driver caps
			}

			if ( driverCaps & FMOD_CAPS_HARDWARE_EMULATED )
			{
				char name[ 256 ];
				result = m_fmodSystem->getDriverInfo( 0, name, 256, 0 );

				if ( result != FMOD_OK )
				{
					// could not get driver info
				}

				if ( strstr( name, "SigmaTel" ) )
				{
					result = m_fmodSystem->setSoftwareFormat( 48000, FMOD_SOUND_FORMAT_PCMFLOAT, 0, 0, FMOD_DSP_RESAMPLER_LINEAR );

					if ( result != FMOD_OK )
					{
						// count not set Sigmatel software format
					}
				}
			}
		}

		result = m_fmodSystem->init( 100, FMOD_INIT_NORMAL, 0 );

		if ( result == FMOD_ERR_OUTPUT_CREATEBUFFER )
		{
			result = m_fmodSystem->setSpeakerMode( FMOD_SPEAKERMODE_STEREO );

			if ( result != FMOD_OK )
			{
				// could not set speaker mode
			}

			result = m_fmodSystem->init( 100, FMOD_INIT_NORMAL, 0 );

			if ( result != FMOD_OK )
			{
				// could not init FMOD with standard stereo setup
			}
		}

		result = m_fmodSystem->setFileSystem( &SoundSystem::FileOpen, &SoundSystem::FileClose, &SoundSystem::FileRead, &SoundSystem::FileSeek, 0 );

		if ( result != FMOD_OK )
		{
			// error binding IO functions
		}

		result = EventSystem_Create( &m_eventSystem );

		if ( result != FMOD_OK )
		{
			// error creating event system
		}

		result = m_eventSystem->getSystemObject( &m_fmodSystem );

		if ( result != FMOD_OK )
		{
			// error getting the FMOD system object
		}

		result = m_eventSystem->init( 256, FMOD_INIT_NORMAL, 0);

		if ( result != FMOD_OK )
		{
			// error initializing the FMOD event system
		}

		result = m_eventSystem->load( "/data/sound/game.fev", 0, 0 );

		if ( result != FMOD_OK )
		{
			Logging::Logger::Get( )->Warn( "SoundSystem::Initialize - Couldn't load the game sound archive" );
		}

		Management::Get( )->GetServiceManager( )->RegisterService( this );
	}

	void SoundSystem::Release()
	{
		m_eventSystem->release( );
		m_fmodSystem->release( );
	}

	void SoundSystem::Update( float deltaMilliseconds )
	{
		m_eventSystem->update( );
		m_fmodSystem->update( );

		FMOD::EventCategory* masterCategory = 0;
		m_eventSystem->getCategory( "master", &masterCategory );
		float sfxVolume = static_cast< float >( m_configuration->Find( ConfigSections::Sound, "sfx_volume" ).As< int >( ) ) / 100;
		masterCategory->setVolume( sfxVolume );
	}

	FMOD_RESULT F_CALLBACK SoundSystem::FileOpen( const char* name, int unicode, unsigned int* filesize, void** handle, void** userdata )
	{
		IResource* resource = Management::Get( )->GetResourceManager( )->GetResource( name );
		resource->AddReference( );

		*handle = resource;
		*filesize = resource->GetFileBuffer( )->fileLength;

		return FMOD_OK;
	}

	FMOD_RESULT F_CALLBACK SoundSystem::FileClose( void* handle, void* userdata )
	{
		IResource* resource = reinterpret_cast< IResource* >( handle );
		resource->RemoveReference( );

		return FMOD_OK;
	}

	FMOD_RESULT F_CALLBACK SoundSystem::FileRead( void* handle, void* buffer, unsigned int sizebytes, unsigned int* bytesread, void* userdata )
	{
		IResource* resource = reinterpret_cast< IResource* >( handle );
		FileBuffer* fileBuffer = resource->GetFileBuffer( );

		memcpy( buffer, fileBuffer->fileBytes + fileBuffer->filePosition, sizebytes );

		fileBuffer->filePosition += sizebytes;

		return FMOD_OK;
	}

	FMOD_RESULT F_CALLBACK SoundSystem::FileSeek( void* handle, unsigned int pos, void* userdata )
	{
		IResource* resource = reinterpret_cast< IResource* >( handle );
		FileBuffer* fileBuffer = resource->GetFileBuffer( );

		fileBuffer->filePosition = pos;
		return FMOD_OK;
	}

	AnyType::AnyTypeMap SoundSystem::ProcessMessage( const System::MessageType& message, AnyType::AnyTypeMap parameters )
	{
		AnyType::AnyTypeMap results;
		FMOD_RESULT result;

		if( message == "load" )
		{
			std::string filePath = parameters[ "filePath" ].As< std::string >( );
			result = m_eventSystem->load( filePath.c_str( ), 0, 0 );
			results[ "result" ] = ( result == FMOD_OK );
		}

		if ( message == "playMusic" )
		{
			FMOD::Event* event = 0;
			std::string eventPath = parameters[ "eventPath" ].As< std::string >( );
			result = m_eventSystem->getEvent( eventPath.c_str( ), FMOD_EVENT_DEFAULT, &event );

			if ( result == FMOD_OK )
			{
				result = event->start( );
				results[ "result" ] = ( result == FMOD_OK );
			}
		}

		return results;
	}
}