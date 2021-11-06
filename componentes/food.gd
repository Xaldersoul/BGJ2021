extends Node2D

var selected = true
var rest_point
var rest_reference
var rest_nodes = []
var bin_nodes = []
var placed_on : String

func _ready():
	rest_nodes = get_tree().get_nodes_in_group("zones")
	bin_nodes = get_tree().get_nodes_in_group("bin")
	rest_point = self.get_parent().global_position

func init(tag : String):
	placed_on = tag

func _on_Area2D_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		selected = true

func _physics_process(delta):
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)
	else:
		global_position = lerp(global_position, rest_point, 10 * delta)
		var distance = global_position.distance_to(rest_point)
		if placed_on == "recipiente" and distance < 0.1:
			self.queue_free()

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and not event.pressed:
			selected = false
			var shortest_dist = 55
			for child in bin_nodes: 
				var distance = global_position.distance_to(child.global_position)
				if distance < shortest_dist:
					if rest_reference:
						rest_reference.deselect()
					self.queue_free()
			for child in rest_nodes:
				var distance = global_position.distance_to(child.global_position)
				if distance < shortest_dist and child.getBussy() == false:
					placed_on = "freidora"
					child.select()
					rest_point = child.global_position
					rest_reference = child
					shortest_dist = distance
