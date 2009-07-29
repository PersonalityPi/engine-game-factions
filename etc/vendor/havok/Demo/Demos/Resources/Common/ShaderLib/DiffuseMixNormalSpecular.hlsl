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
//:STYLE VertOneLightBumpT1 PixT1Bump LD1 T1 DIFFUSE0 NORMAL0 SPECULAR0
//:STYLE VertOneLightBumpT1 PixT1Bump LD1 T1 DIFFUSE0 NORMAL0 SPECULAR0 GLOSS0
//:STYLE VertOneLightBumpT2 PixT2Bump LD1 T2 DIFFUSE0 DIFFUSE1 NORMAL0 SPECULAR0
//:STYLE VertOneLightBumpT2 PixT2Bump LD1 T2 DIFFUSE0 DIFFUSE1 NORMAL0 SPECULAR0 GLOSS0
//:STYLE VertOneLightBumpT2 PixT2BumpLM LD1 T2 DIFFUSE0 LIGHTMAP1 NORMAL0 SPECULAR0
//:STYLE VertOneLightBumpT2 PixT2BumpLM LD1 T2 DIFFUSE0 LIGHTMAP1 NORMAL0 SPECULAR0 GLOSS0
//:STYLE VertOneLightBumpShadowProjT1 PixShadowSceneT1Bump LD1 T1 SHADOWMAP DIFFUSE0 NORMAL0 SPECULAR0
//:STYLE VertOneLightBumpShadowProjT1 PixShadowSceneT1Bump LD1 T1 SHADOWMAP DIFFUSE0 NORMAL0 SPECULAR0 GLOSS0
//:STYLE VertOneLightBumpShadowProjT2 PixShadowSceneT2Bump LD1 T2 SHADOWMAP DIFFUSE0 DIFFUSE1 NORMAL0 SPECULAR0
//:STYLE VertOneLightBumpShadowProjT2 PixShadowSceneT2Bump LD1 T2 SHADOWMAP DIFFUSE0 DIFFUSE1 NORMAL0 SPECULAR0 GLOSS0
//:STYLE VertOneLightBumpShadowProjT2 PixShadowSceneT2BumpLM LD1 T2 SHADOWMAP DIFFUSE0 LIGHTMAP1 NORMAL0 SPECULAR0
//:STYLE VertOneLightBumpShadowProjT2 PixShadowSceneT2BumpLM LD1 T2 SHADOWMAP DIFFUSE0 LIGHTMAP1 NORMAL0 SPECULAR0 GLOSS0

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


