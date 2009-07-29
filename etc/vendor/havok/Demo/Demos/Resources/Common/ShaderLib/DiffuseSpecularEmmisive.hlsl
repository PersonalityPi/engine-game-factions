/* 
 * 
 * Confidential Information of Telekinesys Research Limited (t/a Havok). Not for disclosure or distribution without Havok's
 * prior written consent. This software contains code, techniques and know-how which is confidential and proprietary to Havok.
 * Level 2 and Level 3 source code contains trade secrets of Havok. Havok Software (C) Copyright 1999-2009 Telekinesys Research Limited t/a Havok. All Rights Reserved. Use of this software is subject to the terms of an end user license agreement.
 * 
 */

//
// One or Two diffuse maps, along with a normal and specular map, with and without shadows. The most common demo shaders 
// with 'proper' assets. These will currently also allow loading of a gloss map, but will ignore it
//
//:STYLE VertOneLightEmitT1 PixT1Emit LD1 T1 DIFFUSE0 NORMAL0 SPECULAR0 EMISSIVE0
//:STYLE VertOneLightEmitShadowProjT1 PixShadowSceneT1Emit LD1 T1 SHADOWMAP DIFFUSE0 NORMAL0 SPECULAR0 EMISSIVE0

#include "CommonHeader.hlslh"

// Matrices
float4x4 g_mWorldInv;
float4x4 g_mWorldView		: WorldView;
float4x4 g_mProj			: Proj;
float4x4 g_mViewInv			: ViewInverse;
 
// Textures, set assignment so that the behaviour is the same no mater what shader is using it 
sampler g_sSamplerOne  : register(s1);		// T0 if shadows, otherwise T1
sampler g_sSamplerTwo  : register(s2);		// T1 if shadows, , otherwise T1
sampler g_sSamplerThree : register(s3);     // T1 if shadows, otherwise T3
sampler g_sSamplerFour  : register(s4);		// T3 if shadows


vertexOutputT1B VertOneLightEmitT1( vertexInputT1B In )
{
	vertexOutputT1B Out;

	// copy texture coordinates
	    
    Out.texCoord0 = In.texCoord0;
	
	// transform position to clip space
	Out.position = mul(In.position, g_mWorldViewProj);

	// compute the 3x3 tranform from object space to tangent space
	float3x3 objToTangentSpace;
	
	float bumpHeight = 1.0f;
		
	objToTangentSpace[0] = In.tangent * bumpHeight;
	objToTangentSpace[1] = In.binormal * bumpHeight;
	objToTangentSpace[2] = In.normal;
	
    float4 vertexPos = mul(In.position, g_mWorld); // world space position

	// light vector
	float3 lightVec = mul( g_vLightDir, (float3x3)g_mWorldInv );  // transform back to object space
	Out.L = mul( objToTangentSpace, lightVec ); // transform from object to tangent space
	
	// eye vector
	float3 eyeVec = g_mViewInv[3].xyz - vertexPos.xyz; // world space eye vector
	eyeVec = mul(eyeVec, (float3x3) g_mWorldInv );  // transform back to object space
	eyeVec = normalize(eyeVec);
	
	// half-angle vector
	float3 H = normalize(lightVec + eyeVec);
	Out.H = mul(objToTangentSpace, H);	// transform to tangent space

	return Out;
}


vertexOutputShadowT1B VertOneLightEmitShadowProjT1( vertexInputT1B In) 
{
    vertexOutputShadowT1B Output;
    
    float4 viewPos =  mul( float4(In.position.xyz, 1.0), g_mWorldView);
    
    Output.position = mul( viewPos, g_mProj);
    
    Output.texCoord0 = In.texCoord0;
		 
		// project pos into light space
    Output.posLight = mul( viewPos, g_mViewToLightProj );
    
    #ifdef HKG_SHADOWS_VSM
            Output.posWorld =  mul( float4(In.position.xyz, 1.0), g_mWorld);
   #endif
    
	// compute the 3x3 tranform from object space to tangent space
	float3x3 objToTangentSpace;
	
	float bumpHeight = 1.0f;
		
	objToTangentSpace[0] = In.tangent * bumpHeight;
	objToTangentSpace[1] = In.binormal * bumpHeight;
	objToTangentSpace[2] = In.normal;
	
    float4 vertexPos = mul(In.position, g_mWorld); // world space position

	// light vector
	float3 lightVec = mul( g_vLightDir, (float3x3)g_mWorldInv );  // transform back to object space
	Output.L = mul( objToTangentSpace, lightVec ); // transform from object to tangent space
	
	// eye vector
	float3 eyeVec = g_mViewInv[3].xyz - vertexPos.xyz; // world space eye vector
	eyeVec = mul(eyeVec, (float3x3) g_mWorldInv );  // transform back to object space
	eyeVec = normalize(eyeVec);
	
	// half-angle vector
	float3 H = normalize(lightVec + eyeVec);
	Output.H = mul(objToTangentSpace, H);	// transform to tangent space

	
	return Output;
}


