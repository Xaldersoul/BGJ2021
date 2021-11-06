extends Sprite

func _on_Area2D_input_event(viewport, event, shape_idx):
	var rabas = load("res://componentes/food.tscn").instance()
	if Input.is_action_just_pressed("click"):
		rabas.init("recipiente")
		add_child(rabas)
	yield(get_tree().create_timer(3), "timeout")