// Vertex Shaders
vertexOutputT2B VertOneLightBumpT2( vertexInputT2B In )
{
	vertexOutputT2B Out;

	// copy texture coordinates
	    
    Out.texCoord0 = In.texCoord0;
	Out.texCoord1 = In.texCoord1;
	
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

vertexOutputT1B VertOneLightBumpT1( vertexInputT1B In )
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

// Vertex based lighting (with specular), also projects the position into the shadow map space
vertexOutputShadowT2B VertOneLightBumpShadowProjT2( vertexInputT2B In) 
{
    vertexOutputShadowT2B Output;
    
    float4 viewPos =  mul( float4(In.position.xyz, 1.0), g_mWorldView);
    
    Output.position = mul( viewPos, g_mProj);
    
    Output.texCoord0 = In.texCoord0;
	Output.texCoord1 = In.texCoord1;
		 
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


// Vertex based lighting (with specular), also projects the position into the shadow map space
vertexOutputShadowT1B VertOneLightBumpShadowProjT1( vertexInputT1B In) 
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

// Pixel shaders
pixelOutput PixT2Bump( vertexOutputT2B In )
{
	float4 ColorMap = float4(1,1,1,1);
	float3 SpecMap = g_cSpecularColor.rgb;
	float3 N = float3(0,0,1); 
	
#if ENABLE_DIFFUSE_MAP0
    ColorMap = tex2D(g_sSamplerZero, In.texCoord0);
#endif

#if ENABLE_DIFFUSE_MAP1
	#if ENABLE_DIFFUSE_MAP0
		ColorMap = ColorMap + (tex2D(g_sSamplerOne, In.texCoord1) * 0.6);
	#else
		ColorMap = tex2D(g_sSamplerOne, In.texCoord1);
	#endif
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
	
	In.L = normalize(In.L);
	In.H = normalize(In.H);

	float NdotL = dot(N, In.L);
	float NdotH = dot(N, In.H);
#if ENABLE_LIGHTING
    float specPower = g_cSpecularPower;
    float4 light = Phong(NdotL, NdotH, specPower) * float4(g_cLightColor.rgb, 1);
#else
	float4 light = float4(1,1,1,1);
#endif
	
	pixelOutput Output;
	Output.color.rgb = (1-light.rgb)*g_cAmbientColor.rgb*ColorMap.rgb + light.rgb*ColorMap.rgb + light.www*SpecMap;
	Output.color.a = ColorMap.a; // modulate alpha as is, light doesn't affect it.
	return Output; 
}


// Pixel shaders
pixelOutput PixT2BumpLM( vertexOutputT2B In )
{
	float4 ColorMap = float4(1,1,1,1);
	float3 SpecMap = g_cSpecularColor.rgb;
	float3 LightMap = float3(1,1,1);
	float3 N = float3(0,0,1); 
	
#if ENABLE_DIFFUSE_MAP0
    ColorMap = tex2D(g_sSamplerZero, In.texCoord0);
#endif

#if ENABLE_LIGHT_MAP
	LightMap = tex2D(g_sSamplerOne, In.texCoord1).rgb;
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
	
	// Green == 59% of the perceived luminosity, while the red and blue channels account for just 30% and 11%
	float luminosity = (LightMap.r*0.33 + LightMap.g*0.59 + LightMap.b*0.11);
	luminosity = saturate( luminosity );
	
	float lightMapShadow = 1 - (luminosity * 0.5); // 1 when in dark areas
	
	ColorMap *= g_cDiffuseColor;
	
	In.L = normalize(In.L);
	In.H = normalize(In.H);

	float NdotL = dot(N, In.L);
	float NdotH = dot(N, In.H);
#if ENABLE_LIGHTING
    float specPower = g_cSpecularPower;
    float4 light = Phong(NdotL, NdotH, specPower) * float4(g_cLightColor.rgb, 1);
#else
	float4 light = float4(1,1,1,1);
#endif
	
	light *= luminosity;
	
	pixelOutput Output;
	Output.color.rgb = (1-lightMapShadow)*ColorMap.rgb*LightMap.rgb*0.3 + lightMapShadow*ColorMap.rgb*LightMap.rgb + (light.www*lightMapShadow*SpecMap.rgb);
	Output.color.a = ColorMap.a; // modulate alpha as is, light doesn't affect it.
	return Output; 
}
 
 // Pixel shaders
pixelOutput PixT1Bump( vertexOutputT1B In )
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
	Output.color.rgb = (1-light.rgb)*g_cAmbientColor.rgb*ColorMap.rgb + light.rgb*ColorMap.rgb + light.www*SpecMap;
	Output.color.a = ColorMap.a; // modulate alpha as is, light doesn't affect it.
	return Output; 
}


pixelOutput PixShadowSceneT2Bump( vertexOutputShadowT2B In )
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

#if ENABLE_DIFFUSE_MAP1
	#if ENABLE_DIFFUSE_MAP0
		ColorMap = ColorMap + (tex2D(g_sSamplerTwo, In.texCoord1) * 0.6);
	#else
		ColorMap = tex2D(g_sSamplerTwo, In.texCoord1);
	#endif
#endif
		
#if ENABLE_NORMAL_MAP
	#if ENABLE_LIGHTING
		N = tex2D(g_sSamplerThree, In.texCoord0).xyz*2.0 - 1.0;
		N = normalize(N);
	#else
		ColorMap = tex2D(g_sSamplerThree, In.texCoord0);
	#endif
#endif

#if ENABLE_SPEC_MAP
	SpecMap *= tex2D(g_sSamplerFour, In.texCoord0).rgb;
#endif

	ColorMap *= g_cDiffuseColor;

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
	
	Output.color.rgb = (1-light.rgb)*g_cAmbientColor*ColorMap.rgb + light.rgb*ColorMap.rgb + light.www*SpecMap;
	Output.color.a = ColorMap.a; // modulate alpha as is, shadow doesn't affect it.
	
    return Output;
}


