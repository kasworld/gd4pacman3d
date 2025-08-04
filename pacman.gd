extends Node3D
class_name Pacman

func set_color(co :Color) -> Pacman:
	$MeshInstance3D.mesh.material.albedo_color = co
	return self
