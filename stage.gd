extends Node3D
class_name Stage

var field :PlacedThings
var pacman :Pacman
func init() -> Stage:
	field = PlacedThings.new(Settings.FieldSize)
	place_things()
	return self
	
func place_things() -> void:
	place_scene(ScriptDraw2D.exec(Settings.BounderyWalls), preload("res://wall.tscn"), Color.GRAY)
	for y in range(0, Settings.FieldHeight-1, 2):
		var wall_draw = [
			["hline", 2, Settings.FieldWidth/2-1, y],
			["hline", Settings.FieldWidth/2+1, Settings.FieldWidth-3, y+1],
		]
		place_scene(ScriptDraw2D.exec(wall_draw), preload("res://wall.tscn"), Color.GRAY)

	var pt 
	for i in 4:
		var pos2i = rand_pos2i()
		while field.get_at(pos2i) != null:
			pos2i = rand_pos2i()
		pt = preload("res://power_pellet.tscn").instantiate().set_color(Color.GOLD)
		field.set_at(pos2i, pt)
		pt.position = Settings.vector2i_to_vector3(pos2i)
		add_child(pt)

	var pos2i = rand_pos2i()
	while field.get_at(pos2i) != null:
		pos2i = rand_pos2i()
	pt = preload("res://bonus_fruit.tscn").instantiate().set_color(Color.RED)
	field.set_at(pos2i, pt)
	pt.position = Settings.vector2i_to_vector3(pos2i)
	add_child(pt)

	var dot_draw = 	[
		["fill", 1, Settings.FieldWidth-2, 1, Settings.FieldHeight-2],
	]
	place_scene(ScriptDraw2D.exec(dot_draw), preload("res://dot.tscn"), Color.GOLDENROD)

	pacman = preload("res://pacman.tscn").instantiate().set_color(Color.YELLOW)
	pacman.position = Settings.vector2i_to_vector3(rand_pos2i())
	add_child(pacman)
	
	for co in [Color.PINK, Color.BLUE, Color.RED, Color.GREEN]:
		pt = preload("res://ghost.tscn").instantiate().set_color(co)
		pt.position = Settings.vector2i_to_vector3(rand_pos2i())
		add_child(pt)

func rand_pos2i() -> Vector2i:
	return Vector2i(
		randi_range(1, Settings.FieldWidth-2),
		randi_range(1, Settings.FieldHeight-2),
	)

func place_scene(pos2i_list :Array, scene :Resource, co :Color) -> void:
	for pos2i in pos2i_list:
		if field.get_at(pos2i) != null:
			continue
		var pt = scene.instantiate().set_color(co)
		field.set_at(pos2i, pt)
		var pos3d = Settings.vector2i_to_vector3(pos2i)
		pt.position = pos3d
		add_child(pt)

var key2fn = {
	KEY_UP:_on_button_up_pressed,
	KEY_DOWN:_on_button_down_pressed,
	KEY_LEFT:_on_button_left_pressed,
	KEY_RIGHT:_on_button_right_pressed,
}
func _on_button_up_pressed() -> void:
	pacman.set_linear_velocity(Vector3(0,1,0)*10)
func _on_button_down_pressed() -> void:
	pacman.set_linear_velocity(Vector3(0,-1,0)*10)
func _on_button_left_pressed() -> void:
	pacman.set_linear_velocity(Vector3(-1,0,0)*10)
func _on_button_right_pressed() -> void:
	pacman.set_linear_velocity(Vector3(1,0,0)*10)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.pressed:
			var fn = key2fn.get(event.keycode)
			if fn != null:
				fn.call()
		elif event.is_released():
			var fn = key2fn.get(event.keycode)
			if fn != null:
				pacman.set_linear_velocity(Vector3(0,0,0))
	elif event is InputEventMouseButton and event.is_pressed():
		pass
