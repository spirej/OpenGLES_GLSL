precision highp float;
uniform sampler2D Texture;
varying vec2 TextureCoordsVarying;

const vec2 TextSize = vec2(400.0, 400.0);
const vec2 mosaicSize = vec2(16.0, 16.0);

void main()
{
    vec2 intXY = vec2(TextureCoordsVarying.x * TextSize.x, TextureCoordsVarying.y * TextSize.y);
    vec2 XYMosaic = vec2(floor(intXY.x/mosaicSize.x)*mosaicSize.x, floor(intXY.y/mosaicSize.y)*mosaicSize.y) + 0.5*mosaicSize;
    vec2 delXY = XYMosaic - intXY;
    float delL = length(delXY);
    vec2 UVMosaic = vec2(XYMosaic.x/TextSize.x, XYMosaic.y/TextSize.y);
    
    vec4 _finialColor;
    if(delL < 0.5*mosaicSize.x) {
        _finialColor = texture2D(Texture, UVMosaic);
    }else {
        _finialColor = texture2D(Texture, TextureCoordsVarying);
    }
    
    gl_FragColor = _finialColor;
}
