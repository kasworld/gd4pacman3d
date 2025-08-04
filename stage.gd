extends Node3D
class_name Stage

var wall_list :Array
var field :PlacedThings
func init() -> Stage:
	field = PlacedThings.new(Settings.FieldSize)
	place_things()
	return self
	
func place_things() -> void:
	exec_script(Settings.BounderyWalls)
	field2wall()

	var pt 
	pt = preload("res://pacman.tscn").instantiate()
	pt.position = Vector3(1,4,0.5)
	add_child(pt)
	pt = preload("res://ghost.tscn").instantiate()
	pt.position = Vector3(2,5,0.5)
	add_child(pt)
	pt = preload("res://power_pellet.tscn").instantiate()
	pt.position = Vector3(5,7,0.5)
	add_child(pt)
	pt = preload("res://dot.tscn").instantiate()
	pt.position = Vector3(12,15,0.5)
	add_child(pt)
	pt = preload("res://bonus_fruit.tscn").instantiate()
	pt.position = Vector3(20,5,0.5)
	add_child(pt)

func field2wall() -> void:
	for l in wall_list:
		var co = Settings.LightColorList.pick_random()[0]
		for pos in l:
			var pt = preload("res://wall.tscn").instantiate().set_color(co)
			field.set_at(pos, pt)
			var pos3d = Settings.vector2i_to_vector3(pos)
			pt.position = pos3d
			add_child(pt)

func set_at(pos :Vector2i):
	wall_list.append([pos])
# include x2
func draw_hline(x1 :int, x2 :int, y :int):
	if x1 > x2 :
		var t = x1
		x1 = x2
		x2 = t
	var rtn := []
	for x in range(x1,x2+1):
		rtn.append( Vector2i(x,y) )
	wall_list.append(rtn)

# include y2
func draw_vline(x :int, y1 :int, y2 :int):
	if y1 > y2 :
		var t = y1
		y1 = y2
		y2 = t
	var rtn := []
	for y in range(y1,y2+1):
		rtn.append( Vector2i(x,y) )
	wall_list.append(rtn)

func exec_script(sc :Array):
	for l in sc:
		exec_script_line(l)

func exec_script_line(l:Array):
	match l[0]:
		"set" :
			set_at(Vector2i(l[1],l[2]))
		"hline":
			draw_hline(l[1],l[2],l[3])
		"vline":
			draw_vline(l[1],l[2],l[3])
		_:
			assert(false, "invalid script line %s" %[l])
