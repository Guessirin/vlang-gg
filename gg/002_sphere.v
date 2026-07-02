import gg
import math

struct App {
mut:
    ctx &gg.Context = unsafe { nil }
}

fn frame(mut ctx gg.Context) {
    ctx.begin()
    
    // Draw a sphere with a pseudo-3D gradient
    draw_spherical_gradient(mut ctx, 400, 300, 150, gg.Color{255, 0, 0, 255})
    
    ctx.end()
}

fn draw_spherical_gradient(mut ctx gg.Context, cx int, cy int, radius int, base_color gg.Color) {
    // Loop through a bounding box of the circle
    for y in -radius .. radius {
        for x in -radius .. radius {
            // Calculate squared distance from the center
            distance_sq := (x*x) + (y*y)
            if distance_sq <= radius * radius {
                distancef := math.sqrt(f32(distance_sq))
                
                // Light intensity fades the further we get from the sphere's apex
                intensity := 1.0 - (distancef / radius)
                
                // Interpolate colors based on distance to simulate a shiny sphere
                r := u8(f32(base_color.r) * intensity)
                g := u8(f32(base_color.g) * intensity)
                b := u8(f32(base_color.b) * intensity)
                
                // Draw single pixel
                ctx.draw_pixel(cx + x, cy + y, gg.Color{r, g, b, 255})
            }
        }
    }
}

fn main() {
    mut app := &App{}
    app.ctx = gg.new_context(
        bg_color: gg.Color{20, 20, 20, 255}
        width: 800
        height: 600
        window_title: 'Colored Sphere'
        frame_fn: frame
    )
    app.ctx.run()
}
