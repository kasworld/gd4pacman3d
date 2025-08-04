extends Node3D
class_name GhostEye

func set_color(co :Color) -> GhostEye:
	$MeshInstance3D.mesh.material.albedo_color = Color(co, 0.5)
	return self
