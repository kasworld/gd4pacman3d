extends Node

const FieldWidth :int = 48
const FieldHeight :int = 27
const FieldSize := Vector2i(FieldWidth,FieldHeight)
const WorldSize := Vector3(FieldWidth,FieldHeight,1.0)

func vector2i_to_vector3(from :Vector2i) -> Vector3:
	return Vector3(from.x,from.y, 0.5)

var BounderyWalls = [
	["rect", 0, FieldWidth-1, 0, FieldHeight-1],
	#["hline", 0, FieldWidth-2, 0],
	#["vline", FieldWidth-1, 0, FieldHeight-2],
	#["hline", 1, FieldWidth-1, FieldHeight-1],
	#["vline", 0, 1, FieldHeight-1],
]
var StageWalls = [
	[],
	[
		["hline", FieldWidth/2-5, FieldWidth/2+5, FieldHeight/2],
	],
	[
		["hline", 5, FieldWidth/2-2, FieldHeight/2],
		["hline", FieldWidth/2+2, FieldWidth-1-5, FieldHeight/2],
		["vline", FieldWidth/2, 5, FieldHeight/2-2],
		["vline", FieldWidth/2, FieldHeight/2+2, FieldHeight-1-5],
	],
]

var LightColorList = NamedColorList.make_light_color_list()
