#include "SoundSystemComponent.h"

#include "Maths/MathTools.hpp"
using namespace Maths;

namespace Sound
{
	AnyType SoundSystemComponent::Observe( const System::MessageType& message, AnyType::AnyTypeMap parameters )
	{
		if( message == System::Messages::TriggerSoundEvent  )
		{
			this->TriggerEvent( parameters[ System::Parameters::SoundEventPath ].As< std::string >( ) );
		}

		if ( message == System::Messages::KeyOutSoundEvent )
		{
			this->KeyoutEvent( parameters[ System::Parameters::SoundEventPath ].As< std::string >( ) );
		}

		if ( message == System::Messages::SetPosition )
		{
			m_attributes[ System::Attributes::Position ] = parameters[ System::Attributes::Position ].As< MathVector3 >( );

			for ( SoundEventList::iterator i = m_activeSoundEvents.begin( ); i != m_activeSoundEvents.end( ); ++i )
			{
				FMOD_VECTOR position, velocity;

				( *i ).second->get3DAttributes( &position, &velocity );
				( *i ).second->set3DAttributes( &MathTools::AsFMODVector( parameters[ System::Attributes::Position ].As< MathVector3 >( ) ), &velocity );
			}
		}

		if ( message == System::Messages::SetOrientation )
		{
			m_attributes[ System::Attributes::Orientation ] = parameters[ System::Attributes::Orientation ].As< MathQuaternion >( );
		}

		if ( message == System::Messages::SetPlayerPosition )
		{
			FMOD_VECTOR position, velocity, forward, up;

			m_soundSystemScene->GetSoundSystem( )->GetEventSystem( )->get3DListenerAttributes( 0, &position, &velocity, &forward, &up );
			m_soundSystemScene->GetSoundSystem( )->GetEventSystem( )->set3DListenerAttributes( 
				0, 
				&MathTools::AsFMODVector( parameters[ System::Parameters::PlayerPosition ].As< MathVector3 >( ) ), 
				&velocity,
				&MathTools::AsFMODVector( MathVector3::Forward( ) ), 
				&MathTools::AsFMODVector( MathVector3::Up( ) ) 
				);
		}

		return true;
	}

	void SoundSystemComponent::TriggerEvent( const std::string& eventPath )
	{
		FMOD::Event* event = 0;
		FMOD_RESULT result = m_soundSystemScene->GetSoundSystem( )->GetEventSystem( )->getEvent( eventPath.c_str( ), FMOD_EVENT_DEFAULT, &event );

		if ( result == FMOD_OK )
		{
			result = event->start( );
			m_activeSoundEvents.insert( std::make_pair( eventPath, event ) );
		}
	}

	void SoundSystemComponent::KeyoutEvent( const std::string& eventPath )
	{

		if ( m_activeSoundEvents.find( eventPath ) != m_activeSoundEvents.end( ) )
		{
			FMOD::Event* event = m_activeSoundEvents[ eventPath ];

			int numParameters = 0;
			event->getNumParameters( &numParameters );

			for ( int index = 0; index < numParameters; index++ )
			{
				FMOD::EventParameter* eventParameter = 0;
				event->getParameterByIndex( index, &eventParameter );
				eventParameter->keyOff( );
			}

			m_activeSoundEvents.erase( eventPath );
		}
	}

	void SoundSystemComponent::Destroy( )
	{
		for( SoundEventList::iterator i = m_activeSoundEvents.begin( ); i != m_activeSoundEvents.end( ); )
		{
			( *i ).second->stop( );
			i = m_activeSoundEvents.erase( i );
		}
	}
}