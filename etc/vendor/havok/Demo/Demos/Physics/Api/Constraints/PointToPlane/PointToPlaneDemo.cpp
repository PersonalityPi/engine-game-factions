/* 
 * 
 * Confidential Information of Telekinesys Research Limited (t/a Havok). Not for disclosure or distribution without Havok's
 * prior written consent. This software contains code, techniques and know-how which is confidential and proprietary to Havok.
 * Level 2 and Level 3 source code contains trade secrets of Havok. Havok Software (C) Copyright 1999-2009 Telekinesys Research Limited t/a Havok. All Rights Reserved. Use of this software is subject to the terms of an end user license agreement.
 * 
 */

#include <Demos/demos.h>
#include <Demos/Physics/Api/Constraints/PointToPlane/PointToPlaneDemo.h>


// We will need these collision agents
#include <Physics/Collide/Agent/ConvexAgent/BoxBox/hkpBoxBoxAgent.h>

// We need to create a constraint
#include <Physics/Dynamics/Constraint/Bilateral/PointToPlane/hkpPointToPlaneConstraintData.h>

// We want to turn on constraint viewers for this demo
#include <Physics/Utilities/VisualDebugger/Viewer/Dynamics/hkpConstraintViewer.h>


PointToPlaneDemo::PointToPlaneDemo(hkDemoEnvironment* env)
:	hkDefaultPhysicsDemo(env)
{

	//
	// Setup the camera
	//
	{
		hkVector4 from(5.0f, 2.0f, 10.0f);
		hkVector4 to  (2.0f, 0.0f,  0.0f);
		hkVector4 up  (0.0f, 1.0f,  0.0f);
		setupDefaultCameras( env, from, to, up );
	}

	//
	// Create the world
	//
	{
		hkpWorldCinfo info;
		info.setupSolverInfo(hkpWorldCinfo::SOLVER_TYPE_4ITERS_MEDIUM); 
		info.setBroadPhaseWorldSize( 100.0f );
		info.m_enableDeactivation = false;
		m_world = new hkpWorld( info );
		m_world->lock();

				// Register the single agent required (a hkpBoxBoxAgent)
		hkpAgentRegisterUtil::registerAllAgents( m_world->getCollisionDispatcher() );

		//
		// Create constraint viewer
		//
		m_debugViewerNames.pushBack( hkpConstraintViewer::getName() );
		hkpConstraintViewer::m_scale = 1.0f;
	
		setupGraphics();
	}

	//
	// Create vectors to be used for setup
	//
	hkVector4 halfSize (0.5f, 0.5f, 0.5f);
	hkVector4 position1(0.f,0.f,0.f);
	hkVector4 position2(3.0f,-0.5f,0.f);
	
	//
	// Create Box Shape
	//
	hkpBoxShape* boxShape;
	{
		boxShape = new hkpBoxShape( halfSize , 0 );
	}

	//
	// Create fixed rigid body
	//
	hkpRigidBody* fixedBody;
	{
		hkpRigidBodyCinfo info;
		info.m_position = position1;
		info.m_shape = boxShape;
		info.m_motionType = hkpMotion::MOTION_FIXED;
		fixedBody = new hkpRigidBody(info);
		m_world->addEntity(fixedBody);
		fixedBody->removeReference();	
	}

	//
	// Create movable rigid body
	//
	hkpRigidBody* moveableBody;
	{

		hkpRigidBodyCinfo info;
		info.m_position = position2;
		info.m_shape = boxShape;
		
			// Compute the box inertia tensor
		hkpMassProperties massProperties;
		info.m_mass = 10.0f;
		hkpInertiaTensorComputer::computeBoxVolumeMassProperties(halfSize, info.m_mass, massProperties);
		info.m_inertiaTensor = massProperties.m_inertiaTensor;
		info.m_centerOfMass = massProperties.m_centerOfMass;
		info.m_motionType = hkpMotion::MOTION_BOX_INERTIA;

		moveableBody = new hkpRigidBody(info);
		m_world->addEntity(moveableBody);
		moveableBody->removeReference();	
	}

	//
	//	Cleanup shared shape references
	//
	boxShape->removeReference();
	boxShape = HK_NULL;

	
	//
	// Create point to plane constraint
	// 
	{
		hkpPointToPlaneConstraintData* plane = new hkpPointToPlaneConstraintData();

		hkVector4 up(0.0f, 1.0f, 0.0f);

		// Create constraint
		hkVector4 pivotW; pivotW.setAdd4(position2, hkVector4(-0.5f, 0.5f, 0.5f));
		plane->setInWorldSpace(moveableBody->getTransform(), fixedBody->getTransform(), pivotW, up);

		//
		//	Create and add the constraint
		//
		{
			hkpConstraintInstance* constraint = new hkpConstraintInstance( moveableBody, fixedBody, plane );
			m_world->addConstraint(constraint);
			constraint->removeReference();
		}		

		plane->removeReference();  
	}

	m_world->unlock();
}


PointToPlaneDemo::~PointToPlaneDemo()
{

}

hkDemo::Result PointToPlaneDemo::stepDemo()
{
	return hkDefaultPhysicsDemo::stepDemo();
}

#if defined(HK_COMPILER_MWERKS)
#	pragma force_active on
#	pragma fullpath_file on
#endif

static const char helpString[] = \
"This constraint allows you to specify a plane of free movement orientated relatively to body A. "\
"Then you specify a pivot point on the body B, which will be restricted to move strictly in that plane. "\
"The constraint does not implement any limit or  rotational restrictions.";

HK_DECLARE_DEMO(PointToPlaneDemo, HK_DEMO_TYPE_PRIME, "A single Point To Plane constraint", helpString);

/*
* Havok SDK - NO SOURCE PC DOWNLOAD, BUILD(#20090216)
* 
* Confidential Information of Havok.  (C) Copyright 1999-2009
* Telekinesys Research Limited t/a Havok. All Rights Reserved. The Havok
* Logo, and the Havok buzzsaw logo are trademarks of Havok.  Title, ownership
* rights, and intellectual property rights in the Havok software remain in
* Havok and/or its suppliers.
* 
* Use of this software for evaluation purposes is subject to and indicates
* acceptance of the End User licence Agreement for this product. A copy of
* the license is included with this software and is also available at www.havok.com/tryhavok.
* 
*/
