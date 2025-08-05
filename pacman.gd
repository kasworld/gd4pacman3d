extends RigidBody3D
class_name Pacman

func set_color(co :Color) -> Pacman:
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

func _on_body_entered(body: Node) -> void:
	if body is Dot:
		body.queue_free()
	elif body is PowerPellet:
		body.queue_free()
	elif body is BonusFruit:
		body.queue_free()
