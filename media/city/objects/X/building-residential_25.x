xof 0303txt 0032
template XSkinMeshHeader {
 <3cf169ce-ff7c-44ab-93c0-f78f62d172e2>
 WORD nMaxSkinWeightsPerVertex;
 WORD nMaxSkinWeightsPerFace;
 WORD nBones;
}

template VertexDuplicationIndices {
 <b8d65549-d7c9-4995-89cf-53a9a8b031e3>
 DWORD nIndices;
 DWORD nOriginalVertices;
 array DWORD indices[nIndices];
}

template SkinWeights {
 <6f0d123b-bad2-4167-a0d0-80224f25fabb>
 STRING transformNodeName;
 DWORD nWeights;
 array DWORD vertexIndices[nWeights];
 array FLOAT weights[nWeights];
 Matrix4x4 matrixOffset;
}

template FVFData {
 <b6e70a0e-8ef9-4e83-94ad-ecc8b0c04897>
 DWORD dwFVF;
 DWORD nDWords;
 array DWORD data[nDWords];
}

template EffectInstance {
 <e331f7e4-0559-4cc2-8e99-1cec1657928f>
 STRING EffectFilename;
 [...]
}

template EffectParamFloats {
 <3014b9a0-62f5-478c-9b86-e4ac9f4e418b>
 STRING ParamName;
 DWORD nFloats;
 array FLOAT Floats[nFloats];
}

template EffectParamString {
 <1dbc4c88-94c1-46ee-9076-2c28818c9481>
 STRING ParamName;
 STRING Value;
}

template EffectParamDWord {
 <e13963bc-ae51-4c5d-b00f-cfa3a9d97ce5>
 STRING ParamName;
 DWORD Value;
}


Material skyscrapers {
 1.000000;1.000000;1.000000;1.000000;;
 3.200000;
 0.000000;0.000000;0.000000;;
 0.000000;0.000000;0.000000;;

 TextureFilename {
  "Skyscrp.tga";
 }
}

Material buildz1 {
 1.000000;1.000000;1.000000;1.000000;;
 3.200000;
 0.000000;0.000000;0.000000;;
 0.000000;0.000000;0.000000;;

 TextureFilename {
  "buildz1.tga";
 }
}

Material buildz3 {
 1.000000;1.000000;1.000000;1.000000;;
 3.200000;
 0.000000;0.000000;0.000000;;
 0.000000;0.000000;0.000000;;

 TextureFilename {
  "buildz3.tga";
 }
}

Material buildz4 {
 1.000000;1.000000;1.000000;1.000000;;
 3.200000;
 0.000000;0.000000;0.000000;;
 0.000000;0.000000;0.000000;;

 TextureFilename {
  "buildz4.tga";
 }
}

Material buildz5 {
 1.000000;1.000000;1.000000;1.000000;;
 3.200000;
 0.000000;0.000000;0.000000;;
 0.000000;0.000000;0.000000;;

 TextureFilename {
  "buildz5.tga";
 }
}

Material buildz6 {
 1.000000;1.000000;1.000000;1.000000;;
 3.200000;
 0.000000;0.000000;0.000000;;
 0.000000;0.000000;0.000000;;

 TextureFilename {
  "buildz6.tga";
 }
}

Material buildz2 {
 1.000000;1.000000;1.000000;1.000000;;
 3.200000;
 0.000000;0.000000;0.000000;;
 0.000000;0.000000;0.000000;;

 TextureFilename {
  "buildz2.tga";
 }
}

Material roads {
 1.000000;1.000000;1.000000;1.000000;;
 3.200000;
 0.000000;0.000000;0.000000;;
 0.000000;0.000000;0.000000;;

 TextureFilename {
  "roads.tga";
 }
}

Material roads-2 {
 1.000000;1.000000;1.000000;1.000000;;
 3.200000;
 0.000000;0.000000;0.000000;;
 0.000000;0.000000;0.000000;;

 TextureFilename {
  "roads2.tga";
 }
}

Material tree-01 {
 1.000000;1.000000;1.000000;1.000000;;
 3.200000;
 0.000000;0.000000;0.000000;;
 0.000000;0.000000;0.000000;;

 TextureFilename {
  "trees-02.tga";
 }
}

