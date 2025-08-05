extends StaticBody3D
class_name Wall

func set_color(co :Color) -> Wall:
	$MeshInstance3D.mesh.material.albedo_color = co
	return self
