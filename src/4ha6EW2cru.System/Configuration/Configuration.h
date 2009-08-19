/*!
*  @company Black Art Studios
*  @author Nicholas Kostelnik
*  @file   Configuration.h
*  @date   2009/04/25
*/
#pragma once
#ifndef CONFIGURATION_H
#define CONFIGURATION_H

#include "IConfiguration.hpp"
#include "IConfigurationFile.hpp"

#include "../Export.hpp"

namespace Configuration
{
	/*! 
	 *  Contains configuration items from the file system
	 */
	class ClientConfiguration : public IConfiguration
	{
		typedef std::pair< std::string, AnyType > KeyValuePair;
		typedef std::multimap< std::string, KeyValuePair > DefaultPropertyList;

	public:

		/*! Default Destructor
		 *
		 *  @return ()
		 */
		GAMEAPI ~ClientConfiguration( );


		/*! Default Constructor
		 *
		 * @return (  )
		 */
		ClientConfiguration( )
			: m_configFile( 0 )
		{

		}


		/*! Loads the configuration from the specified file
		 *
		 *  @param[in] const std::string & filePath
		 *  @return (ClientConfiguration*)
		 */
		static GAMEAPI IConfiguration* Load( const std::string& filePath );


		/*! Finds a configuration item based on the specified section and key
		 *
		 *  @param[in] const std::string & section
		 *  @param[in] const std::string & key
		 *  @return (AnyType)
		 */
		GAMEAPI AnyType Find( const std::string& section, const std::string& key );


		/*! Finds an entire section
		*
		* @param[in] const std::string & section
		* @return ( AnyType::AnyTypeMap )
		*/
		GAMEAPI AnyType::AnyTypeMap FindSection( const std::string& section );


		/*! Sets the default value for a configuration item
		 *
		 *  @param[in] const std::string & section
		 *  @param[in] const std::string & key
		 *  @param[in] const AnyType & value
		 *  @return (void)
		 */
		GAMEAPI void SetDefault( const std::string& section, const std::string& key, const AnyType& value );


		/*! Sets the value for a configuration item
		 *
		 *  @param[in] const std::string & section
		 *  @param[in] const std::string & key
		 *  @param[in] const AnyType & value
		 *  @return (void)
		 */
		GAMEAPI void Set( const std::string& section, const std::string& key, const AnyType& value );

	private:

		ClientConfiguration( IConfigurationFile* configFile )
			: m_configFile( configFile )
		{

		};

		IConfigurationFile* m_configFile;
		DefaultPropertyList m_defaultPropertyList;

		ClientConfiguration( const ClientConfiguration & copy ) { };
		ClientConfiguration & operator = ( const ClientConfiguration & copy ) { return *this; };
		
	};
};

#endif
