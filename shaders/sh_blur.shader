varying vec2 v_vTexcoord;
varying vec4 v_vColour;


uniform vec2 size;//set this to the width and height of the thing being drawn.
uniform float radius;// radius of blur in pixels
const int num = 64;//quality
const float val = 6.28/float(num);
void main()
{
    gl_FragColor = texture2D( gm_BaseTexture,v_vTexcoord) * v_vColour;
    vec2 S = (radius/size.xy)*vec2(1.,size.x/size.y);
    vec4 tex;
    for(int i = 0; i<num;i++)
    {
        tex += texture2D( gm_BaseTexture,v_vTexcoord+vec2(cos(float(i)*val),
        (sin(float(i)*val)))*S)/4.0;
        tex += texture2D( gm_BaseTexture,v_vTexcoord+vec2(cos(float(i)*val),
        (sin(float(i)*val)))*S*0.8)/4.0;
        tex += texture2D( gm_BaseTexture,v_vTexcoord+vec2(cos(float(i)*val),
        (sin(float(i)*val)))*S*0.6)/4.0;
        tex += texture2D( gm_BaseTexture,v_vTexcoord+vec2(cos(float(i)*val),
        (sin(float(i)*val)))*S*0.4)/4.0;
        
    }
    gl_FragColor += tex/(float(num)*2.0);
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
}

