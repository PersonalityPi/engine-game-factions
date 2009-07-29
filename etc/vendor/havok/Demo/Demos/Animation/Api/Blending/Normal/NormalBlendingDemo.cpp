/* 
 * 
 * Confidential Information of Telekinesys Research Limited (t/a Havok). Not for disclosure or distribution without Havok's
 * prior written consent. This software contains code, techniques and know-how which is confidential and proprietary to Havok.
 * Level 2 and Level 3 source code contains trade secrets of Havok. Havok Software (C) Copyright 1999-2009 Telekinesys Research Limited t/a Havok. All Rights Reserved. Use of this software is subject to the terms of an end user license agreement.
 * 
 */

#include <Demos/demos.h>
#include <Demos/Animation/Api/Blending/Normal/NormalBlendingDemo.h>

#include <Common/Base/Reflection/hkClass.h>
#include <Common/Base/Container/LocalArray/hkLocalArray.h>

// Serialization
#include <Common/Serialize/Util/hkLoader.h>
#include <Common/Serialize/Util/hkRootLevelContainer.h>
#include <Common/Base/Reflection/Registry/hkTypeInfoRegistry.h>

// Asset mgt
#include <Demos/DemoCommon/Utilities/Asset/hkAssetManagementUtil.h>

// Skeletal Animation
#include <Animation/Animation/hkaAnimationContainer.h>
#include <Animation/Animation/Rig/hkaSkeleton.h>
#include <Animation/Animation/Rig/hkaSkeletonUtils.h>
#include <Animation/Animation/Playback/hkaAnimatedSkeleton.h>
#include <Animation/Animation/Playback/Control/Default/hkaDefaultAnimationControl.h>
#include <Animation/Animation/Animation/hkaAnimationBinding.h>

// Vertex Deformation
#include <Animation/Animation/Deform/Skinning/hkaMeshBinding.h>

// Scene Data
#include <Common/SceneData/Scene/hkxScene.h>
#include <Common/SceneData/Mesh/hkxMesh.h>
#include <Animation/Animation/Rig/hkaPose.h>

// Common animation Utilities
#include <Demos/DemoCommon/Utilities/Animation/AnimationUtils.h>

// Graphics Stuff
#include <Demos/DemoCommon/DemoFramework/hkTextDisplay.h>
#include <Graphics/Bridge/SceneData/hkgSceneDataConverter.h>

// Graphics Stuff
#include <Graphics/Common/Window/hkgWindow.h>

static const int HK_RUN_ANIM=0;
static const int HK_WALK_ANIM=1;

