precision highp float;

uniform sampler2D Texture;
varying vec2 TextureCoordsVarying;
uniform float Time;

const float PI = 3.1415926;

float rand(float n) {
    return fract(sin(n) * 92473.2864537);
}

void main ()
{
    float maxShake = 0.06;
    float duration = 0.3;
    float colorRedOffset = 0.01;
    float colorBlueOffset = -0.025;
    
    float time = mod(Time, duration * 2.0);
    
    float amplitude = max(sin(time * (PI / duration)), 0.0);
    
    float jitter = rand(TextureCoordsVarying.y) * 2.0 - 1.0;
    
    bool needOffset = abs(jitter) < maxShake * amplitude;
    
    float TextureX = TextureCoordsVarying.x + (needOffset ? jitter : (jitter * amplitude * 0.006));
    
    vec2 textureCoords = vec2(TextureX, TextureCoordsVarying.y);
    
    vec4 mask = texture2D(Texture, textureCoords);
    
    vec4 maskR = texture2D(Texture, textureCoords + vec2(colorRedOffset * amplitude, 0.0));
    
    vec4 maskB = texture2D(Texture, textureCoords + vec2(colorBlueOffset * amplitude, 0.0));
    
    gl_FragColor = vec4(maskR.r, mask.g, maskB.b, mask.a);
}
