import gg

struct App {
mut:
	gg &gg.Context = unsafe { nil }
}

fn main() {
	mut app := &App{}
	
	app.gg = gg.new_context(
		width: 600
		height: 400
		window_title: 'Vlang gg Color Triangle'
		bg_color: gg.Color{r: 20, g: 20, b: 30} // Dark background
		frame_fn: frame
		user_data: app
	)
	
	app.gg.run()
}

fn frame(mut app App) {
	// Begin drawing actions
	app.gg.begin()
	
	// Define the color (Red, Green, Blue)
	triangle_color := gg.Color{r: 255, g: 100, b: 100}
	
	// Draw a filled triangle using coordinates: (x1, y1), (x2, y2), (x3, y3)
	app.gg.draw_triangle_filled(
		300, 100,  // Top vertex
		150, 300,  // Bottom left vertex
		450, 300,  // Bottom right vertex
		triangle_color
	)
	
	// Flush commands to GPU
	app.gg.end()
}
