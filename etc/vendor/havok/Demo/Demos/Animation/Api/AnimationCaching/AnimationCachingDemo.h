/* 
 * 
 * Confidential Information of Telekinesys Research Limited (t/a Havok). Not for disclosure or distribution without Havok's
 * prior written consent. This software contains code, techniques and know-how which is confidential and proprietary to Havok.
 * Level 2 and Level 3 source code contains trade secrets of Havok. Havok Software (C) Copyright 1999-2009 Telekinesys Research Limited t/a Havok. All Rights Reserved. Use of this software is subject to the terms of an end user license agreement.
 * 
 */

#ifndef ANIMATION_CACHING_DEMO_H
#define ANIMATION_CACHING_DEMO_H

#include <Demos/DemoCommon/DemoFramework/hkDefaultAnimationDemo.h>
#include <Animation/Animation/Animation/hkaAnimation.h>

#define NUM_ANIMS 4

#define NUM_SKELETONS 36

class AnimationCachingDemo : public hkDefaultAnimationDemo
{
	public:

		HK_DECLARE_CLASS_ALLOCATOR( HK_MEMORY_CLASS_DEMO );

		AnimationCachingDemo( hkDemoEnvironment* env );

		~AnimationCachingDemo();

		Result stepDemo();

	private:
		
		class hkaAnimation* createCompressedAnimation( class hkaAnimation* skeletalAnim, hkEnum< hkaAnimation::AnimationType, hkInt32 > type );

		class hkLoader* m_loader;

		class hkaSkeleton* m_skeleton;

		class hkaAnimation* m_animation[NUM_ANIMS];

		class hkaAnimationBinding* m_binding[NUM_ANIMS];

		class hkaDefaultChunkCache* m_cache;

		hkArray<class hkaAnimatedSkeleton*> m_activeSkeletons;

		hkUint64 m_totalSampleTime;
		hkUint64 m_totalSampleCount;

		hkBool m_useCaching;
};

#endif //ANIMATION_CACHING_DEMO_H

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
