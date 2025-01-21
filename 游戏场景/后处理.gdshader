shader_type canvas_item;
render_mode unshaded;

//用于CanvasGroup的后期处理，包括色相饱和度对比度的调整
uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;

// 主贴图明度(亮度)
uniform float MainTexBrightness = 1.0;
// 主贴图对比度
uniform float MainTexContrast = 1.0;
// 主贴图饱和度
uniform float MainTexSaturation = 1.0;

vec3 lerp (vec3 a, vec3 b, float x)
{
    return a + x * (b - a);
}


void fragment() {
	vec4 c = textureLod(screen_texture, SCREEN_UV, 0.0);
	
    if (c.a > 0.0001) {
        c.rgb /= c.a;
    }

    COLOR *= c;
	
	vec4 output_color = COLOR;
	// 调整亮度
	output_color.rgb = output_color.rgb * MainTexBrightness;
	// 调整对比度
	vec3 avg_color = vec3(0.5,0.5,0.5);
	output_color.rgb = lerp(avg_color,output_color.rgb,MainTexContrast);
	// 调整饱和度
	float luminance = 0.2125 * output_color.r + 0.7154 * output_color.g + 0.0721 * output_color.b;
	vec3 luminance_color = vec3(luminance);
	output_color.rgb = lerp(luminance_color,output_color.rgb,MainTexSaturation);
	COLOR = output_color;

}