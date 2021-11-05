extends Node2D

export var cliente_scene : PackedScene
export var max_client : int = 5
var cant_client = 0
var client_position = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	var client = cliente_scene.instance()
	$YSort.add_child(client)
	client.position.y = -20 + client_position
	client_position = client.position.y 
	cant_client+=1
	if cant_client == max_client : 
		$Timer.stop()
	print("nuevo cliente")
