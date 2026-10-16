// self-written docs (may not be accurate)

// fragCoord: coordinates in pixels
// iResolution: window dimensions
// iTime: iTime
// iMouse: mouse
// fragColor: output color

float traj(vec2 z, vec2 c) {
    for (int i = 0; i < 256; i++) {
        z = vec2(pow(z.x, 2) - pow(z.y, 2), z.x * z.y * 2);
    }
}

void mainImage(in vec2 fragCoord, out vec4 fragColor)
{
    vec2 uv = fragCoord / iResolution.xy;

}
