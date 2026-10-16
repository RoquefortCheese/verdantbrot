// self-written docs (may not be accurate)

// fragCoord: coordinates in pixels
// iResolution: window dimensions
// iTime: iTime
// iMouse: mouse
// fragColor: output color

float traj(vec2 z, vec2 c) {
    float maxratio = 0.;
    for (int i = 0; i < 256; i++) {
        vec2 zprev = z;
        z = vec2(pow(z.x, 2.) - pow(z.y, 2.), z.x * z.y * 2.);
        z += c;
        float ratio = (z.x / zprev.x) * (z.y / zprev.y);
        maxratio = max(maxratio, ratio);
        if (min(abs(z.x), abs(z.y)) >= 4.) {
            return 1. / maxratio;
        }
    }
    return -1. / maxratio;
}

void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    vec2 uv = fragCoord / iResolution.xy;
    vec2 mouse = iMouse.xy / iResolution.xy;

    vec2 z = mouse * 2. - 1.;
    vec2 c = uv * 4. - vec2(3., 2.);

    float trajectory = traj(z, c);
    vec3 color = vec3(0) + (vec3(0, 1, 0) - vec3(0)) * pow(-trajectory, 0.25);
    if (trajectory >= 0.) {
        color = vec3(1) + (vec3(0, 1, 0) - vec3(1)) * pow(trajectory, 0.25);
    }

    fragColor.rgb = color;
}
