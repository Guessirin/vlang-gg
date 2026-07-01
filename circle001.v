module main

import gg

struct App {
mut:
    ctx &gg.Context = unsafe { nil }
}

fn frame(mut ctx gg.Context) {
    ctx.begin()
    // ctx.draw_circle_filled(x, y, radius, color)
    ctx.draw_circle_filled(400, 300, 150, gg.Color{r: 255, g: 0, b: 0, a: 255})
    ctx.end()
}

fn main() {
    mut app := &App{}
    app.ctx = gg.new_context(
        bg_color: gg.black
        width: 800
        height: 600
        window_title: 'Sphere (Circle)'
        frame_fn: frame
    )
    app.ctx.run()
}
