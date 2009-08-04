/*!
*  @company Black Art Studios
*  @author Nicholas Kostelnik
*  @file   PhysicsSystemCharacterComponent.h
*  @date   2009/04/26
*/
#pragma once
#ifndef PHYSICSSYSTEMCHARACTERCOMPONENT_H
#define PHYSICSSYSTEMCHARACTERCOMPONENT_H

#include "PhysicsSystemComponent.h"

#include <Physics/Utilities/CharacterControl/CharacterRigidBody/hkpCharacterRigidBody.h>
#include <Physics/Utilities/CharacterControl/StateMachine/hkpDefaultCharacterStates.h>

namespace Physics
{
	/*! 
	 *  A representation of a Character within the Physics System
	 */
	class PhysicsSystemCharacterComponent : public PhysicsSystemComponent
	{

	public:

		/*! Default Destructor
		 *
		 *  @return ()
		 */
		~PhysicsSystemCharacterComponent( );


		/*! Default Constructor
		 *
		 *  @param[in] const std::string & name
		 *  @param[in] HavokPhysicsSystemScene * scene
		 *  @param[in] int componentId
		 *  @return ()
		 */
		PhysicsSystemCharacterComponent( const std::string& name, HavokPhysicsSystemScene* scene )
			: PhysicsSystemComponent( name, scene )
			, m_characterBody( 0 )
			, m_characterContext( 0 )
			, m_framesInAir( 0 )
			, m_isMovingForward( false )
			, m_isMovingBackward( false )
			, m_isMovingLeft( false )
			, m_isMovingRight( false )
			, m_previousGround( new hkpSurfaceInfo( ) )
		{

		}


		/*! Initializes the Component
		*
		*  @param[in] AnyType::AnyValueMap properties
		*  @return (void)
		*/
		void Initialize( );


		/*! Steps the internal data of the Component
		*
		*  @param[in] float deltaMilliseconds
		*  @return (void)
		*/
		void Update( const float& deltaMilliseconds );

		AnyType Message( const System::Message& message, AnyType::AnyTypeMap parameters );

	private:

		hkpCharacterContext* m_characterContext;
		hkpCharacterRigidBody* m_characterBody;
		hkpCharacterInput m_characterInput;
		hkpSurfaceInfo* m_previousGround;

		bool m_isMovingForward;
		bool m_isMovingBackward;
		bool m_isMovingLeft;
		bool m_isMovingRight;

		int m_framesInAir;

		PhysicsSystemCharacterComponent & operator = ( const PhysicsSystemCharacterComponent & copy ) { return *this; };

	};
};

#endif