Frame building-residential_25 {
 

 FrameTransformMatrix {
  1.000000,0.000000,0.000000,0.000000,0.000000,-0.000000,-1.000000,0.000000,0.000000,1.000000,-0.000000,0.000000,0.000000,-12.670539,12.491668,1.000000;;
 }

 Frame {
  

  FrameTransformMatrix {
   1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-0.000000,0.000000,1.000000;;
  }

  Mesh  {
   120;
   16.749582;15.080126;12.528409;,
   -16.749601;15.080125;12.528409;,
   13.091793;8.394189;15.179472;,
   -13.368183;8.394187;15.179472;,
   13.091793;8.394189;15.179472;,
   -16.749601;15.080125;12.528409;,
   13.091793;8.394189;15.179472;,
   -13.368183;8.394187;15.179472;,
   16.749584;1.476474;12.528411;,
   -16.749601;1.476475;12.528411;,
   16.749584;1.476474;12.528411;,
   -13.368183;8.394187;15.179472;,
   -16.749601;8.394187;12.528411;,
   -16.749601;1.476475;12.528411;,
   -13.368183;8.394187;15.179472;,
   -16.749601;8.394187;12.528411;,
   -13.368183;8.394187;15.179472;,
   -16.749601;15.080125;12.528409;,
   16.749586;8.394189;12.528411;,
   16.749582;15.080126;12.528409;,
   13.091793;8.394189;15.179472;,
   16.749586;8.394189;12.528411;,
   13.091793;8.394189;15.179472;,
   16.749584;1.476474;12.528411;,
   16.749584;1.476474;12.528411;,
   16.749584;1.476474;0.051139;,
   16.749586;8.394189;12.528411;,
   16.749586;8.394189;12.528411;,
   16.749584;1.476474;0.051139;,
   16.749582;15.080126;12.528409;,
   16.749582;15.080126;12.528409;,
   16.749584;1.476474;0.051139;,
   16.749582;15.080126;0.051137;,
   -16.749601;15.080125;12.528409;,
   -16.749601;15.080127;0.051137;,
   -16.749601;8.394187;12.528411;,
   -16.749601;8.394187;12.528411;,
   -16.749601;15.080127;0.051137;,
   -16.749601;1.476475;12.528411;,
   -16.749601;1.476475;12.528411;,
   -16.749601;15.080127;0.051137;,
   -16.749601;1.476475;0.051139;,
   -3.447101;-15.080359;6.781826;,
   -3.447100;1.669705;6.781826;,
   -12.619061;-15.080359;6.781826;,
   -12.619059;1.669706;6.781826;,
   -12.619061;-15.080359;6.781826;,
   -3.447100;1.669705;6.781826;,
   -3.447100;-15.080359;0.000000;,
   -3.447101;-15.080359;6.781826;,
   -12.619061;-15.080359;0.000000;,
   -12.619061;-15.080359;6.781826;,
   -12.619061;-15.080359;0.000000;,
   -3.447101;-15.080359;6.781826;,
   -12.619059;1.669707;0.000000;,
   -12.619061;-15.080359;0.000000;,
   -12.619059;1.669706;6.781826;,
   -12.619061;-15.080359;6.781826;,
   -12.619059;1.669706;6.781826;,
   -12.619061;-15.080359;0.000000;,
   -3.447100;-15.080359;0.000000;,
   -3.447099;1.669706;0.000000;,
   -3.447101;-15.080359;6.781826;,
   -3.447100;1.669705;6.781826;,
   -3.447101;-15.080359;6.781826;,
   -3.447099;1.669706;0.000000;,
   -16.749601;1.476475;12.528411;,
   -16.749601;1.476475;0.051139;,
   3.724420;1.476474;6.009830;,
   3.724425;1.476474;0.051139;,
   3.724420;1.476474;6.009830;,
   -16.749601;1.476475;0.051139;,
   11.068190;1.476474;6.009830;,
   16.749584;1.476474;12.528411;,
   3.724420;1.476474;6.009830;,
   -16.749601;1.476475;12.528411;,
   3.724420;1.476474;6.009830;,
   16.749584;1.476474;12.528411;,
   11.068192;1.476474;0.051139;,
   16.749584;1.476474;0.051139;,
   11.068190;1.476474;6.009830;,
   16.749584;1.476474;12.528411;,
   11.068190;1.476474;6.009830;,
   16.749584;1.476474;0.051139;,
   3.724420;1.476474;6.009830;,
   3.724425;1.476474;0.051139;,
   3.724417;15.080359;6.009828;,
   3.724421;15.080359;0.051137;,
   3.724417;15.080359;6.009828;,
   3.724425;1.476474;0.051139;,
   11.068190;1.476474;6.009830;,
   3.724420;1.476474;6.009830;,
   11.068188;15.080360;6.009828;,
   3.724417;15.080359;6.009828;,
   11.068188;15.080360;6.009828;,
   3.724420;1.476474;6.009830;,
   11.068192;1.476474;0.051139;,
   11.068190;1.476474;6.009830;,
   11.068188;15.080360;0.051137;,
   11.068188;15.080360;6.009828;,
   11.068188;15.080360;0.051137;,
   11.068190;1.476474;6.009830;,
   -16.749601;15.080125;12.528409;,
   3.724417;15.080359;6.009828;,
   -16.749601;15.080127;0.051137;,
   3.724421;15.080359;0.051137;,
   -16.749601;15.080127;0.051137;,
   3.724417;15.080359;6.009828;,
   11.068188;15.080360;6.009828;,
   3.724417;15.080359;6.009828;,
   16.749582;15.080126;12.528409;,
   -16.749601;15.080125;12.528409;,
   16.749582;15.080126;12.528409;,
   3.724417;15.080359;6.009828;,
   11.068188;15.080360;0.051137;,
   11.068188;15.080360;6.009828;,
   16.749582;15.080126;0.051137;,
   16.749582;15.080126;12.528409;,
   16.749582;15.080126;0.051137;,
   11.068188;15.080360;6.009828;;
   40;
   3;0,1,2;,
   3;3,4,5;,
   3;6,7,8;,
   3;9,10,11;,
   3;12,13,14;,
   3;15,16,17;,
   3;18,19,20;,
   3;21,22,23;,
   3;24,25,26;,
   3;27,28,29;,
   3;30,31,32;,
   3;33,34,35;,
   3;36,37,38;,
   3;39,40,41;,
   3;42,43,44;,
   3;45,46,47;,
   3;48,49,50;,
   3;51,52,53;,
   3;54,55,56;,
   3;57,58,59;,
   3;60,61,62;,
   3;63,64,65;,
   3;66,67,68;,
   3;69,70,71;,
   3;72,73,74;,
   3;75,76,77;,
   3;78,79,80;,
   3;81,82,83;,
   3;84,85,86;,
   3;87,88,89;,
   3;90,91,92;,
   3;93,94,95;,
   3;96,97,98;,
   3;99,100,101;,
   3;102,103,104;,
   3;105,106,107;,
   3;108,109,110;,
   3;111,112,113;,
   3;114,115,116;,
   3;117,118,119;;

   MeshNormals  {
    120;
    0.218454;0.254077;0.942190;,
    -0.220625;0.261052;0.939775;,
    0.209721;0.004751;0.977750;,
    -0.227483;0.004692;0.973771;,
    0.209721;0.004751;0.977750;,
    -0.220625;0.261052;0.939775;,
    0.209721;0.004751;0.977750;,
    -0.227483;0.004692;0.973771;,
    0.212828;-0.249500;0.944698;,
    -0.214841;-0.256160;0.942457;,
    0.212828;-0.249500;0.944698;,
    -0.227483;0.004692;0.973771;,
    -0.616991;0.000000;0.786970;,
    -0.214841;-0.256160;0.942457;,
    -0.227483;0.004692;0.973771;,
    -0.616991;0.000000;0.786970;,
    -0.227483;0.004692;0.973771;,
    -0.220625;0.261052;0.939775;,
    0.586846;0.000000;0.809699;,
    0.218454;0.254077;0.942190;,
    0.209721;0.004751;0.977750;,
    0.586846;0.000000;0.809699;,
    0.209721;0.004751;0.977750;,
    0.212828;-0.249500;0.944698;,
    1.000000;-0.000000;0.000000;,
    1.000000;0.000000;-0.000000;,
    1.000000;0.000000;-0.000000;,
    1.000000;0.000000;-0.000000;,
    1.000000;0.000000;-0.000000;,
    1.000000;0.000000;-0.000000;,
    1.000000;0.000000;-0.000000;,
    1.000000;0.000000;-0.000000;,
    1.000000;0.000000;0.000000;,
    -1.000000;0.000000;0.000000;,
    -1.000000;0.000000;0.000000;,
    -1.000000;0.000000;0.000000;,
    -1.000000;0.000000;0.000000;,
    -1.000000;0.000000;0.000000;,
    -1.000000;0.000000;0.000000;,
    -1.000000;0.000000;0.000000;,
    -1.000000;0.000000;0.000000;,
    -1.000000;0.000000;0.000000;,
    0.000000;0.000000;1.000000;,
    0.000000;0.000000;1.000000;,
    0.000000;0.000000;1.000000;,
    0.000000;0.000000;1.000000;,
    0.000000;0.000000;1.000000;,
    0.000000;0.000000;1.000000;,
    0.000000;-1.000000;0.000000;,
    0.000000;-1.000000;0.000000;,
    0.000000;-1.000000;0.000000;,
    0.000000;-1.000000;0.000000;,
    0.000000;-1.000000;0.000000;,
    0.000000;-1.000000;0.000000;,
    -1.000000;0.000000;0.000000;,
    -1.000000;0.000000;0.000000;,
    -1.000000;0.000000;0.000000;,
    -1.000000;0.000000;0.000000;,
    -1.000000;0.000000;0.000000;,
    -1.000000;0.000000;0.000000;,
    1.000000;-0.000000;0.000000;,
    1.000000;-0.000000;0.000000;,
    1.000000;-0.000000;0.000000;,
    1.000000;-0.000000;0.000000;,
    1.000000;-0.000000;0.000000;,
    1.000000;-0.000000;0.000000;,
    -0.000000;-1.000000;0.000000;,
    -0.000000;-1.000000;-0.000000;,
    -0.000000;-1.000000;0.000000;,
    -0.000000;-1.000000;-0.000000;,
    -0.000000;-1.000000;0.000000;,
    -0.000000;-1.000000;-0.000000;,
    -0.000000;-1.000000;0.000000;,
    -0.000000;-1.000000;0.000000;,
    -0.000000;-1.000000;0.000000;,
    -0.000000;-1.000000;0.000000;,
    -0.000000;-1.000000;0.000000;,
    -0.000000;-1.000000;0.000000;,
    0.000000;-1.000000;0.000000;,
    0.000000;-1.000000;0.000000;,
    -0.000000;-1.000000;0.000000;,
    -0.000000;-1.000000;0.000000;,
    -0.000000;-1.000000;0.000000;,
    0.000000;-1.000000;0.000000;,
    1.000000;0.000000;0.000001;,
    1.000000;0.000000;0.000001;,
    1.000000;0.000000;0.000001;,
    1.000000;0.000000;0.000001;,
    1.000000;0.000000;0.000001;,
    1.000000;0.000000;0.000001;,
    -0.000000;-0.000000;-1.000000;,
    0.000000;-0.000000;-1.000000;,
    0.000000;-0.000000;-1.000000;,
    0.000000;-0.000000;-1.000000;,
    0.000000;-0.000000;-1.000000;,
    0.000000;-0.000000;-1.000000;,
    -1.000000;-0.000000;-0.000000;,
    -1.000000;-0.000000;-0.000000;,
    -1.000000;-0.000000;-0.000000;,
    -1.000000;-0.000000;0.000000;,
    -1.000000;-0.000000;-0.000000;,
    -1.000000;-0.000000;-0.000000;,
    -0.000009;1.000000;0.000007;,
    -0.000005;1.000000;0.000022;,
    -0.000011;1.000000;0.000000;,
    -0.000011;1.000000;-0.000000;,
    -0.000011;1.000000;0.000000;,
    -0.000005;1.000000;0.000022;,
    0.000021;1.000000;0.000018;,
    -0.000005;1.000000;0.000022;,
    0.000019;1.000000;0.000020;,
    -0.000009;1.000000;0.000007;,
    0.000019;1.000000;0.000020;,
    -0.000005;1.000000;0.000022;,
    0.000041;1.000000;0.000000;,
    0.000021;1.000000;0.000018;,
    0.000041;1.000000;0.000000;,
    0.000019;1.000000;0.000020;,
    0.000041;1.000000;0.000000;,
    0.000021;1.000000;0.000018;;
    40;
    3;0,1,2;,
    3;3,4,5;,
    3;6,7,8;,
    3;9,10,11;,
    3;12,13,14;,
    3;15,16,17;,
    3;18,19,20;,
    3;21,22,23;,
    3;24,25,26;,
    3;27,28,29;,
    3;30,31,32;,
    3;33,34,35;,
    3;36,37,38;,
    3;39,40,41;,
    3;42,43,44;,
    3;45,46,47;,
    3;48,49,50;,
    3;51,52,53;,
    3;54,55,56;,
    3;57,58,59;,
    3;60,61,62;,
    3;63,64,65;,
    3;66,67,68;,
    3;69,70,71;,
    3;72,73,74;,
    3;75,76,77;,
    3;78,79,80;,
    3;81,82,83;,
    3;84,85,86;,
    3;87,88,89;,
    3;90,91,92;,
    3;93,94,95;,
    3;96,97,98;,
    3;99,100,101;,
    3;102,103,104;,
    3;105,106,107;,
    3;108,109,110;,
    3;111,112,113;,
    3;114,115,116;,
    3;117,118,119;;
   }

   MeshMaterialList  {
    1;
    40;
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0;
    { buildz5 }
   }

   MeshTextureCoords  {
    120;
    0.497372;0.408221;,
    0.497373;0.686411;,
    0.445390;0.438597;,
    0.444207;0.658331;,
    0.445390;0.438597;,
    0.497373;0.686411;,
    0.445390;0.438597;,
    0.444207;0.658331;,
    0.496858;0.408221;,
    0.496859;0.686411;,
    0.496858;0.408221;,
    0.444207;0.658331;,
    0.495942;0.566715;,
    0.495942;0.617723;,
    0.454711;0.565765;,
    0.495942;0.566715;,
    0.454711;0.565765;,
    0.495942;0.502354;,
    0.496211;0.567144;,
    0.496211;0.622090;,
    0.454660;0.566116;,
    0.496211;0.567144;,
    0.454660;0.566116;,
    0.496211;0.507370;,
    0.979564;0.408872;,
    0.979564;0.600260;,
    0.849376;0.408872;,
    0.849376;0.408872;,
    0.979564;0.600260;,
    0.725337;0.409718;,
    0.725337;0.409718;,
    0.979564;0.600260;,
    0.725337;0.601106;,
    0.979564;0.408872;,
    0.979564;0.600260;,
    0.850157;0.408872;,
    0.850157;0.408872;,
    0.979564;0.600260;,
    0.725337;0.409718;,
    0.725337;0.409718;,
    0.979564;0.600260;,
    0.725337;0.601106;,
    0.494472;0.409816;,
    0.494777;0.493891;,
    0.441729;0.409983;,
    0.441746;0.494042;,
    0.441729;0.409983;,
    0.494777;0.493891;,
    0.586910;0.590420;,
    0.586910;0.704416;,
    0.744223;0.589732;,
    0.745160;0.703570;,
    0.744223;0.589732;,
    0.586910;0.704416;,
    0.997277;0.703570;,
    0.721595;0.703570;,
    0.997277;0.589574;,
    0.721595;0.589574;,
    0.997277;0.589574;,
    0.721595;0.703570;,
    0.860695;0.703570;,
    0.585013;0.703570;,
    0.860695;0.589574;,
    0.585013;0.589574;,
    0.860695;0.589574;,
    0.585013;0.703570;,
    0.997277;0.408872;,
    0.997277;0.600260;,
    0.723178;0.508724;,
    0.723081;0.600260;,
    0.723178;0.508724;,
    0.997277;0.600260;,
    0.626343;0.508756;,
    0.549945;0.408872;,
    0.723178;0.508724;,
    0.997277;0.408872;,
    0.723178;0.508724;,
    0.549945;0.408872;,
    0.626443;0.600260;,
    0.549945;0.600260;,
    0.626343;0.508756;,
    0.549945;0.408872;,
    0.626343;0.508756;,
    0.549945;0.600260;,
    0.741289;0.612611;,
    0.741289;0.697375;,
    0.548486;0.612611;,
    0.548486;0.697375;,
    0.548486;0.612611;,
    0.741289;0.697375;,
    0.009762;-0.190155;,
    0.098765;-0.190155;,
    0.009762;-0.018777;,
    0.098765;-0.018777;,
    0.009762;-0.018777;,
    0.098765;-0.190155;,
    0.741289;0.697375;,
    0.741289;0.612611;,
    0.548486;0.697375;,
    0.548486;0.612611;,
    0.548486;0.697375;,
    0.741289;0.612611;,
    0.997277;0.408872;,
    0.723206;0.508815;,
    0.997277;0.600260;,
    0.723081;0.600260;,
    0.997277;0.600260;,
    0.723206;0.508815;,
    0.626410;0.508685;,
    0.723206;0.508815;,
    0.549945;0.408872;,
    0.997277;0.408872;,
    0.549945;0.408872;,
    0.723206;0.508815;,
    0.626443;0.600260;,
    0.626410;0.508685;,
    0.549945;0.600260;,
    0.549945;0.408872;,
    0.549945;0.600260;,
    0.626410;0.508685;;
   }
  }
 }
}