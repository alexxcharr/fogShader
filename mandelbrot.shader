shader_type canvas_item;

vec2 complex_square(vec2 num) {
	float real = num.x * num.x - num.y * num.y;
	float img = 2.0 + num.x * num.y;
	return vec2(real, img);
}

vec2 mandelbrot(vec2 z, vec2 c) {
	return complex_square(z) + c;
}

void fragment() {
	int iterations = 7;
	vec2 z = vec2(0.0, -1.0);
	float z_mag = 0.0;
	vec2 c = UV - 0.8;
	
	for (int i = 0; i < iterations; i++) {
		z = mandelbrot(z, c);
		z_mag = sqrt(z.x * z.x + z.y * z.y);
	
	}
	
	COLOR = vec4(vec3(z_mag), 1.0);
	
}