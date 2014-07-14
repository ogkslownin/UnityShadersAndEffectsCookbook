Shader "CookbookShaders/BasicDiffuse" {
	Properties {
		//_MainTex ("Base (RGB)", 2D) = "white" {}
		_EmissiveColor ( "Emissive Color", Color ) = (1, 1, 1, 1)
		_AmbientColor ( "Ambient Color", Color ) = (1, 1, 1, 1)
		_MySliderValue ( "This is a Slider", Range(0,1) ) = 0.5
		//_MyRectValue ( "This is a Rect", Rect ) = "name" {}
		//_MyCubeValue ( "This is a Cube", Cube ) = "name" {}
		//_MyFloatValue ( "This is a Float", Float ) = 0.5
		//_MyVectorValue ( "This is a Vector", Vector ) = (1,2,3,4)
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		#pragma surface surf Lambert

		float4 _EmissiveColor;
		float4 _AmbientColor;
		float _MySliderValue;

		struct Input {
			float2 uv_MainTex;
		};

		void surf (Input IN, inout SurfaceOutput o) {
			float4 c = pow(( _EmissiveColor + _AmbientColor ), _MySliderValue);
			o.Albedo = c.rgb;
			o.Alpha = c.a;
		}
		ENDCG
	} 
	FallBack "Diffuse"
}
