/* 
 * 
 * Confidential Information of Telekinesys Research Limited (t/a Havok). Not for disclosure or distribution without Havok's
 * prior written consent. This software contains code, techniques and know-how which is confidential and proprietary to Havok.
 * Level 2 and Level 3 source code contains trade secrets of Havok. Havok Software (C) Copyright 1999-2009 Telekinesys Research Limited t/a Havok. All Rights Reserved. Use of this software is subject to the terms of an end user license agreement.
 * 
 */

//
// [None, one or two] diffuse maps, no normal map, with and without shadows. Vertex lit
//:STYLE VertOneLightT0 PixT0 LD1 T0
//:STYLE VertOneLightShadowProjT0 PixShadowSceneT0 LD1 T0 SHADOWMAP
//:STYLE VertOneLightT1 PixT1 LD1 T1 DIFFUSE0
//:STYLE VertOneLightShadowProjT1 PixShadowSceneT1 LD1 T1 SHADOWMAP DIFFUSE0
//:STYLE VertOneLightT2 PixT2 LD1 T2 DIFFUSE0 DIFFUSE1 1L
//:STYLE VertOneLightShadowProjT2 PixShadowSceneT2 LD1 T2 SHADOWMAP DIFFUSE0 DIFFUSE1

#include "CommonHeader.hlslh"

// extra matrices
float4x4 g_mWorldInv;
float4x4 g_mWorldView		: WorldView;
float4x4 g_mProj			: Proj;
float4x4 g_mViewInv			: ViewInverse;
 
// extra textures
sampler g_sSamplerOne  : register(s1);		// T0 if shadows, otherwise T1
sampler g_sSamplerTwo  : register(s2);		// T1 if shadows, otherwise T2


// Vertex based lighting (with specular)
vertexOutputT0 VertOneLightT0(vertexInputT0 In) 
{
    vertexOutputT0 Output;
    Output.position = mul( float4(In.position.xyz,1.0), g_mWorldViewProj);
  	
	//calculate our vectors N, E, L, and H
	float3 worldEyePos = g_mViewInv[3].xyz;
    float3 worldVertPos = mul( float4(In.position.xyz, 1.0), g_mWorld ).xyz;
	float4 light = LightVertex(worldVertPos, In.normal, worldEyePos);
	float4 vertColor = float4(1,1,1,1);
	MaterialContribution(vertColor, light, Output.diffAmbColor, Output.specCol);
	return Output;
}

// Vertex based lighting (with specular), also projects the position into the shadow map space
vertexOutputShadowT0 VertOneLightShadowProjT0(vertexInputT0 In) 
{
    vertexOutputShadowT0 Output;
    
    float4 viewPos =  mul( float4(In.position.xyz, 1.0), g_mWorldView);
    
    Output.position = mul( viewPos, g_mProj);
    
	// project pos into light space
    Output.posLight = mul( viewPos, g_mViewToLightProj );
    
    #ifdef HKG_SHADOWS_VSM
          Output.posWorld =  mul( float4(In.position.xyz, 1.0), g_mWorld);
	#endif
  
    // Lighting:
    
	//calculate our vectors N, E, L, and H
	float3 worldEyePos = g_mViewInv[3].xyz;
    float3 worldVertPos = mul(In.position, g_mWorld).xyz;
	float4 light = LightVertex(worldVertPos, In.normal, worldEyePos);
	float4 vertColor = float4(1,1,1,1);
	MaterialContribution(vertColor, light, Output.diffAmbColor, Output.specCol);
	
	return Output;
}

// Vertex based lighting (with specular)
vertexOutputT1 VertOneLightT1(vertexInputT1 In) 
{
    vertexOutputT1 Output;
    Output.position = mul( float4(In.position.xyz , 1.0), g_mWorldViewProj);
    Output.texCoord0 = In.texCoord0;
	
	//calculate our vectors N, E, L, and H
	float3 worldEyePos = g_mViewInv[3].xyz;
    float3 worldVertPos = mul( float4(In.position.xyz , 1.0), g_mWorld ).xyz;
	float4 light = LightVertex(worldVertPos, In.normal, worldEyePos);
	float4 vertColor = float4(1,1,1,1);
	MaterialContribution(vertColor, light, Output.diffAmbColor, Output.specCol);
	return Output;
}

// Vertex based lighting (with specular), also projects the position into the shadow map space
vertexOutputShadowT1 VertOneLightShadowProjT1(vertexInputT1 In) 
{
    vertexOutputShadowT1 Output;
    
    float4 viewPos =  mul( float4(In.position.xyz, 1.0), g_mWorldView);
    
    Output.position = mul( viewPos, g_mProj);
    Output.texCoord0 = In.texCoord0;
    
	// project pos into light space
    Output.posLight = mul( viewPos, g_mViewToLightProj );
    
    #ifdef HKG_SHADOWS_VSM
          Output.posWorld =  mul( float4(In.position.xyz, 1.0), g_mWorld);
	#endif
  
    // Lighting:
    
	//calculate our vectors N, E, L, and H
	float3 worldEyePos = g_mViewInv[3].xyz;
    float3 worldVertPos = mul(float4(In.position.xyz , 1.0), g_mWorld).xyz;
	float4 light = LightVertex(worldVertPos, In.normal, worldEyePos);
	float4 vertColor = float4(1,1,1,1);
	MaterialContribution(vertColor, light, Output.diffAmbColor, Output.specCol);
	
	return Output;
}