NormalBlendingDemo::NormalBlendingDemo( hkDemoEnvironment* env )
:	hkDefaultAnimationDemo(env)
{
	// Disable warnings: if no renderer									
	if( hkString::strCmp( m_env->m_options->m_renderer, "n" ) == 0 )
	{
		hkError::getInstance().setEnabled(0xf0d1e423, false); //'Could not realize an inplace texture of type PNG.'
	}

	//
	// Setup the camera
	//
	{
		hkVector4 from( -2,-2,2 );
		hkVector4 to  ( 0,0,0 );
		hkVector4 up  ( 0.0f, 0.0f, 1.0f );
		setupDefaultCameras( env, from, to, up, 0.1f, 100 );
	}

	m_loader = new hkLoader();

	// Convert the scene
	{
		hkString assetFile = hkAssetManagementUtil::getFilePath("Resources/Animation/Scene/hkScene.hkx");
		hkRootLevelContainer* container = m_loader->load( assetFile.cString() );
		HK_ASSERT2(0x27343437, container != HK_NULL , "Could not load asset");
		hkxScene* scene = reinterpret_cast<hkxScene*>( container->findObjectByType( hkxSceneClass.getName() ));

		HK_ASSERT2(0x27343635, scene, "No scene loaded");
		removeLights(m_env);
		env->m_sceneConverter->convert( scene );
	}

	// Get the rig
	{
		hkString assetFile = hkAssetManagementUtil::getFilePath("Resources/Animation/HavokGirl/hkRig.hkx");
		hkRootLevelContainer* container = m_loader->load( assetFile.cString() );
		HK_ASSERT2(0x27343437, container != HK_NULL , "Could not load asset");
		hkaAnimationContainer* ac = reinterpret_cast<hkaAnimationContainer*>( container->findObjectByType( hkaAnimationContainerClass.getName() ));

		HK_ASSERT2(0x27343435, ac && (ac->m_numSkeletons > 0), "No skeleton loaded");
		m_skeleton = ac->m_skeletons[0];
	}

	// Get the animation and the binding
	{
		hkString assetFile = hkAssetManagementUtil::getFilePath("Resources/Animation/HavokGirl/hkRunLoop.hkx");
		hkRootLevelContainer* container = m_loader->load( assetFile.cString() );
		HK_ASSERT2(0x27343437, container != HK_NULL , "Could not load asset");
		hkaAnimationContainer* ac = reinterpret_cast<hkaAnimationContainer*>( container->findObjectByType( hkaAnimationContainerClass.getName() ));

		HK_ASSERT2(0x27343435, ac && (ac->m_numAnimations > 0 ), "No animation loaded");
		m_animation[HK_RUN_ANIM] =  ac->m_animations[0];

		HK_ASSERT2(0x27343435, ac && (ac->m_numBindings > 0), "No binding loaded");
		m_binding[HK_RUN_ANIM] = ac->m_bindings[0];

		assetFile = hkAssetManagementUtil::getFilePath("Resources/Animation/HavokGirl/hkWalkLoop.hkx");
		container = m_loader->load( assetFile.cString() );
		ac = reinterpret_cast<hkaAnimationContainer*>( container->findObjectByType( hkaAnimationContainerClass.getName() ));

		HK_ASSERT2(0x27343435, ac && (ac->m_numAnimations > 0 ), "No animation loaded");
		m_animation[HK_WALK_ANIM] =  ac->m_animations[0];

		HK_ASSERT2(0x27343435, ac && (ac->m_numBindings > 0), "No binding loaded");
		m_binding[HK_WALK_ANIM] = ac->m_bindings[0];

	}

	// Convert the skin
	{
		const char* skinFile = "Resources/Animation/HavokGirl/hkLowResSkin.hkx";
		hkString assetFile = hkAssetManagementUtil::getFilePath( skinFile );
		hkRootLevelContainer* container = m_loader->load( assetFile.cString() );
		HK_ASSERT2(0x27343437, container != HK_NULL , "Could not load asset");

		hkxScene* scene = reinterpret_cast<hkxScene*>( container->findObjectByType( hkxSceneClass.getName() ));
		HK_ASSERT2(0x27343435, scene , "No scene loaded");

		hkaAnimationContainer* ac = reinterpret_cast<hkaAnimationContainer*>( container->findObjectByType( hkaAnimationContainerClass.getName() ));
		HK_ASSERT2(0x27343435, ac && (ac->m_numSkins > 0), "No skins loaded");

		m_numSkinBindings = ac->m_numSkins;
		m_skinBindings = ac->m_skins;

		// Make graphics output buffers for the skins
		env->m_sceneConverter->convert( scene );

	}

	// Create the skeleton
	m_skeletonInstance = new hkaAnimatedSkeleton( m_skeleton );

	// Set the fill threshold
	m_skeletonInstance->setReferencePoseWeightThreshold( 0.05f );

	// Grab the animations
	for (int i=0; i < NUM_ANIMS; i++)
	{
		m_control[i] = new hkaDefaultAnimationControl( m_binding[i] );
		m_control[i]->setMasterWeight( 0.0f );
		m_control[i]->setPlaybackSpeed( 1.0f );

		m_skeletonInstance->addAnimationControl( m_control[i] );
		m_control[i]->removeReference();
	}

	setupGraphics( );

}

NormalBlendingDemo::~NormalBlendingDemo()
{
	// Re-enable warnings									
	hkError::getInstance().setEnabled(0xf0d1e423, true); 

	m_skeletonInstance->removeReference();

	delete m_loader;

	hkDefaultDemo::setupLights(m_env); // assumes the hkx will have some.
}