// Pixel Shaders

pixelOutput PixT1Emit( vertexOutputT1B In )
{
	float4 ColorMap = float4(1,1,1,1);
	float3 SpecMap = g_cSpecularColor.rgb;
	float3 N = float3(0,0,1); 
	
#if ENABLE_DIFFUSE_MAP0
    ColorMap = tex2D(g_sSamplerZero, In.texCoord0);
#endif
		
#if ENABLE_NORMAL_MAP
	#if ENABLE_LIGHTING
		N = tex2D(g_sSamplerOne, In.texCoord0).xyz*2.0 - 1.0;
		N = normalize(N);
	#else
		ColorMap = tex2D(g_sSamplerOne, In.texCoord0);
	#endif
#endif

#if ENABLE_SPEC_MAP
	SpecMap *= tex2D(g_sSamplerTwo, In.texCoord0).rgb;
#endif

	ColorMap *= g_cDiffuseColor;

	float4 EmitMap = tex2D(g_sSamplerThree, In.texCoord0);

	In.L = normalize(In.L);
	In.H = normalize(In.H);

	float NdotL = dot(N, In.L);
	float NdotH = dot(N, In.H);
#if ENABLE_LIGHTING
    float specPower = g_cSpecularPower;
    float4 light = Phong( NdotL, NdotH, specPower ) * float4(g_cLightColor.rgb, 1);
#else
	float4 light = float4(1,1,1,1);
#endif
	
	pixelOutput Output;
	Output.color.rgb = EmitMap.rgb + (1-light)*g_cAmbientColor.rgb*ColorMap.rgb + light*ColorMap.rgb + light.www*SpecMap;
	Output.color.a = EmitMap.a * ColorMap.a; // modulate alpha as is, light doesn't affect it.
	return Output; 
}


pixelOutput PixShadowSceneT1Emit( vertexOutputShadowT1B In )
{
    pixelOutput Output;
    
    #ifdef HKG_SHADOWS_VSM
		float lightAmount = getLightAmountVSM( In.posLight, In.posWorld );
  	#else
		float lightAmount = getLightAmountSM( In.posLight ); 
	#endif
		
	float4 ColorMap = float4(1,1,1,1);
	float3 SpecMap = g_cSpecularColor.rgb;
	float3 N = float3(0,0,1); 
	
#if ENABLE_DIFFUSE_MAP0
    ColorMap = tex2D(g_sSamplerOne, In.texCoord0);
#endif
		
#if ENABLE_NORMAL_MAP
	#if ENABLE_LIGHTING
		N = tex2D(g_sSamplerTwo, In.texCoord0).xyz*2.0 - 1.0;
		N = normalize(N);
	#else
		ColorMap = tex2D(g_sSamplerTwo, In.texCoord0);
	#endif
#endif

#if ENABLE_SPEC_MAP
	SpecMap *= tex2D(g_sSamplerThree, In.texCoord0).rgb;
#endif

	ColorMap *= g_cDiffuseColor;

	float4 EmitMap = tex2D(g_sSamplerFour, In.texCoord0);

	// interp will not preserve length
	In.L = normalize(In.L);
	In.H = normalize(In.H);

	float NdotL = dot(N, In.L);
	float NdotH = dot(N, In.H);
	
#if ENABLE_LIGHTING
	float specPower = g_cSpecularPower;
	float4 light = lightAmount * Phong(NdotL, NdotH, specPower) * float4(g_cLightColor.rgb, 1);
#else
	float4 light = float4(1,1,1,1);
#endif
	
	Output.color.rgb = EmitMap.rgb + (1-light)*g_cAmbientColor*ColorMap.rgb + light.rgb*ColorMap.rgb + light.www*SpecMap;
	Output.color.a = EmitMap.a*ColorMap.a; // modulate alpha as is, shadow doesn't affect it.
	
    return Output;
}


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
