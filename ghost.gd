extends RigidBody3D
class_name Ghost

func set_color(co :Color) -> Ghost:
	$MeshInstance3D.mesh.material.albedo_color = co
	return self

func _physics_process(delta: float) -> void:
	if randi_range(0,10) == 0:
		var fc :Vector3
		if randi_range(0,1) == 0:
			fc = Vector3(randfn(0,1),0,0)
		else:
			fc = Vector3(0,randfn(0,1),0)
		apply_central_impulse(fc)
