// self-written docs (may not be accurate)

// fragCoord: coordinates in pixels
// iResolution: window dimensions
// iTime: iTime
// iMouse: mouse
// fragColor: output color

float traj(vec2 z, vec2 c) {
    for (int i = 0; i < 256; i++) {
        z = vec2(pow(z.x, 2.) - pow(z.y, 2.), z.x * z.y * 2.);
        z += c;
        if (min(abs(z.x), abs(z.y)) >= 4.) {
            return float(i) / 256.;
        }
    }
    return -1.;
}

void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    vec2 uv = fragCoord / iResolution.xy;
    vec2 mouse = iMouse / iResolution.xy;

    vec2 zstart = mouse * 2. - 1.;
}
