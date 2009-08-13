/*!
*  @company Black Art Studios
*  @author Nicholas Kostelnik
*  @file   GeometrySystem.h
*  @date   2009/04/26
*/
#pragma once
#ifndef GEOMETRYSYSTEM_H
#define GEOMETRYSYSTEM_H

#include "System/SystemType.hpp"
#include "System/ISystem.hpp"
#include "System/ISystemScene.hpp"

#include "Service/IService.hpp"

namespace Geometry
{
	/*! 
	 *  The Geometry System
	 */
	class GeometrySystem : public ISystem
	{

	public:

		/*! Default Destructor
		 *
		 *  @return ()
		 */
		~GeometrySystem( ) { };


		/*! Default Constructor
		 *
		 *  @return ()
		 */
		GeometrySystem( ) { };


		/*! Initializes the System
		*
		*  @return (void)
		*/
		inline void Initialize( Configuration::IConfiguration* configuration ) { };


		/*! Steps the System's internal data
		*
		*  @param[in] float deltaMilliseconds
		*  @return (void)
		*/
		inline void Update( float deltaMilliseconds ) { };


		/*! Releases internal data of the System
		*
		*  @return (System::Types::Type)
		*/
		inline void Release( ) { };


		/*! Returns the type of the System
		*
		*  @return (System::Types::Type)
		*/
		inline System::Types::Type GetType( ) const { return System::Types::GEOMETRY; };


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

	private:

		GeometrySystem( const GeometrySystem & copy ) { };
		GeometrySystem & operator = ( const GeometrySystem & copy ) { return *this; };

	};
};


#endif
