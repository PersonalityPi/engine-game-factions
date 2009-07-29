/* 
 * 
 * Confidential Information of Telekinesys Research Limited (t/a Havok). Not for disclosure or distribution without Havok's
 * prior written consent. This software contains code, techniques and know-how which is confidential and proprietary to Havok.
 * Level 2 and Level 3 source code contains trade secrets of Havok. Havok Software (C) Copyright 1999-2009 Telekinesys Research Limited t/a Havok. All Rights Reserved. Use of this software is subject to the terms of an end user license agreement.
 * 
 */

#ifndef HK_GRAPHICS_DISPLAY_CONTEXT_DX9_H
#define HK_GRAPHICS_DISPLAY_CONTEXT_DX9_H

#include <Graphics/Common/DisplayContext/hkgDisplayContext.h>
#include <Graphics/Dx9/Shared/Window/hkgWindowDX9.h>

class hkgDisplayContextDX9 : public hkgDisplayContext
{
public:

	static hkgDisplayContext* createDisplayContextDX9(hkgWindow* owner)
	{
		return new hkgDisplayContextDX9(owner);
	}
	
	virtual void setLightingState(bool on);
	virtual void setTexture2DState(bool on);
	virtual void setBlendState(bool on);
	virtual void setDepthReadState(bool on);
	virtual void setDepthWriteState(bool on);
	virtual void setCullFaceState(bool on);
	virtual void setWireframeState(bool on);

	virtual void setLightState(int light, bool on);

	virtual void popMatrix();
	virtual void pushMatrix();
	virtual void multMatrix( const float* m);
	virtual void beginGroup(HKG_IMM_GROUP type);
	virtual void  setCurrentColor3( const float* c);
	virtual void  setCurrentColor4( const float* c);
	virtual void  setCurrentColorPacked( unsigned int c);
	virtual void  setCurrentTextureCoord(const float* uv);
	virtual void  setCurrentNormal(const float* n);
	virtual void  setCurrentPosition(const float* p);
	virtual void endGroup(bool useCurrentShaders = false);
	virtual void flush();

	inline LPDIRECT3DDEVICE9 getDevice();
	inline const LPDIRECT3DDEVICE9 getDevice() const;

	void initD3DState(); //needs to be called not only on ctor, but also after device::Reset()

	// default point sprite unspecified size
	void setPointSpriteSize( float size );

	// enable full texture coordinate range texturing
	void setPointSpriteTextureState( bool on );

	// enable per point sprite scaling
	void setPointSpriteScalingState( bool on );

	// set the minimum and maximum point sprite sizes
	void setPointSpriteMinimumSize( float size );
	void setPointSpriteMaximumSize( float size );

	// set the various scaling factors for use in: S(s) = V(h) * S(i) * 1 / sqrt( A + ( B * D(e) ) + ( C * D(e)^2 ) )
	void setPointSpriteScalingFactorA( float a );
	void setPointSpriteScalingFactorB( float b );
	void setPointSpriteScalingFactorC( float c );

	void setDepthBias( float offset );
	void setDepthBiasSlope( float slope );
	float getDepthBias( );
	float getDepthBiasSlope( );

	inline void setCurrentInstanceObject(class hkgInstancedDisplayObjectDX9* inst) { m_currentInstance = inst; }
	inline hkgInstancedDisplayObjectDX9* getCurrentInstanceObject() { return m_currentInstance; }

	void invalidateDynamicTextures();
	void restoreDynamicTextures();

	virtual void setMaxAnisotropy(int i); // usually 1 to 16 (on platforms that support it and for textures that you enable it on)

protected:

	hkgDisplayContextDX9(hkgWindow* owner); 
	virtual ~hkgDisplayContextDX9();
	
	struct VertInfo
	{
		HKG_DECLARE_NONVIRTUAL_CLASS_ALLOCATOR( VertInfo );

		float x,y,z;
		float nx, ny, nz; 
		DWORD c;
		float tu, tv;
	};

	HKG_IMM_GROUP		m_immMode;
	hkArray<VertInfo>	m_immVerts; 
	bool				m_immGroup;
	hkArray<float>		m_matrixStack;  // every 16 floats == matrix. 
	float				m_curNorm[3];
	float				m_curUV[2];
	DWORD				m_curColor;

	float				m_depthBias;
	float				m_depthBiasSlope;

	int					m_lastLockImmVert;
	LPDIRECT3DDEVICE9	m_device;
	LPDIRECT3DVERTEXBUFFER9	m_pVB;		// a large vb to hold our imm lines etc. We can't use DrawPrumUP on some consoles.

	hkgInstancedDisplayObjectDX9* m_currentInstance;
};

#include <Graphics/Dx9/Shared/DisplayContext/hkgDisplayContextDX9.inl>

#endif //HK_GRAPHICS_DISPLAY_CONTEXT_DX9_H
	

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
