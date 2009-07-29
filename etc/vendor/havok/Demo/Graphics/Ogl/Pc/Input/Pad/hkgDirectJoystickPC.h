/* 
 * 
 * Confidential Information of Telekinesys Research Limited (t/a Havok). Not for disclosure or distribution without Havok's
 * prior written consent. This software contains code, techniques and know-how which is confidential and proprietary to Havok.
 * Level 2 and Level 3 source code contains trade secrets of Havok. Havok Software (C) Copyright 1999-2009 Telekinesys Research Limited t/a Havok. All Rights Reserved. Use of this software is subject to the terms of an end user license agreement.
 * 
 */

#ifndef HK_GRAPHICS_DIRECT_JOYSTICK_PC_H
#define HK_GRAPHICS_DIRECT_JOYSTICK_PC_H

#include <Graphics/Common/Input/Pad/hkgPad.h>

#define STRICT 1
#define DIRECTINPUT_VERSION 0x0800
#define WIN32_LEAN_AND_MEAN		// Exclude rarely-used stuff from Windows headers
#undef _WIN32_WINNT
#define _WIN32_WINNT 0x0500	  // win2000
#undef _WIN32_WINDOWS 
#define _WIN32_WINDOWS 0x0500 // win2000
#undef WINVER	
#define WINVER 0x0500	      // win2000


#include <windows.h>
#include <basetsd.h>
#include <dinput.h>


typedef unsigned int HKG_DIRECT_JOYSTICK_CAPS;
// can be a combination depending on the actual device caps
#define HKG_DIRECT_JOYSTICK_NONE	0
#define HKG_DIRECT_JOYSTICK_XAXIS	1
#define HKG_DIRECT_JOYSTICK_YAXIS	1<<1
#define HKG_DIRECT_JOYSTICK_ZAXIS	1<<2
#define HKG_DIRECT_JOYSTICK_XROT	1<<3
#define HKG_DIRECT_JOYSTICK_YROT	1<<4
#define HKG_DIRECT_JOYSTICK_ZROT	1<<5
#define HKG_DIRECT_JOYSTICK_SLIDER0	1<<6
#define HKG_DIRECT_JOYSTICK_SLIDER1	1<<7
#define HKG_DIRECT_JOYSTICK_POV0	1<<8
#define HKG_DIRECT_JOYSTICK_POV1	1<<9
#define HKG_DIRECT_JOYSTICK_POV2	1<<10
#define HKG_DIRECT_JOYSTICK_POV3	1<<11


typedef unsigned int HKG_DIRECT_JOYSTICK_TYPE;
// can be a combination depending on the actual device caps
#define HKG_DIRECT_JOYSTICK_TYPE_UNKNOWN		0
#define HKG_DIRECT_JOYSTICK_TYPE_NORMAL			1
#define HKG_DIRECT_JOYSTICK_TYPE_WHEEL			2
#define HKG_DIRECT_JOYSTICK_TYPE_GAMEPAD		4
#define HKG_DIRECT_JOYSTICK_TYPE_FLIGHTSTICK	8



// A DirectInput 8 device wrapper. 

class hkgDirectJoystickPC
{
	friend class hkgWindowPC;

public:

	HKG_DECLARE_NONVIRTUAL_CLASS_ALLOCATOR( hkgDirectJoystickPC );

	hkgDirectJoystickPC(HWND owner, LPDIRECTINPUTDEVICE8 device);
	~hkgDirectJoystickPC();

	static void createJoysticks( HWND owner, hkgDirectJoystickPC** joysticks, int numDesired, int& numCreated );
	static void destroyDI();

	inline bool isValid();

	// call this a regular intervals. State flips at a higher frequencey will not be detected. 30hz recomended.
	bool poll();

	//
	// Cur state
	//

	// range[ 0.0f -> 1.0f ]	
	inline float getXAxis() const;

	// range[ 0.0f -> 1.0f ]	
	inline float getYAxis() const;

	// range[ 0.0f -> 1.0f ]	
	inline float getZAxis() const;

	// range[ 0.0f -> 1.0f ]	
	inline float getXRotation() const;

	// range[ 0.0f -> 1.0f ]	
	inline float getYRotation() const;

	// range[ 0.0f -> 1.0f ]	
	inline float getZRotation() const;

	// 2 sliders, range[ 0.0f -> 1.0f ]
	inline float getSlider(unsigned int s) const;

	// returns degrees from north (away from user), clockwize
	// so 0.0f is straight ahead, 90.0f is right, 270.0f is left etc
	// -1.0f is centered
	inline float getPov(unsigned int s) const;

	// 128 buttons 
	inline bool getButton(unsigned int b) const; 



	//
	// Prev state
	//

	// range[ 0.0f -> 1.0f ]	
	inline float getPrevXAxis() const;

	// range[ 0.0f -> 1.0f ]	
	inline float getPrevYAxis() const;

	// range[ 0.0f -> 1.0f ]	
	inline float getPrevZAxis() const;

	// range[ 0.0f -> 1.0f ]	
	inline float getPrevXRotation() const;

	// range[ 0.0f -> 1.0f ]	
	inline float getPrevYRotation() const;

	// range[ 0.0f -> 1.0f ]	
	inline float getPrevZRotation() const;

	// 2 sliders, range[ 0.0f -> 1.0f ]
	inline float getPrevSlider(unsigned int s) const;

	// returns degrees from north (away from user), clockwize
	// so 0.0f is straight ahead, 90.0f is right, 270.0f is left etc
	// -1.0f is centered
	inline float getPrevPov(unsigned int s) const;

	// 128 buttons 
	inline bool getPrevButton(unsigned int b) const; 



	// Caps:

	inline unsigned int getNumSupportedButtons() const;

	inline HKG_DIRECT_JOYSTICK_CAPS getCaps() const;
	inline HKG_DIRECT_JOYSTICK_TYPE getType() const;

	inline bool hasPS2Caps() const;

	// 
	// For _internal_ enumeration only.
	//

	inline void addCaps( HKG_DIRECT_JOYSTICK_CAPS caps );
	inline LPDIRECTINPUTDEVICE8& getDevice();

protected:
	
	bool initDInput(HWND owner);
	void freeDInput();

	static LPDIRECTINPUT8	m_pDI;
	LPDIRECTINPUTDEVICE8	m_pJoystick;
	DIJOYSTATE2				m_curJoystickState;
	DIJOYSTATE2				m_prevJoystickState;

	HKG_DIRECT_JOYSTICK_CAPS	m_caps;
	HKG_DIRECT_JOYSTICK_TYPE    m_type;
	unsigned int				m_numButtons;

	bool					m_forceFeedback;
};

#include <Graphics/Ogl/Pc/Input/Pad/hkgDirectJoystickPC.inl>

#endif // HK_GRAPHICS_DIRECT_JOYSTICK_PC_H

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
