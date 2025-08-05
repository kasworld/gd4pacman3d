extends Node3D
class_name Stage

var field :PlacedThings
func init() -> Stage:
	field = PlacedThings.new(Settings.FieldSize)
	place_things()
	return self
	
func place_things() -> void:
	place_scene(ScriptDraw2D.exec(Settings.BounderyWalls), preload("res://wall.tscn"), Color.GRAY)
	for y in range(0, Settings.FieldHeight-2, 2):
		var wall_draw = [
			["hline", 2, Settings.FieldWidth-3, y],
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

	pt = preload("res://pacman.tscn").instantiate().set_color(Color.YELLOW)
	pt.position = Settings.vector2i_to_vector3(rand_pos2i())
	add_child(pt)
	
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
