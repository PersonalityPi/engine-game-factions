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

Frame building-scyscrapers_22 {
 

 FrameTransformMatrix {
  1.000000,0.000000,0.000000,0.000000,0.000000,-0.000000,-1.000000,0.000000,0.000000,1.000000,-0.000000,0.000000,0.000000,-12.670539,12.491668,1.000000;;
 }

 Frame {
  

  FrameTransformMatrix {
   1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-0.000000,0.000000,1.000000;;
  }

  Mesh  {
   330;
   -0.015538;-10.384976;24.147505;,
   -19.553570;-10.400024;24.151112;,
   -19.552519;-10.376398;9.919888;,
   -19.552519;-10.376398;9.919888;,
   -0.005172;-10.363503;9.914804;,
   -0.015538;-10.384976;24.147505;,
   -19.552519;-10.376398;9.919888;,
   -19.553570;-10.400024;24.151112;,
   -19.546438;2.699721;24.140293;,
   -19.546438;2.699721;24.140293;,
   -19.555933;2.706560;9.909993;,
   -19.552519;-10.376398;9.919888;,
   -19.553570;-10.400024;24.151112;,
   -0.015538;-10.384976;24.147505;,
   -0.015537;-10.389988;36.520084;,
   -0.015537;-10.389988;36.520084;,
   -19.546139;-10.392508;36.517502;,
   -19.553570;-10.400024;24.151112;,
   -19.548811;2.699721;36.520084;,
   -19.546438;2.699721;24.140293;,
   -19.553570;-10.400024;24.151112;,
   -19.553570;-10.400024;24.151112;,
   -19.546139;-10.392508;36.517502;,
   -19.548811;2.699721;36.520084;,
   -0.015539;-10.400009;48.601952;,
   -19.538704;-10.384992;48.598347;,
   -19.546139;-10.392508;36.517502;,
   -19.546139;-10.392508;36.517502;,
   -0.015537;-10.389988;36.520084;,
   -0.015539;-10.400009;48.601952;,
   -19.538704;-10.384992;48.598347;,
   -19.553572;2.699721;48.591129;,
   -19.548811;2.699721;36.520084;,
   -19.548811;2.699721;36.520084;,
   -19.546139;-10.392508;36.517502;,
   -19.538704;-10.384992;48.598347;,
   -15.377216;-7.595906;60.976089;,
   -0.015539;-10.400009;48.601952;,
   -0.015537;-7.607723;60.976089;,
   -15.388924;2.699721;60.976089;,
   -0.015537;-7.607723;60.976089;,
   -0.015538;2.699724;60.976082;,
   -0.015537;-7.607723;60.976089;,
   -15.388924;2.699721;60.976089;,
   -15.377216;-7.595906;60.976089;,
   -0.015539;-10.400009;48.601952;,
   -15.377216;-7.595906;60.976089;,
   -19.538704;-10.384992;48.598347;,
   -15.388924;2.699721;60.976089;,
   -19.538704;-10.384992;48.598347;,
   -15.377216;-7.595906;60.976089;,
   -19.538704;-10.384992;48.598347;,
   -15.388924;2.699721;60.976089;,
   -19.553572;2.699721;48.591129;,
   19.522499;-10.400016;24.151115;,
   -0.015538;-10.384976;24.147505;,
   19.536991;-10.376389;9.919890;,
   -0.005172;-10.363503;9.914804;,
   19.536991;-10.376389;9.919890;,
   -0.015538;-10.384976;24.147505;,
   19.522499;-10.400016;24.151115;,
   19.536991;-10.376389;9.919890;,
   19.515360;2.699729;24.140293;,
   19.545584;2.706574;9.909996;,
   19.515360;2.699729;24.140293;,
   19.536991;-10.376389;9.919890;,
   -0.015538;-10.384976;24.147505;,
   19.522499;-10.400016;24.151115;,
   -0.015537;-10.389988;36.520084;,
   19.515062;-10.392499;36.517502;,
   -0.015537;-10.389988;36.520084;,
   19.522499;-10.400016;24.151115;,
   19.515360;2.699729;24.140293;,
   19.517735;2.699729;36.520084;,
   19.522499;-10.400016;24.151115;,
   19.515062;-10.392499;36.517502;,
   19.522499;-10.400016;24.151115;,
   19.517735;2.699729;36.520084;,
   19.507627;-10.384983;48.598347;,
   -0.015539;-10.400009;48.601952;,
   19.515062;-10.392499;36.517502;,
   -0.015537;-10.389988;36.520084;,
   19.515062;-10.392499;36.517502;,
   -0.015539;-10.400009;48.601952;,
   19.522499;2.699729;48.591129;,
   19.507627;-10.384983;48.598347;,
   19.517735;2.699729;36.520084;,
   19.515062;-10.392499;36.517502;,
   19.517735;2.699729;36.520084;,
   19.507627;-10.384983;48.598347;,
   -0.015539;-10.400009;48.601952;,
   15.346142;-7.595900;60.976089;,
   -0.015537;-7.607723;60.976089;,
   -0.015537;-7.607723;60.976089;,
   15.346142;-7.595900;60.976089;,
   15.357849;2.699727;60.976089;,
   15.357849;2.699727;60.976089;,
   -0.015538;2.699724;60.976082;,
   -0.015537;-7.607723;60.976089;,
   15.346142;-7.595900;60.976089;,
   -0.015539;-10.400009;48.601952;,
   19.507627;-10.384983;48.598347;,
   19.507627;-10.384983;48.598347;,
   15.357849;2.699727;60.976089;,
   15.346142;-7.595900;60.976089;,
   15.357849;2.699727;60.976089;,
   19.507627;-10.384983;48.598347;,
   19.522499;2.699729;48.591129;,
   -19.553574;15.799460;24.151115;,
   -0.015541;15.784422;24.147505;,
   -19.552521;15.786086;9.919890;,
   -0.005175;15.776628;9.914804;,
   -19.552521;15.786086;9.919890;,
   -0.015541;15.784422;24.147505;,
   -19.553574;15.799460;24.151115;,
   -19.552521;15.786086;9.919890;,
   -19.546438;2.699721;24.140293;,
   -19.555933;2.706560;9.909993;,
   -19.546438;2.699721;24.140293;,
   -19.552521;15.786086;9.919890;,
   -0.015541;15.784422;24.147505;,
   -19.553574;15.799460;24.151115;,
   -0.015540;15.789438;36.520084;,
   -19.546143;15.791944;36.517502;,
   -0.015540;15.789438;36.520084;,
   -19.553574;15.799460;24.151115;,
   -19.546438;2.699721;24.140293;,
   -19.548811;2.699721;36.520084;,
   -19.553574;15.799460;24.151115;,
   -19.546143;15.791944;36.517502;,
   -19.553574;15.799460;24.151115;,
   -19.548811;2.699721;36.520084;,
   -19.538706;15.784428;48.598347;,
   -0.015542;15.799459;48.601952;,
   -19.546143;15.791944;36.517502;,
   -0.015540;15.789438;36.520084;,
   -19.546143;15.791944;36.517502;,
   -0.015542;15.799459;48.601952;,
   -19.553572;2.699721;48.591129;,
   -19.538706;15.784428;48.598347;,
   -19.548811;2.699721;36.520084;,
   -19.546143;15.791944;36.517502;,
   -19.548811;2.699721;36.520084;,
   -19.538706;15.784428;48.598347;,
   -0.015542;15.799459;48.601952;,
   -15.377218;12.995343;60.976089;,
   -0.015539;13.007171;60.976089;,
   -0.015539;13.007171;60.976089;,
   -15.377218;12.995343;60.976089;,
   -15.388924;2.699721;60.976089;,
   -15.388924;2.699721;60.976089;,
   -0.015538;2.699724;60.976082;,
   -0.015539;13.007171;60.976089;,
   -15.377218;12.995343;60.976089;,
   -0.015542;15.799459;48.601952;,
   -19.538706;15.784428;48.598347;,
   -19.538706;15.784428;48.598347;,
   -15.388924;2.699721;60.976089;,
   -15.377218;12.995343;60.976089;,
   -15.388924;2.699721;60.976089;,
   -19.538706;15.784428;48.598347;,
   -19.553572;2.699721;48.591129;,
   -0.015541;15.784422;24.147505;,
   19.522493;15.799469;24.151115;,
   19.536987;15.786099;9.919890;,
   19.536987;15.786099;9.919890;,
   -0.005175;15.776628;9.914804;,
   -0.015541;15.784422;24.147505;,
   19.536987;15.786099;9.919890;,
   19.522493;15.799469;24.151115;,
   19.515360;2.699729;24.140293;,
   19.515360;2.699729;24.140293;,
   19.545584;2.706574;9.909996;,
   19.536987;15.786099;9.919890;,
   19.522493;15.799469;24.151115;,
   -0.015541;15.784422;24.147505;,
   -0.015540;15.789438;36.520084;,
   -0.015540;15.789438;36.520084;,
   19.515059;15.791953;36.517502;,
   19.522493;15.799469;24.151115;,
   19.517735;2.699729;36.520084;,
   19.515360;2.699729;24.140293;,
   19.522493;15.799469;24.151115;,
   19.522493;15.799469;24.151115;,
   19.515059;15.791953;36.517502;,
   19.517735;2.699729;36.520084;,
   -0.015542;15.799459;48.601952;,
   19.507626;15.784436;48.598347;,
   19.515059;15.791953;36.517502;,
   19.515059;15.791953;36.517502;,
   -0.015540;15.789438;36.520084;,
   -0.015542;15.799459;48.601952;,
   19.507626;15.784436;48.598347;,
   19.522499;2.699729;48.591129;,
   19.517735;2.699729;36.520084;,
   19.517735;2.699729;36.520084;,
   19.515059;15.791953;36.517502;,
   19.507626;15.784436;48.598347;,
   15.346142;12.995349;60.976089;,
   -0.015542;15.799459;48.601952;,
   -0.015539;13.007171;60.976089;,
   15.357849;2.699727;60.976089;,
   -0.015539;13.007171;60.976089;,
   -0.015538;2.699724;60.976082;,
   -0.015539;13.007171;60.976089;,
   15.357849;2.699727;60.976089;,
   15.346142;12.995349;60.976089;,
   -0.015542;15.799459;48.601952;,
   15.346142;12.995349;60.976089;,
   19.507626;15.784436;48.598347;,
   15.357849;2.699727;60.976089;,
   19.507626;15.784436;48.598347;,
   15.346142;12.995349;60.976089;,
   19.507626;15.784436;48.598347;,
   15.357849;2.699727;60.976089;,
   19.522499;2.699729;48.591129;,
   -23.021860;-13.325235;0.039829;,
   0.000010;-13.325220;0.039832;,
   0.000010;-13.325220;7.430794;,
   -23.021860;-13.325235;0.039829;,
   0.000010;-13.325220;7.430794;,
   -23.021860;-13.325235;7.433507;,
   -23.021860;-13.325235;7.433507;,
   -23.003956;2.709977;7.433507;,
   -22.982809;2.709977;0.000000;,
   -22.982809;2.709977;0.000000;,
   -23.021860;-13.325235;0.039829;,
   -23.021860;-13.325235;7.433507;,
   0.000010;-13.325220;7.430794;,
   -19.552519;-10.376398;9.919888;,
   -23.021860;-13.325235;7.433507;,
   -19.552519;-10.376398;9.919888;,
   0.000010;-13.325220;7.430794;,
   -0.005172;-10.363503;9.914804;,
   -19.552519;-10.376398;9.919888;,
   -19.555933;2.706560;9.909993;,
   -23.003956;2.709977;7.433507;,
   -23.003956;2.709977;7.433507;,
   -23.021860;-13.325235;7.433507;,
   -19.552519;-10.376398;9.919888;,
   0.000010;-13.325220;0.039832;,
   23.021879;-13.325225;0.039829;,
   0.000010;-13.325220;7.430794;,
   0.000010;-13.325220;7.430794;,
   23.021879;-13.325225;0.039829;,
   23.021879;-13.325225;7.433507;,
   23.003973;2.709987;7.433507;,
   23.021879;-13.325225;7.433507;,
   22.982824;2.709987;0.000000;,
   23.021879;-13.325225;0.039829;,
   22.982824;2.709987;0.000000;,
   23.021879;-13.325225;7.433507;,
   19.536991;-10.376389;9.919890;,
   0.000010;-13.325220;7.430794;,
   23.021879;-13.325225;7.433507;,
   0.000010;-13.325220;7.430794;,
   19.536991;-10.376389;9.919890;,
   -0.005172;-10.363503;9.914804;,
   19.545584;2.706574;9.909996;,
   19.536991;-10.376389;9.919890;,
   23.003973;2.709987;7.433507;,
   23.021879;-13.325225;7.433507;,
   23.003973;2.709987;7.433507;,
   19.536991;-10.376389;9.919890;,
   0.000005;18.745182;0.039832;,
   -23.021864;18.745188;0.039829;,
   0.000005;18.745182;7.430794;,
   0.000005;18.745182;7.430794;,
   -23.021864;18.745188;0.039829;,
   -23.021864;18.745188;7.433507;,
   -23.003956;2.709977;7.433507;,
   -23.021864;18.745188;7.433507;,
   -22.982809;2.709977;0.000000;,
   -23.021864;18.745188;0.039829;,
   -22.982809;2.709977;0.000000;,
   -23.021864;18.745188;7.433507;,
   -19.552521;15.786086;9.919890;,
   0.000005;18.745182;7.430794;,
   -23.021864;18.745188;7.433507;,
   0.000005;18.745182;7.430794;,
   -19.552521;15.786086;9.919890;,
   -0.005175;15.776628;9.914804;,
   -19.555933;2.706560;9.909993;,
   -19.552521;15.786086;9.919890;,
   -23.003956;2.709977;7.433507;,
   -23.021864;18.745188;7.433507;,
   -23.003956;2.709977;7.433507;,
   -19.552521;15.786086;9.919890;,
   23.021875;18.745205;0.039829;,
   0.000005;18.745182;0.039832;,
   0.000005;18.745182;7.430794;,
   23.021875;18.745205;0.039829;,
   0.000005;18.745182;7.430794;,
   23.021875;18.745205;7.433507;,
   23.021875;18.745205;7.433507;,
   23.003973;2.709987;7.433507;,
   22.982824;2.709987;0.000000;,
   22.982824;2.709987;0.000000;,
   23.021875;18.745205;0.039829;,
   23.021875;18.745205;7.433507;,
   0.000005;18.745182;7.430794;,
   19.536987;15.786099;9.919890;,
   23.021875;18.745205;7.433507;,
   19.536987;15.786099;9.919890;,
   0.000005;18.745182;7.430794;,
   -0.005175;15.776628;9.914804;,
   19.536987;15.786099;9.919890;,
   19.545584;2.706574;9.909996;,
   23.003973;2.709987;7.433507;,
   23.003973;2.709987;7.433507;,
   23.021875;18.745205;7.433507;,
   19.536987;15.786099;9.919890;,
   8.472265;-13.193735;4.323890;,
   7.680809;-18.745193;4.558544;,
   -8.700500;-13.193749;4.323890;,
   -7.909056;-18.745188;4.558544;,
   -8.700500;-13.193749;4.323890;,
   7.680809;-18.745193;4.558544;,
   -7.909056;-18.745188;4.558544;,
   7.680809;-18.745193;4.558544;,
   -7.909060;-13.182479;6.230959;,
   7.680806;-13.182476;6.230959;,
   -7.909060;-13.182479;6.230959;,
   7.680809;-18.745193;4.558544;,
   7.680809;-18.745193;4.558544;,
   8.472265;-13.193735;4.323890;,
   7.680806;-13.182476;6.230959;,
   -7.909060;-13.182479;6.230959;,
   -8.700500;-13.193749;4.323890;,
   -7.909056;-18.745188;4.558544;;
   110;
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
   3;117,118,119;,
   3;120,121,122;,
   3;123,124,125;,
   3;126,127,128;,
   3;129,130,131;,
   3;132,133,134;,
   3;135,136,137;,
   3;138,139,140;,
   3;141,142,143;,
   3;144,145,146;,
   3;147,148,149;,
   3;150,151,152;,
   3;153,154,155;,
   3;156,157,158;,
   3;159,160,161;,
   3;162,163,164;,
   3;165,166,167;,
   3;168,169,170;,
   3;171,172,173;,
   3;174,175,176;,
   3;177,178,179;,
   3;180,181,182;,
   3;183,184,185;,
   3;186,187,188;,
   3;189,190,191;,
   3;192,193,194;,
   3;195,196,197;,
   3;198,199,200;,
   3;201,202,203;,
   3;204,205,206;,
   3;207,208,209;,
   3;210,211,212;,
   3;213,214,215;,
   3;216,217,218;,
   3;219,220,221;,
   3;222,223,224;,
   3;225,226,227;,
   3;228,229,230;,
   3;231,232,233;,
   3;234,235,236;,
   3;237,238,239;,
   3;240,241,242;,
   3;243,244,245;,
   3;246,247,248;,
   3;249,250,251;,
   3;252,253,254;,
   3;255,256,257;,
   3;258,259,260;,
   3;261,262,263;,
   3;264,265,266;,
   3;267,268,269;,
   3;270,271,272;,
   3;273,274,275;,
   3;276,277,278;,
   3;279,280,281;,
   3;282,283,284;,
   3;285,286,287;,
   3;288,289,290;,
   3;291,292,293;,
   3;294,295,296;,
   3;297,298,299;,
   3;300,301,302;,
   3;303,304,305;,
   3;306,307,308;,
   3;309,310,311;,
   3;312,313,314;,
   3;315,316,317;,
   3;318,319,320;,
   3;321,322,323;,
   3;324,325,326;,
   3;327,328,329;;

   MeshNormals  {
    330;
    0.000000;-1.000000;-0.000987;,
    0.000565;-1.000000;-0.000708;,
    0.000412;-0.866690;0.498846;,
    0.000412;-0.866690;0.498846;,
    0.000000;-0.906582;0.422029;,
    0.000000;-1.000000;-0.000987;,
    -1.000000;0.000121;0.000317;,
    -1.000000;0.000350;0.000073;,
    -1.000000;-0.000000;0.000043;,
    -1.000000;-0.000000;0.000043;,
    -1.000000;0.000000;0.000667;,
    -1.000000;0.000121;0.000317;,
    0.000565;-1.000000;-0.000708;,
    0.000000;-1.000000;-0.000987;,
    0.000000;-1.000000;-0.000435;,
    0.000000;-1.000000;-0.000435;,
    -0.000162;-1.000000;0.000359;,
    0.000565;-1.000000;-0.000708;,
    -1.000000;-0.000000;0.000138;,
    -1.000000;-0.000000;0.000043;,
    -1.000000;0.000350;0.000073;,
    -1.000000;0.000350;0.000073;,
    -1.000000;-0.000204;0.000608;,
    -1.000000;-0.000000;0.000138;,
    0.000000;-0.993867;0.110580;,
    -0.000784;-0.995126;0.098603;,
    -0.000162;-1.000000;0.000359;,
    -0.000162;-1.000000;0.000359;,
    0.000000;-1.000000;-0.000435;,
    0.000000;-0.993867;0.110580;,
    -0.988680;-0.000810;0.150037;,
    -0.986919;-0.000000;0.161215;,
    -1.000000;-0.000000;0.000138;,
    -1.000000;-0.000000;0.000138;,
    -1.000000;-0.000204;0.000608;,
    -0.988680;-0.000810;0.150037;,
    -0.000776;-0.975479;0.220090;,
    0.000000;-0.993867;0.110580;,
    0.000000;-0.975473;0.220120;,
    0.000000;0.000000;1.000000;,
    -0.000000;0.000000;1.000000;,
    0.000000;0.000000;1.000000;,
    -0.000000;0.000000;1.000000;,
    0.000000;0.000000;1.000000;,
    0.000000;0.000000;1.000000;,
    0.000000;-0.993867;0.110580;,
    -0.000776;-0.975479;0.220090;,
    -0.000784;-0.995126;0.098603;,
    -0.947818;-0.000000;0.318813;,
    -0.988680;-0.000810;0.150037;,
    -0.947789;-0.001078;0.318896;,
    -0.988680;-0.000810;0.150037;,
    -0.947818;-0.000000;0.318813;,
    -0.986919;-0.000000;0.161215;,
    -0.000564;-1.000000;-0.000709;,
    0.000000;-1.000000;-0.000987;,
    -0.000411;-0.866506;0.499166;,
    0.000000;-0.906582;0.422029;,
    -0.000411;-0.866506;0.499166;,
    0.000000;-1.000000;-0.000987;,
    1.000000;0.000351;0.000619;,
    0.999999;-0.000086;0.001601;,
    1.000000;0.000000;0.000675;,
    0.999998;0.000000;0.002124;,
    1.000000;0.000000;0.000675;,
    0.999999;-0.000086;0.001601;,
    0.000000;-1.000000;-0.000987;,
    -0.000564;-1.000000;-0.000709;,
    0.000000;-1.000000;-0.000435;,
    0.000162;-1.000000;0.000359;,
    0.000000;-1.000000;-0.000435;,
    -0.000564;-1.000000;-0.000709;,
    1.000000;0.000000;0.000675;,
    1.000000;0.000000;0.000137;,
    1.000000;0.000351;0.000619;,
    1.000000;-0.000204;0.000609;,
    1.000000;0.000351;0.000619;,
    1.000000;0.000000;0.000137;,
    0.000784;-0.995126;0.098603;,
    0.000000;-0.993867;0.110580;,
    0.000162;-1.000000;0.000359;,
    0.000000;-1.000000;-0.000435;,
    0.000162;-1.000000;0.000359;,
    0.000000;-0.993867;0.110580;,
    0.986919;0.000000;0.161215;,
    0.988680;-0.000810;0.150036;,
    1.000000;0.000000;0.000137;,
    1.000000;-0.000204;0.000609;,
    1.000000;0.000000;0.000137;,
    0.988680;-0.000810;0.150036;,
    0.000000;-0.993867;0.110580;,
    0.000777;-0.975479;0.220090;,
    0.000000;-0.975473;0.220120;,
    -0.000000;0.000000;1.000000;,
    0.000000;0.000000;1.000000;,
    -0.000000;-0.000000;1.000000;,
    -0.000000;-0.000000;1.000000;,
    0.000000;0.000000;1.000000;,
    -0.000000;0.000000;1.000000;,
    0.000777;-0.975479;0.220090;,
    0.000000;-0.993867;0.110580;,
    0.000784;-0.995126;0.098603;,
    0.988680;-0.000810;0.150036;,
    0.947818;0.000000;0.318813;,
    0.947789;-0.001078;0.318896;,
    0.947818;0.000000;0.318813;,
    0.988680;-0.000810;0.150036;,
    0.986919;0.000000;0.161215;,
    0.000564;1.000000;-0.000348;,
    -0.000000;1.000000;-0.000555;,
    0.000374;0.866078;0.499908;,
    -0.000000;0.906131;0.422997;,
    0.000374;0.866078;0.499908;,
    -0.000000;1.000000;-0.000555;,
    -1.000000;-0.000351;0.000073;,
    -1.000000;-0.000121;0.000316;,
    -1.000000;-0.000000;0.000043;,
    -1.000000;0.000000;0.000667;,
    -1.000000;-0.000000;0.000043;,
    -1.000000;-0.000121;0.000316;,
    -0.000000;1.000000;-0.000555;,
    0.000564;1.000000;-0.000348;,
    -0.000000;1.000000;-0.000435;,
    -0.000162;1.000000;0.000359;,
    -0.000000;1.000000;-0.000435;,
    0.000564;1.000000;-0.000348;,
    -1.000000;-0.000000;0.000043;,
    -1.000000;-0.000000;0.000138;,
    -1.000000;-0.000351;0.000073;,
    -1.000000;0.000204;0.000608;,
    -1.000000;-0.000351;0.000073;,
    -1.000000;-0.000000;0.000138;,
    -0.000784;0.995126;0.098603;,
    -0.000000;0.993867;0.110580;,
    -0.000162;1.000000;0.000359;,
    -0.000000;1.000000;-0.000435;,
    -0.000162;1.000000;0.000359;,
    -0.000000;0.993867;0.110580;,
    -0.986919;-0.000000;0.161215;,
    -0.988680;0.000810;0.150037;,
    -1.000000;-0.000000;0.000138;,
    -1.000000;0.000204;0.000608;,
    -1.000000;-0.000000;0.000138;,
    -0.988680;0.000810;0.150037;,
    -0.000000;0.993867;0.110580;,
    -0.000777;0.975479;0.220090;,
    -0.000000;0.975473;0.220121;,
    0.000000;-0.000000;1.000000;,
    0.000000;0.000000;1.000000;,
    0.000000;0.000000;1.000000;,
    0.000000;0.000000;1.000000;,
    0.000000;0.000000;1.000000;,
    0.000000;-0.000000;1.000000;,
    -0.000777;0.975479;0.220090;,
    -0.000000;0.993867;0.110580;,
    -0.000784;0.995126;0.098603;,
    -0.988680;0.000810;0.150037;,
    -0.947818;-0.000000;0.318813;,
    -0.947789;0.001078;0.318896;,
    -0.947818;-0.000000;0.318813;,
    -0.988680;0.000810;0.150037;,
    -0.986919;-0.000000;0.161215;,
    -0.000000;1.000000;-0.000555;,
    -0.000565;1.000000;-0.000349;,
    -0.000375;0.865893;0.500229;,
    -0.000375;0.865893;0.500229;,
    -0.000000;0.906131;0.422997;,
    -0.000000;1.000000;-0.000555;,
    0.999999;0.000087;0.001601;,
    1.000000;-0.000351;0.000619;,
    1.000000;0.000000;0.000675;,
    1.000000;0.000000;0.000675;,
    0.999998;0.000000;0.002124;,
    0.999999;0.000087;0.001601;,
    -0.000565;1.000000;-0.000349;,
    -0.000000;1.000000;-0.000555;,
    -0.000000;1.000000;-0.000435;,
    -0.000000;1.000000;-0.000435;,
    0.000162;1.000000;0.000359;,
    -0.000565;1.000000;-0.000349;,
    1.000000;0.000000;0.000137;,
    1.000000;0.000000;0.000675;,
    1.000000;-0.000351;0.000619;,
    1.000000;-0.000351;0.000619;,
    1.000000;0.000205;0.000608;,
    1.000000;0.000000;0.000137;,
    -0.000000;0.993867;0.110580;,
    0.000784;0.995126;0.098604;,
    0.000162;1.000000;0.000359;,
    0.000162;1.000000;0.000359;,
    -0.000000;1.000000;-0.000435;,
    -0.000000;0.993867;0.110580;,
    0.988680;0.000810;0.150036;,
    0.986919;0.000000;0.161215;,
    1.000000;0.000000;0.000137;,
    1.000000;0.000000;0.000137;,
    1.000000;0.000205;0.000608;,
    0.988680;0.000810;0.150036;,
    0.000776;0.975479;0.220090;,
    -0.000000;0.993867;0.110580;,
    -0.000000;0.975473;0.220121;,
    -0.000000;-0.000000;1.000000;,
    0.000000;-0.000000;1.000000;,
    0.000000;0.000000;1.000000;,
    0.000000;-0.000000;1.000000;,
    -0.000000;-0.000000;1.000000;,
    0.000000;0.000000;1.000000;,
    -0.000000;0.993867;0.110580;,
    0.000776;0.975479;0.220090;,
    0.000784;0.995126;0.098604;,
    0.947818;0.000000;0.318813;,
    0.988680;0.000810;0.150036;,
    0.947789;0.001078;0.318896;,
    0.988680;0.000810;0.150036;,
    0.947818;0.000000;0.318813;,
    0.986919;0.000000;0.161215;,
    0.000001;-1.000000;0.000000;,
    0.000000;-1.000000;0.000000;,
    -0.000000;-0.906342;0.422545;,
    0.000001;-1.000000;0.000000;,
    -0.000000;-0.906342;0.422545;,
    0.000035;-0.956880;0.290483;,
    -0.938752;0.001708;0.344590;,
    -0.890318;-0.000000;0.455339;,
    -0.999998;-0.000000;-0.002062;,
    -0.999998;-0.000000;-0.002062;,
    -0.999997;0.002435;0.000000;,
    -0.938752;0.001708;0.344590;,
    -0.000000;-0.906342;0.422545;,
    0.000412;-0.866690;0.498846;,
    0.000035;-0.956880;0.290483;,
    0.000412;-0.866690;0.498846;,
    -0.000000;-0.906342;0.422545;,
    0.000000;-0.906582;0.422029;,
    -0.582955;0.000624;0.812504;,
    -0.583359;0.000000;0.812214;,
    -0.890318;-0.000000;0.455339;,
    -0.890318;-0.000000;0.455339;,
    -0.938752;0.001708;0.344590;,
    -0.582955;0.000624;0.812504;,
    0.000000;-1.000000;0.000000;,
    -0.000000;-1.000000;0.000000;,
    -0.000000;-0.906342;0.422545;,
    -0.000000;-0.906342;0.422545;,
    -0.000000;-1.000000;0.000000;,
    -0.000034;-0.957039;0.289958;,
    0.889962;0.000000;0.456034;,
    0.938377;0.001708;0.345610;,
    0.999998;0.000000;-0.002062;,
    0.999997;0.002436;0.000000;,
    0.999998;0.000000;-0.002062;,
    0.938377;0.001708;0.345610;,
    -0.000411;-0.866506;0.499166;,
    -0.000000;-0.906342;0.422545;,
    -0.000034;-0.957039;0.289958;,
    -0.000000;-0.906342;0.422545;,
    -0.000411;-0.866506;0.499166;,
    0.000000;-0.906582;0.422029;,
    0.582205;0.000000;0.813042;,
    0.581316;0.000589;0.813678;,
    0.889962;0.000000;0.456034;,
    0.938377;0.001708;0.345610;,
    0.889962;0.000000;0.456034;,
    0.581316;0.000589;0.813678;,
    -0.000000;1.000000;0.000000;,
    0.000000;1.000000;0.000000;,
    -0.000001;0.906087;0.423092;,
    -0.000001;0.906087;0.423092;,
    0.000000;1.000000;0.000000;,
    0.000035;0.956649;0.291244;,
    -0.890318;-0.000000;0.455339;,
    -0.938890;-0.001709;0.344212;,
    -0.999998;-0.000000;-0.002062;,
    -0.999997;-0.002436;0.000000;,
    -0.999998;-0.000000;-0.002062;,
    -0.938890;-0.001709;0.344212;,
    0.000374;0.866078;0.499908;,
    -0.000001;0.906087;0.423092;,
    0.000035;0.956649;0.291244;,
    -0.000001;0.906087;0.423092;,
    0.000374;0.866078;0.499908;,
    -0.000000;0.906131;0.422997;,
    -0.583359;0.000000;0.812214;,
    -0.582957;-0.000624;0.812503;,
    -0.890318;-0.000000;0.455339;,
    -0.938890;-0.001709;0.344212;,
    -0.890318;-0.000000;0.455339;,
    -0.582957;-0.000624;0.812503;,
    -0.000001;1.000000;0.000000;,
    -0.000000;1.000000;0.000000;,
    -0.000001;0.906087;0.423092;,
    -0.000001;1.000000;0.000000;,
    -0.000001;0.906087;0.423092;,
    -0.000035;0.956809;0.290719;,
    0.938516;-0.001708;0.345231;,
    0.889962;0.000000;0.456034;,
    0.999998;0.000000;-0.002062;,
    0.999998;0.000000;-0.002062;,
    0.999997;-0.002435;0.000000;,
    0.938516;-0.001708;0.345231;,
    -0.000001;0.906087;0.423092;,
    -0.000375;0.865893;0.500229;,
    -0.000035;0.956809;0.290719;,
    -0.000375;0.865893;0.500229;,
    -0.000001;0.906087;0.423092;,
    -0.000000;0.906131;0.422997;,
    0.581317;-0.000589;0.813677;,
    0.582205;0.000000;0.813042;,
    0.889962;0.000000;0.456034;,
    0.889962;0.000000;0.456034;,
    0.938516;-0.001708;0.345231;,
    0.581317;-0.000589;0.813677;,
    0.000000;-0.042231;-0.999108;,
    0.000000;-0.042231;-0.999108;,
    -0.000000;-0.042231;-0.999108;,
    -0.000000;-0.042231;-0.999108;,
    -0.000000;-0.042231;-0.999108;,
    0.000000;-0.042231;-0.999108;,
    -0.000000;-0.287917;0.957655;,
    0.000000;-0.287917;0.957655;,
    -0.000000;-0.287917;0.957655;,
    0.000000;-0.287916;0.957656;,
    -0.000000;-0.287917;0.957655;,
    0.000000;-0.287917;0.957655;,
    0.917287;-0.114655;0.381364;,
    0.917287;-0.114655;0.381364;,
    0.917287;-0.114655;0.381364;,
    -0.917290;-0.114654;0.381357;,
    -0.917290;-0.114654;0.381357;,
    -0.917290;-0.114654;0.381357;;
    110;
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
    3;117,118,119;,
    3;120,121,122;,
    3;123,124,125;,
    3;126,127,128;,
    3;129,130,131;,
    3;132,133,134;,
    3;135,136,137;,
    3;138,139,140;,
    3;141,142,143;,
    3;144,145,146;,
    3;147,148,149;,
    3;150,151,152;,
    3;153,154,155;,
    3;156,157,158;,
    3;159,160,161;,
    3;162,163,164;,
    3;165,166,167;,
    3;168,169,170;,
    3;171,172,173;,
    3;174,175,176;,
    3;177,178,179;,
    3;180,181,182;,
    3;183,184,185;,
    3;186,187,188;,
    3;189,190,191;,
    3;192,193,194;,
    3;195,196,197;,
    3;198,199,200;,
    3;201,202,203;,
    3;204,205,206;,
    3;207,208,209;,
    3;210,211,212;,
    3;213,214,215;,
    3;216,217,218;,
    3;219,220,221;,
    3;222,223,224;,
    3;225,226,227;,
    3;228,229,230;,
    3;231,232,233;,
    3;234,235,236;,
    3;237,238,239;,
    3;240,241,242;,
    3;243,244,245;,
    3;246,247,248;,
    3;249,250,251;,
    3;252,253,254;,
    3;255,256,257;,
    3;258,259,260;,
    3;261,262,263;,
    3;264,265,266;,
    3;267,268,269;,
    3;270,271,272;,
    3;273,274,275;,
    3;276,277,278;,
    3;279,280,281;,
    3;282,283,284;,
    3;285,286,287;,
    3;288,289,290;,
    3;291,292,293;,
    3;294,295,296;,
    3;297,298,299;,
    3;300,301,302;,
    3;303,304,305;,
    3;306,307,308;,
    3;309,310,311;,
    3;312,313,314;,
    3;315,316,317;,
    3;318,319,320;,
    3;321,322,323;,
    3;324,325,326;,
    3;327,328,329;;
   }

   MeshMaterialList  {
    1;
    110;
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
    { skyscrapers }
   }

   MeshTextureCoords  {
    330;
    0.197280;0.459166;,
    -0.001741;0.459166;,
    -0.001741;0.606591;,
    -0.001741;0.606591;,
    0.197435;0.606591;,
    0.197280;0.459166;,
    -0.001741;0.606591;,
    -0.001741;0.459166;,
    0.136372;0.459166;,
    0.136372;0.459166;,
    0.136527;0.606591;,
    -0.001741;0.606591;,
    -0.001741;0.600078;,
    0.197435;0.600078;,
    0.197280;0.459166;,
    0.197280;0.459166;,
    -0.001741;0.459166;,
    -0.001741;0.600078;,
    0.136372;0.459166;,
    0.136527;0.600078;,
    -0.001741;0.600078;,
    -0.001741;0.600078;,
    -0.001741;0.459166;,
    0.136372;0.459166;,
    0.197280;0.459166;,
    -0.001741;0.459166;,
    -0.001741;0.600078;,
    -0.001741;0.600078;,
    0.197435;0.600078;,
    0.197280;0.459166;,
    -0.001741;0.459166;,
    0.136372;0.459166;,
    0.136527;0.600078;,
    0.136527;0.600078;,
    -0.001741;0.600078;,
    -0.001741;0.459166;,
    -0.001741;0.459166;,
    0.197435;0.600078;,
    0.156675;0.459166;,
    0.763598;0.886457;,
    0.674992;0.973318;,
    0.674992;0.886457;,
    0.674992;0.973318;,
    0.763598;0.886457;,
    0.763598;0.973318;,
    0.197435;0.600078;,
    -0.001741;0.459166;,
    -0.001741;0.600078;,
    0.103150;0.459166;,
    -0.001741;0.600078;,
    -0.001741;0.459166;,
    -0.001741;0.600078;,
    0.103150;0.459166;,
    0.136527;0.600078;,
    -0.001741;0.459166;,
    0.197280;0.459166;,
    -0.001741;0.606591;,
    0.197435;0.606591;,
    -0.001741;0.606591;,
    0.197280;0.459166;,
    -0.001741;0.459166;,
    -0.001741;0.606591;,
    0.136372;0.459166;,
    0.136527;0.606591;,
    0.136372;0.459166;,
    -0.001741;0.606591;,
    0.197435;0.600078;,
    -0.001741;0.600078;,
    0.197280;0.459166;,
    -0.001741;0.459166;,
    0.197280;0.459166;,
    -0.001741;0.600078;,
    0.136527;0.600078;,
    0.136372;0.459166;,
    -0.001741;0.600078;,
    -0.001741;0.459166;,
    -0.001741;0.600078;,
    0.136372;0.459166;,
    -0.001741;0.459166;,
    0.197280;0.459166;,
    -0.001741;0.600078;,
    0.197435;0.600078;,
    -0.001741;0.600078;,
    0.197280;0.459166;,
    0.136372;0.459166;,
    -0.001741;0.459166;,
    0.136527;0.600078;,
    -0.001741;0.600078;,
    0.136527;0.600078;,
    -0.001741;0.459166;,
    0.197435;0.600078;,
    -0.001741;0.459166;,
    0.156675;0.459166;,
    0.763598;0.973318;,
    0.674992;0.973318;,
    0.674992;0.886457;,
    0.674992;0.886457;,
    0.763598;0.886457;,
    0.763598;0.973318;,
    -0.001741;0.459166;,
    0.197435;0.600078;,
    -0.001741;0.600078;,
    -0.001741;0.600078;,
    0.103150;0.459166;,
    -0.001741;0.459166;,
    0.103150;0.459166;,
    -0.001741;0.600078;,
    0.136527;0.600078;,
    -0.001741;0.459166;,
    0.197280;0.459166;,
    -0.001741;0.606591;,
    0.197435;0.606591;,
    -0.001741;0.606591;,
    0.197280;0.459166;,
    -0.001741;0.459166;,
    -0.001741;0.606591;,
    0.136372;0.459166;,
    0.136527;0.606591;,
    0.136372;0.459166;,
    -0.001741;0.606591;,
    0.197435;0.600078;,
    -0.001741;0.600078;,
    0.197280;0.459166;,
    -0.001741;0.459166;,
    0.197280;0.459166;,
    -0.001741;0.600078;,
    0.136527;0.600078;,
    0.136372;0.459166;,
    -0.001741;0.600078;,
    -0.001741;0.459166;,
    -0.001741;0.600078;,
    0.136372;0.459166;,
    -0.001741;0.459166;,
    0.197280;0.459166;,
    -0.001741;0.600078;,
    0.197435;0.600078;,
    -0.001741;0.600078;,
    0.197280;0.459166;,
    0.136372;0.459166;,
    -0.001741;0.459166;,
    0.136527;0.600078;,
    -0.001741;0.600078;,
    0.136527;0.600078;,
    -0.001741;0.459166;,
    0.197435;0.600078;,
    -0.001741;0.459166;,
    0.156675;0.459166;,
    0.674992;0.973318;,
    0.763598;0.973318;,
    0.763598;0.886457;,
    0.763598;0.886457;,
    0.674992;0.886457;,
    0.674992;0.973318;,
    -0.001741;0.459166;,
    0.197435;0.600078;,
    -0.001741;0.600078;,
    -0.001741;0.600078;,
    0.103150;0.459166;,
    -0.001741;0.459166;,
    0.103150;0.459166;,
    -0.001741;0.600078;,
    0.136527;0.600078;,
    0.197280;0.459166;,
    -0.001741;0.459166;,
    -0.001741;0.606591;,
    -0.001741;0.606591;,
    0.197435;0.606591;,
    0.197280;0.459166;,
    -0.001741;0.606591;,
    -0.001741;0.459166;,
    0.136372;0.459166;,
    0.136372;0.459166;,
    0.136527;0.606591;,
    -0.001741;0.606591;,
    -0.001741;0.600078;,
    0.197435;0.600078;,
    0.197280;0.459166;,
    0.197280;0.459166;,
    -0.001741;0.459166;,
    -0.001741;0.600078;,
    0.136372;0.459166;,
    0.136527;0.600078;,
    -0.001741;0.600078;,
    -0.001741;0.600078;,
    -0.001741;0.459166;,
    0.136372;0.459166;,
    0.197280;0.459166;,
    -0.001741;0.459166;,
    -0.001741;0.600078;,
    -0.001741;0.600078;,
    0.197435;0.600078;,
    0.197280;0.459166;,
    -0.001741;0.459166;,
    0.136372;0.459166;,
    0.136527;0.600078;,
    0.136527;0.600078;,
    -0.001741;0.600078;,
    -0.001741;0.459166;,
    -0.001741;0.459166;,
    0.197435;0.600078;,
    0.156675;0.459166;,
    0.674992;0.886457;,
    0.763598;0.973318;,
    0.763598;0.886457;,
    0.763598;0.973318;,
    0.674992;0.886457;,
    0.674992;0.973318;,
    0.197435;0.600078;,
    -0.001741;0.459166;,
    -0.001741;0.600078;,
    0.103150;0.459166;,
    -0.001741;0.600078;,
    -0.001741;0.459166;,
    -0.001741;0.600078;,
    0.103150;0.459166;,
    0.136527;0.600078;,
    -0.224045;0.798204;,
    0.298441;0.798797;,
    0.298441;0.705091;,
    -0.224045;0.798204;,
    0.298441;0.705091;,
    -0.224045;0.705095;,
    0.573566;0.705338;,
    0.942705;0.704967;,
    0.942705;0.798391;,
    0.942705;0.798391;,
    0.573566;0.798394;,
    0.573566;0.705338;,
    0.851877;0.077979;,
    0.685128;0.117408;,
    0.655151;0.077977;,
    0.685128;0.117408;,
    0.851877;0.077979;,
    0.851432;0.117664;,
    0.684282;0.116498;,
    0.799534;0.116500;,
    0.799088;0.077214;,
    0.799088;0.077214;,
    0.660387;0.076958;,
    0.684282;0.116498;,
    0.298441;0.798797;,
    -0.224045;0.798204;,
    0.298441;0.705091;,
    0.298441;0.705091;,
    -0.224045;0.798204;,
    -0.224045;0.705095;,
    0.942705;0.704967;,
    0.573566;0.705338;,
    0.942705;0.798391;,
    0.573566;0.798394;,
    0.942705;0.798391;,
    0.573566;0.705338;,
    0.685128;0.117408;,
    0.851877;0.077979;,
    0.655151;0.077977;,
    0.851877;0.077979;,
    0.685128;0.117408;,
    0.851432;0.117664;,
    0.799534;0.116500;,
    0.684282;0.116498;,
    0.799088;0.077214;,
    0.660387;0.076958;,
    0.799088;0.077214;,
    0.684282;0.116498;,
    0.298441;0.798797;,
    -0.224045;0.798204;,
    0.298441;0.705091;,
    0.298441;0.705091;,
    -0.224045;0.798204;,
    -0.224045;0.705095;,
    0.942705;0.704967;,
    0.573566;0.705338;,
    0.942705;0.798391;,
    0.573566;0.798394;,
    0.942705;0.798391;,
    0.573566;0.705338;,
    0.685128;0.117408;,
    0.851877;0.077979;,
    0.655151;0.077977;,
    0.851877;0.077979;,
    0.685128;0.117408;,
    0.851432;0.117664;,
    0.799534;0.116500;,
    0.684282;0.116498;,
    0.799088;0.077214;,
    0.660387;0.076958;,
    0.799088;0.077214;,
    0.684282;0.116498;,
    -0.224045;0.798204;,
    0.298441;0.798797;,
    0.298441;0.705091;,
    -0.224045;0.798204;,
    0.298441;0.705091;,
    -0.224045;0.705095;,
    0.573566;0.705338;,
    0.942705;0.704967;,
    0.942705;0.798391;,
    0.942705;0.798391;,
    0.573566;0.798394;,
    0.573566;0.705338;,
    0.851877;0.077979;,
    0.685128;0.117408;,
    0.655151;0.077977;,
    0.685128;0.117408;,
    0.851877;0.077979;,
    0.851432;0.117664;,
    0.684282;0.116498;,
    0.799534;0.116500;,
    0.799088;0.077214;,
    0.799088;0.077214;,
    0.660387;0.076958;,
    0.684282;0.116498;,
    0.891998;0.310579;,
    0.891999;0.358534;,
    0.998417;0.310578;,
    0.998418;0.358533;,
    0.998417;0.310578;,
    0.891999;0.358534;,
    0.891998;0.358533;,
    0.998417;0.358533;,
    0.891998;0.310579;,
    0.998417;0.310578;,
    0.891998;0.310579;,
    0.998417;0.358533;,
    0.946025;0.337362;,
    0.998417;0.310578;,
    0.891998;0.310579;,
    0.891998;0.358533;,
    0.998417;0.358533;,
    0.946433;0.335985;;
   }
  }
 }
}