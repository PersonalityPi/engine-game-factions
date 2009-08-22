/*!
*  @company Black Art Studios
*  @author Nicholas Kostelnik
*  @file   SoundSystem.h
*  @date   2009/04/27
*/
#pragma once
#ifndef SOUNDSYSTEM_H
#define SOUNDSYSTEM_H

#include "Service/IService.hpp"
#include "Configuration/IConfiguration.hpp"

#include "ISoundSystem.hpp"

namespace Sound
{
	/*!
	 *  The Sound System 
	 */
	class SoundSystem : public ISoundSystem, public Services::IService
	{

	public:

		/*! Default Destructor
		 *
		 *  @return ()
		 */
		~SoundSystem( ) { };


		/*! Default Constructor
		 *
		 *  @return ()
		 */
		SoundSystem( )
			: m_fmodSystem( 0 )
			, m_eventSystem( 0 )
			, m_configuration( 0 )
		{

		}


		/*! Initializes the System
		*
		*  @return (void)
		*/
		void Initialize( Configuration::IConfiguration* configuration );


		/*! Steps the System's internal data
		*
		*  @param[in] float deltaMilliseconds
		*  @return (void)
		*/
		void Update( float deltaMilliseconds );


		/*! Releases internal data of the System
		*
		*  @return (System::Types::Type)
		*/
		void Release( );


		/*! Messages the system with a command
		*
		* @param[in] const std::string & message
		* @param[in] AnyType::AnyTypeMap parameters
		* @return ( void )
		*/
		AnyType::AnyTypeMap ProcessMessage( const System::MessageType& message, AnyType::AnyTypeMap parameters );


		/*! Returns the type of the System
		*
		*  @return (System::Types::Type)
		*/
		inline System::Types::Type GetType( ) const { return System::Types::SOUND; };


		/*! Creates a System Scene
		*
		*  @return (ISystemScene*)
		*/
		ISystemScene* CreateScene( );


		/*! Gets the System's Properties
		*
		*  @return (AnyTypeMap)
		*/
		inline AnyType::AnyTypeMap GetAttributes( ) const { return AnyType::AnyTypeMap( ); };


		/*! Sets a System Property
		*
		*  @param[in] const std::string & name
		*  @param[in] AnyType value
		*  @return (void)
		*/
		inline void SetAttribute( const std::string& name, AnyType value ) { };		


		/*! Returns the FMOD Event System
		 *
		 *  @return (FMOD::EventSystem*)
		 */
		FMOD::EventSystem* GetEventSystem( ) const { return m_eventSystem; };

	private:

		SoundSystem( const SoundSystem & copy ) { };
		SoundSystem & operator = ( const SoundSystem & copy ) { return *this; };

		FMOD::System* m_fmodSystem;
		FMOD::EventSystem* m_eventSystem;
		Configuration::IConfiguration* m_configuration;

		static FMOD_RESULT F_CALLBACK FileOpen( const char* name, int unicode, unsigned int* filesize, void** handle, void** userdata );
		static FMOD_RESULT F_CALLBACK FileClose( void* handle, void*  userdata );
		static FMOD_RESULT F_CALLBACK FileRead( void* handle, void* buffer, unsigned int sizebytes, unsigned int* bytesread, void* userdata );
		static FMOD_RESULT F_CALLBACK FileSeek( void* handle, unsigned int pos, void* userdata );
	};
};

#endif
