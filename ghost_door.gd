extends Node3D
class_name GhostDoor

func set_color(co :Color) -> GhostDoor:
	$MeshInstance3D.mesh.material.albedo_color = Color(co, 0.5)
	return self
