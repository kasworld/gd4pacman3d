extends Node3D
class_name Stage

var field :PlacedThings
func init() -> Stage:
	field = PlacedThings.new(Settings.FieldSize)
	place_things()
	return self
	
func place_things() -> void:
	place_scene(ScriptDraw2D.exec(Settings.BounderyWalls), preload("res://wall.tscn"), Color.GRAY)
	place_scene(ScriptDraw2D.exec(Settings.StageWalls[2]), preload("res://wall.tscn"), Color.GRAY)
	var dot_draw = 	[
		["fill", 1, Settings.FieldWidth-2, 1, Settings.FieldHeight-2],
	]
	place_scene(ScriptDraw2D.exec(dot_draw), preload("res://dot.tscn"), Color.GOLDENROD)

	var pt 
	pt = preload("res://pacman.tscn").instantiate().set_color(Color.YELLOW)
	pt.position = rand_pos()
	add_child(pt)
	
	for co in [Color.PINK, Color.BLUE, Color.RED, Color.GREEN]:
		pt = preload("res://ghost.tscn").instantiate().set_color(co)
		pt.position = rand_pos()
		add_child(pt)
	for i in 4:
		pt = preload("res://power_pellet.tscn").instantiate().set_color(Color.GOLD)
		pt.position = rand_pos()
		add_child(pt)
	pt = preload("res://bonus_fruit.tscn").instantiate().set_color(Color.RED)
	pt.position = rand_pos()
	add_child(pt)

func rand_pos() -> Vector3:
	return Vector3(
		randi_range(1, Settings.FieldWidth-2),
		randi_range(1, Settings.FieldHeight-2),
		0.5
	)

func place_scene(wall_list :Array, scene :Resource, co :Color) -> void:
	#var co = Settings.LightColorList.pick_random()[0]
	for pos in wall_list:
		var pt = scene.instantiate().set_color(co)
		field.set_at(pos, pt)
		var pos3d = Settings.vector2i_to_vector3(pos)
		pt.position = pos3d
		add_child(pt)
