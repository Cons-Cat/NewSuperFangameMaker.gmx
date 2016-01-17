float2 vec2(float x0)
{
    return float2(x0, x0);
}
float2 vec2(float x0, float x1)
{
    return float2(x0, x1);
}
float3 vec3(float x0)
{
    return float3(x0, x0, x0);
}
float4 vec4(float x0)
{
    return float4(x0, x0, x0, x0);
}
float4 vec4(float x0, float x1, float x2, float x3)
{
    return float4(x0, x1, x2, x3);
}
float4 vec4(float3 x0, float x1)
{
    return float4(x0, x1);
}
// Varyings
static float2 _v_vTexcoord = {0, 0};

static float4 gl_Color[1] =
{
    float4(0, 0, 0, 0)
};


uniform bool _border : register(c3);
uniform bool _distort : register(c4);
uniform float _distortion : register(c5);
uniform float _gm_AlphaRefValue : register(c6);
uniform bool _gm_AlphaTestEnabled : register(c7);
uniform float4 _gm_FogColour : register(c8);
uniform bool _gm_PS_FogEnabled : register(c9);
uniform sampler2D _samp_CRT : register(s0);
uniform float2 _textureBaseSize : register(c10);
uniform float2 _textureScaledSize : register(c11);

float4 gl_texture2D(sampler2D s, float2 t)
{
    return tex2D(s, t);
}

#define GL_USES_FRAG_COLOR
float mod(float x, float y)
{
    return x - y * floor(x / y);
}

;
;
;
;
;
void _DoAlphaTest(in float4 _SrcColour)
{
{
if(_gm_AlphaTestEnabled)
{
{
if((_SrcColour.w <= _gm_AlphaRefValue))
{
{
discard;
;
}
;
}
;
}
;
}
;
}
}
;
void _DoFog(inout float4 _SrcColour, in float _fogval)
{
{
if(_gm_PS_FogEnabled)
{
{
(_SrcColour = lerp(_SrcColour, _gm_FogColour, clamp(_fogval, 0.0, 1.0)));
}
;
}
;
}
}
;
;
;
;
;
static float _PI = 3.1415927;
static float _inputGamma = 2.4000001;
static float _outputGamma = 2.8;
;
;
;
float4 _scanlineWeights(in float _dist, in float4 _col)
{
{
float4 _wid = (1.0 + (2.0 * pow(_col, float4(4.0, 4.0, 4.0, 4.0))));
float4 _weights = vec4((_dist * 3.333333));
return ((0.50999999 * exp((-pow(abs((_weights * sqrt((2.0 / _wid)))), _wid)))) / (0.18000001 + (0.059999999 * _wid)));
;
}
}
;
static float2 _overscan = float2(0.99000001, 0.99000001);
static float2 _aspect = vec2((_textureBaseSize.x / _textureBaseSize.x), (_textureBaseSize.y / _textureBaseSize.x));
static float _cornersize = 0.029999999;
static float _cornersmooth = 80.0;
float _corner(in float2 _coord)
{
{
(_coord = (((_coord - float2(0.5, 0.5)) * _overscan) + float2(0.5, 0.5)));
(_coord = (min(_coord, (float2(1.0, 1.0) - _coord)) * _aspect));
float2 _cdist = vec2(_cornersize);
(_coord = (_cdist - min(_coord, _cdist)));
float _dist = sqrt(dot(_coord, _coord));
return clamp(((_cdist.x - _dist) * _cornersmooth), 0.0, 1.0);
;
}
}
;
float2 _radialDistortion(in float2 _coord)
{
{
float2 _cc = (_coord - 0.5);
float _dist = (dot(_cc, _cc) * _distortion);
return (_coord + ((_cc * (1.0 + _dist)) * _dist));
;
}
}
;
void gl_main()
{
{
float2 _one = (1.0 / _textureBaseSize);
float2 __xy = {0, 0};
if((_distort == true))
{
{
(__xy = _radialDistortion(_v_vTexcoord));
}
;
}
else
{
{
(__xy = _v_vTexcoord);
}
;
}
;
float2 _uv_ratio = (frac((__xy * _textureBaseSize)) - float2(0.5, 0.5));
float _cval = _corner(__xy);
(__xy = ((floor((__xy * _textureBaseSize)) + float2(0.5, 0.5)) / _textureBaseSize));
float4 _coeffs = (_PI * vec4((1.0 + _uv_ratio.x), _uv_ratio.x, (1.0 - _uv_ratio.x), (2.0 - _uv_ratio.x)));
(_coeffs = max(abs(_coeffs), 1e-006));
(_coeffs = (((2.0 * sin(_coeffs)) * sin((_coeffs / 2.0))) / (_coeffs * _coeffs)));
(_coeffs /= dot(_coeffs, float4(1.0, 1.0, 1.0, 1.0)));
float4 _col = clamp(((((_coeffs.x * pow(abs(gl_texture2D(_samp_CRT, (__xy + vec2((-_one.x), 0.0)))), vec4(_inputGamma))) + (_coeffs.y * pow(abs(gl_texture2D(_samp_CRT, __xy)), vec4(_inputGamma)))) + (_coeffs.z * pow(abs(gl_texture2D(_samp_CRT, (__xy + vec2(_one.x, 0.0)))), vec4(_inputGamma)))) + (_coeffs.w * pow(abs(gl_texture2D(_samp_CRT, (__xy + vec2((2.0 * _one.x), 0.0)))), vec4(_inputGamma)))), 0.0, 1.0);
float4 _col2 = clamp(((((_coeffs.x * pow(abs(gl_texture2D(_samp_CRT, (__xy + vec2((-_one.x), _one.y)))), vec4(_inputGamma))) + (_coeffs.y * pow(abs(gl_texture2D(_samp_CRT, (__xy + vec2(0.0, _one.y)))), vec4(_inputGamma)))) + (_coeffs.z * pow(abs(gl_texture2D(_samp_CRT, (__xy + _one))), vec4(_inputGamma)))) + (_coeffs.w * pow(abs(gl_texture2D(_samp_CRT, (__xy + vec2((2.0 * _one.x), _one.y)))), vec4(_inputGamma)))), 0.0, 1.0);
float4 _weights = _scanlineWeights(abs(_uv_ratio.y), _col);
float4 _weights2 = _scanlineWeights((1.0 - _uv_ratio.y), _col2);
float _mod_factor = (((_v_vTexcoord.x * _textureScaledSize.x) * _textureScaledSize.x) / _textureScaledSize.x);
float3 _dotMaskWeights = lerp(float3(1.05, 0.75, 1.05), float3(0.75, 1.05, 0.75), floor(mod(_mod_factor, 2.0)));
float3 _mul_res = ((_col * _weights) + (_col2 * _weights2)).xyz;
(_mul_res *= _dotMaskWeights);
if((_border == true))
{
{
(_mul_res = (pow(abs(_mul_res), vec3((1.0 / ((2.0 * _inputGamma) - _outputGamma)))) * vec3(_cval)));
}
;
}
else
{
{
(_mul_res = pow(abs(_mul_res), vec3((1.0 / ((2.0 * _inputGamma) - _outputGamma)))));
}
;
}
;
(gl_Color[0] = vec4(_mul_res, 1.0));
}
}
;
struct PS_INPUT
{
    float2 v0 : TEXCOORD0;
};

struct PS_OUTPUT
{
    float4 gl_Color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT input)
{
    _v_vTexcoord = input.v0.xy;

    gl_main();

    PS_OUTPUT output;
    output.gl_Color0 = gl_Color[0];

    return output;
}
