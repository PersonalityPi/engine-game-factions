/*!
*  @company Black Art Studios
*  @author Nicholas Kostelnik
*  @file   IPlatformManager.h
*  @date   2009/04/25
*/
#pragma once
#ifndef IPLATFORMMANAGER_H
#define IPLATFORMMANAGER_H

#include <string>
#include "IClock.hpp"
#include "../System/AnyType.hpp"

#include "../IO/IPathInformation.hpp"

namespace Platform
{
	/*! 
	 *  Interfaces with Specific Api's on the Target Platform
	 */
	class IPlatformManager
	{

	public:

		/*! Default Destructor
		 *
		 *  @return ()
		 */
		virtual ~IPlatformManager( ) { };


		/*! Initializes the Platform Manager and all Sub Components
		*
		* @return ( void )
		*/
		virtual void Initialize( ) = 0;


		/*! Creates an Interactive Window for the Player
		 *
		 *  @param[in] const std::string & title
		 *  @param[in] const int & width
		 *  @param[in] const int & height
		 *  @param[in] const bool & fullScreen
		 *  @return (void)
		 */
		virtual void CreateInteractiveWindow( const std::string& title, const int& width, const int& height, const bool& fullScreen ) = 0;


		/*! Closes the Open Window
		 *
		 *  @return (void)
		 */
		virtual void CloseWindow( ) = 0;


		/*! Creates a Console Window
		 *
		 *  @return (void)
		 */
		virtual void CreateConsoleWindow( ) = 0;


		/*! Outputs the given message to std::cout
		*
		* @param[in] const std::string & message
		* @return ( void )
		*/
		virtual void OutputToConsole( const std::string& message ) = 0;


		/*! Steps internal data structures
		 *
		 *  @param[in] float deltaMilliseconds
		 *  @return (void)
		 */
		virtual void Update( const float& deltaMilliseconds ) = 0;


		/*! Gets the Id of the active game window
		 *
		 *  @return (size_t)
		 */
		virtual size_t GetWindowId( ) const = 0;

		
		/*! Returns the Clock from the given Platform
		*
		* @return ( IClock& )
		*/
		virtual IClock& GetClock( ) = 0;


		/*! Outputs a message to the Debug Console
		 *
		 *  @return (void)
		 */
		virtual void OutputDebugMessage( const std::string& message ) = 0;


		/*! Returns a map of the command line options used when launching the game
		 *
		 *  @return (AnyType::AnyTypeMap)
		 */
		virtual AnyType::AnyTypeMap GetProgramOptions( ) const = 0;


		/*! Generates a unique UUID
		*
		* @return ( std::string )
		*/
		virtual std::string GenUUID( ) const = 0;


		/*! Returns the Path Information for the platform
		*
		* @return ( IPathInformation* )
		*/
		virtual IO::IPathInformation* GetPathInformation( ) = 0;
	};
};

#endif