pixelOutput PixShadowSceneT1Bump( vertexOutputShadowT1B In )
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
	
	Output.color.rgb = (1-light.rgb)*g_cAmbientColor.rgb*ColorMap.rgb + light.rgb*ColorMap.rgb + light.www*SpecMap;
	Output.color.a = ColorMap.a; // modulate alpha as is, shadow doesn't affect it.
	
    return Output;
}



pixelOutput PixShadowSceneT2BumpLM( vertexOutputShadowT2B In )
{
    pixelOutput Output;
    
    #ifdef HKG_SHADOWS_VSM
		float shadowAmount = getLightAmountVSM( In.posLight, In.posWorld );
    #else
		float shadowAmount = getLightAmountSM( In.posLight ); 
	#endif
		
	float4 ColorMap = float4(1,1,1,1);
	float3 SpecMap = g_cSpecularColor.rgb;
	float3 LightMap = float3(1,1,1);
	float3 N = float3(0,0,1); 
	
#if ENABLE_DIFFUSE_MAP0
    ColorMap = tex2D(g_sSamplerOne, In.texCoord0);
#endif

#if ENABLE_LIGHT_MAP
    LightMap = tex2D(g_sSamplerTwo, In.texCoord1);
#endif
		
#if ENABLE_NORMAL_MAP
	#if ENABLE_LIGHTING
		N = tex2D(g_sSamplerThree, In.texCoord0).xyz*2.0 - 1.0;
		N = normalize(N);
	#else
		ColorMap = tex2D(g_sSamplerThree, In.texCoord0);
	#endif
#endif

#if ENABLE_SPEC_MAP
	SpecMap *= tex2D(g_sSamplerFour, In.texCoord0).rgb;
#endif

	ColorMap *= g_cDiffuseColor;

	// Green == 59% of the perceived luminosity, while the red and blue channels account for just 30% and 11%
	float luminosity = (LightMap.r*0.33 + LightMap.g*0.59 + LightMap.b*0.11);
	luminosity = saturate( luminosity );
	
	float lightMapShadow = 1 - (luminosity * 0.5); // 1 when in dark areas
	shadowAmount = max( shadowAmount, lightMapShadow ); // don't have dark shadows in dark lightmap areas
	
	// interp will not preserve length
	In.L = normalize(In.L);
	In.H = normalize(In.H);

	float NdotL = dot(N, In.L);
	float NdotH = dot(N, In.H);
	
	#if ENABLE_LIGHTING
		float specPower = g_cSpecularPower;
		float4 light = Phong(NdotL, NdotH, specPower) * float4(g_cLightColor.rgb, 1);;
	#else
		float4 light = float4(1,1,1,1);
	#endif
	
	// Discard normal map and spec map in darker areas
	light *= luminosity; // don't want spec etc in dark areas
		
	Output.color.rgb = (1-shadowAmount)*ColorMap.rgb*LightMap.rgb*0.3 + shadowAmount*ColorMap.rgb*LightMap.rgb + (light.www*SpecMap*shadowAmount);
	Output.color.a = ColorMap.a; // modulate alpha as is, shadow doesn't affect it.
	
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
