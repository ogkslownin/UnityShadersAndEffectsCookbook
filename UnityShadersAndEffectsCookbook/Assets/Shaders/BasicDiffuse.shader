Shader "CookbookShaders/BasicDiffuse" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_EmissiveColor ( "Emissive Color", Color ) = (1, 1, 1, 1)
		_AmbientColor ( "Ambient Color", Range(0,10) ) = 2
		_MySliderValue ( "This is a Slider", Range(0,10) ) = 2.5
		_MyRectValue ( "This is a Rect", Rect ) = "name" {}
		_MyCubeValue ( "This is a Cube", Cube ) = "name" {}
		_MyFloatValue ( "This is a Float", Float ) = 0.5
		_MyVectorValue ( "This is a Vector", Vector ) = (1,2,3,4)
		
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		#pragma surface surf Lambert

		sampler2D _MainTex;

		struct Input {
			float2 uv_MainTex;
		};

		void surf (Input IN, inout SurfaceOutput o) {
			half4 c = tex2D (_MainTex, IN.uv_MainTex);
			o.Albedo = c.rgb;
			o.Alpha = c.a;
		}
		ENDCG
	} 
	FallBack "Diffuse"
}