// Vertex based lighting (with specular)
vertexOutputT2 VertOneLightT2(vertexInputT2 In) 
{
    vertexOutputT2 Output;
    Output.position = mul( float4(In.position.xyz , 1.0), g_mWorldViewProj);
    Output.texCoord0 = In.texCoord0;
	Output.texCoord1 = In.texCoord1;
	
	//calculate our vectors N, E, L, and H
	float3 worldEyePos = g_mViewInv[3].xyz;
    float3 worldVertPos = mul( float4(In.position.xyz , 1.0), g_mWorld ).xyz;
	float4 light = LightVertex(worldVertPos, In.normal, worldEyePos);
	float4 vertColor = float4(1,1,1,1);
	MaterialContribution(vertColor, light, Output.diffAmbColor, Output.specCol);
	return Output;
}

// Vertex based lighting (with specular), also projects the position into the shadow map space
vertexOutputShadowT2 VertOneLightShadowProjT2(vertexInputT2 In) 
{
    vertexOutputShadowT2 Output;
    
    float4 viewPos =  mul( float4(In.position.xyz, 1.0), g_mWorldView);
    
    Output.position = mul( viewPos, g_mProj);
    Output.texCoord0 = In.texCoord0;
    Output.texCoord1 = In.texCoord1;
    
	// project pos into light space
    Output.posLight = mul( viewPos, g_mViewToLightProj );
    
    #ifdef HKG_SHADOWS_VSM
          Output.posWorld =  mul( float4(In.position.xyz, 1.0), g_mWorld);
	#endif
  
    // Lighting:
    
	//calculate our vectors N, E, L, and H
	float3 worldEyePos = g_mViewInv[3].xyz;
    float3 worldVertPos = mul(float4(In.position.xyz , 1.0), g_mWorld).xyz;
	float4 light = LightVertex(worldVertPos, In.normal, worldEyePos);
	float4 vertColor = float4(1,1,1,1);
	MaterialContribution(vertColor, light, Output.diffAmbColor, Output.specCol);
	
	return Output;
}

pixelOutput PixShadowSceneT0( vertexOutputShadowT0 In )
{
    pixelOutput Output;

    #ifdef HKG_SHADOWS_VSM 
		float lightAmount = getLightAmountVSM( In.posLight, In.posWorld  );
 	#else
		float lightAmount = getLightAmountSM( In.posLight ); 
	#endif
	
	Output.color.rgb = (1-lightAmount)*In.diffAmbColor.rgb*0.3 + lightAmount*In.diffAmbColor.rgb + lightAmount*In.specCol.rgb;
	Output.color.a = In.diffAmbColor.a; // modulate alpha as is, shadow doesn't affect it.
    return Output;
}

pixelOutput PixShadowSceneT1( vertexOutputShadowT1 In )
{
    pixelOutput Output;

    #ifdef HKG_SHADOWS_VSM 
		float lightAmount = getLightAmountVSM( In.posLight, In.posWorld  );
 	#else
		float lightAmount = getLightAmountSM( In.posLight ); 
	#endif
	
	float4 texel = tex2D( g_sSamplerOne, In.texCoord0 );
	texel.rgb *= In.diffAmbColor.rgb;
    Output.color.rgb = (1-lightAmount)*texel.rgb*0.3 + lightAmount*texel.rgb + lightAmount*In.specCol.rgb;
	Output.color.a = texel.a * In.diffAmbColor.a; // modulate alpha as is, shadow doesn't affect it.
    return Output;
}

pixelOutput PixShadowSceneT2( vertexOutputShadowT2 In )
{
    pixelOutput Output;

    #ifdef HKG_SHADOWS_VSM 
		float lightAmount = getLightAmountVSM( In.posLight, In.posWorld  );
 	#else
		float lightAmount = getLightAmountSM( In.posLight ); 
	#endif
	
	float4 texel0 = tex2D( g_sSamplerOne, In.texCoord0 );
    float4 texel1 = tex2D( g_sSamplerTwo, In.texCoord1 );
    float3 texelTotal = (texel0.rgb + (texel1.rgb * 0.6));
    texelTotal.rgb *= In.diffAmbColor.rgb;
	Output.color.rgb = (1-lightAmount)*texelTotal.rgb*0.3 + lightAmount*texelTotal.rgb + lightAmount*In.specCol.rgb;
	Output.color.a = texel0.a * texel1.a * In.diffAmbColor.a; // modulate alpha as is, shadow doesn't affect it.
    return Output;
}


pixelOutput PixT0( vertexOutputT0 In ) 
{ 
    pixelOutput Output;
    Output.color.rgb = In.diffAmbColor.rgb + In.specCol.rgb;
    Output.color.a = In.diffAmbColor.a;
    return Output;
}

pixelOutput PixT1( vertexOutputT1 In ) 
{ 
    pixelOutput Output;
    float4 texel = tex2D(g_sSamplerZero, In.texCoord0); 
    Output.color.rgb = texel.rgb * In.diffAmbColor.rgb + In.specCol.rgb;
    Output.color.a = texel.a * In.diffAmbColor.a;
    return Output;
}

pixelOutput PixT2( vertexOutputT2 In ) 
{ 
    pixelOutput Output;
    float4 texel0 = tex2D( g_sSamplerZero, In.texCoord0 );
    float4 texel1 = tex2D( g_sSamplerOne, In.texCoord1 );
    Output.color.rgb = (texel0.rgb + (texel1.rgb * 0.6)) * In.diffAmbColor.rgb + In.specCol.rgb;
    Output.color.a = texel0.a * texel1.a * In.diffAmbColor.a;
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
