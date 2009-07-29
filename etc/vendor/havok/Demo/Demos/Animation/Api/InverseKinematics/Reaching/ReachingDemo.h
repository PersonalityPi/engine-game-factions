/* 
 * 
 * Confidential Information of Telekinesys Research Limited (t/a Havok). Not for disclosure or distribution without Havok's
 * prior written consent. This software contains code, techniques and know-how which is confidential and proprietary to Havok.
 * Level 2 and Level 3 source code contains trade secrets of Havok. Havok Software (C) Copyright 1999-2009 Telekinesys Research Limited t/a Havok. All Rights Reserved. Use of this software is subject to the terms of an end user license agreement.
 * 
 */

#ifndef REACHING_DEMO_H
#define REACHING_DEMO_H

#include <Demos/DemoCommon/DemoFramework/hkDefaultAnimationDemo.h>
#include <Demos/DemoCommon/Utilities/Animation/AnimationUtils.h>


class ReachingDemo : public hkDefaultAnimationDemo
{
	public:

		HK_DECLARE_CLASS_ALLOCATOR( HK_MEMORY_CLASS_DEMO );

		ReachingDemo( hkDemoEnvironment* env );

		~ReachingDemo();

		Result stepDemo(); 

	private:

		class hkLoader* m_loader;

		class hkaSkeleton* m_skeleton;

		class hkaAnimation* m_animation;

		class hkaMeshBinding** m_skinBindings;

		hkInt32 m_numSkinBindings;

		class hkaAnimatedSkeleton* m_skeletonInstance;

		class hkaAnimationBinding* m_binding;

		class hkaDefaultAnimationControl* m_control;

		// the hand poistion the IK attempts to reach
		hkVector4 m_targetPosition;

		// bone indices
		hkInt16 m_lFingerIndex;
		hkInt16 m_lClavicleIndex;

};

#endif // REACHING_DEMO_H

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