hkDemo::Result NormalBlendingDemo::stepDemo()
{

	hkReal runWeight = m_control[HK_RUN_ANIM]->getMasterWeight();

	// Update input
	{
		const  hkReal inc = 0.01f;
		const hkgPad* pad = m_env->m_gamePad;
		if ((pad->getButtonState() & HKG_PAD_DPAD_UP) != 0)
			runWeight+=inc;
		if ((pad->getButtonState() & HKG_PAD_DPAD_DOWN) != 0)
			runWeight-=inc;

		runWeight = hkMath::min2(runWeight, 1.0f);
		runWeight = hkMath::max2(runWeight, 0.0f);
	}

	const hkReal walkWeight = 1.0f - runWeight;

	// Set the animation weights
	{
		m_control[HK_RUN_ANIM]->setMasterWeight( runWeight );
		m_control[HK_WALK_ANIM]->setMasterWeight( walkWeight );
	}

	// Sync playback speeds
	{
		const hkReal runPeriod = m_control[HK_RUN_ANIM]->getAnimationBinding()->m_animation->m_duration;
		const hkReal walkPeriod = m_control[HK_WALK_ANIM]->getAnimationBinding()->m_animation->m_duration;

		const hkReal totalW = runWeight+walkWeight+1e-6f;
		const hkReal walkP = walkWeight / totalW;
		const hkReal runP = runWeight / totalW;
		const hkReal runWalkRatio = runPeriod / walkPeriod;
		m_control[HK_RUN_ANIM]->setPlaybackSpeed( (1-runP) * runWalkRatio + runP );
		m_control[HK_WALK_ANIM]->setPlaybackSpeed( (1-walkP) * (1.0f / runWalkRatio) + walkP );
	}

	// Show blend ratio
	{
		char buf[255];
		hkString::sprintf(buf, "run:%0.3f walk:%0.3f", runWeight, walkWeight);

		const int h = m_env->m_window->getHeight();
		m_env->m_textDisplay->outputText( buf, 20, h-40, 0xffffffff, 1);
	}

	// Advance the active animations
	m_skeletonInstance->stepDeltaTime( m_timestep );

	const int boneCount = m_skeleton->m_numBones;



	// Sample the active animations and combine into a single pose
	hkaPose pose(m_skeleton);
	m_skeletonInstance->sampleAndCombineAnimations( pose.accessUnsyncedPoseLocalSpace().begin(), pose.getFloatSlotValues().begin()  );
	AnimationUtils::drawPose( pose, hkQsTransform::getIdentity() );

	// Construct the composite world transform
	hkLocalArray<hkTransform> compositeWorldInverse( boneCount );
	compositeWorldInverse.setSize( boneCount );

	const hkArray<hkQsTransform>& poseInWorld = pose.getSyncedPoseModelSpace();

	// Skin the meshes
	for (int i=0; i < m_numSkinBindings; i++)
	{
		// assumes either a straight map (null map) or a single one (1 palette)
		hkInt16* usedBones = m_skinBindings[i]->m_mappings? m_skinBindings[i]->m_mappings[0].m_mapping : HK_NULL;
		int numUsedBones = usedBones? m_skinBindings[i]->m_mappings[0].m_numMapping : boneCount;

		// Multiply through by the bind pose inverse world inverse matrices
		for (int p=0; p < numUsedBones; p++)
		{
			int boneIndex = usedBones? usedBones[p] : p;
			compositeWorldInverse[p].setMul( poseInWorld[ boneIndex ], m_skinBindings[i]->m_boneFromSkinMeshTransforms[ boneIndex ] );
		}

		AnimationUtils::skinMesh( *m_skinBindings[i]->m_mesh, hkTransform::getIdentity(), compositeWorldInverse.begin(), *m_env->m_sceneConverter );
	}

	return hkDemo::DEMO_OK;
}

#if defined(HK_COMPILER_MWERKS)
#	pragma force_active on
#	pragma fullpath_file on
#endif

static const char helpString[] = \
"Use the dPad to control the balance between the run and walk animations. \n" \
"The playback speeds of the animations are also adjusted to ensure a smooth blend.";

HK_DECLARE_DEMO(NormalBlendingDemo, HK_DEMO_TYPE_ANIMATION | HK_DEMO_TYPE_SERIALIZE | HK_DEMO_TYPE_CRITICAL, "Animation Blending", helpString);

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
