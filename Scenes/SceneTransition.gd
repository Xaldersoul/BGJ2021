extends ColorRect

# Marca el Path a la siguiente escena
export(String, FILE, "*.tscn") var next_scene_path

#Referencia al nodo animacion
onready var _anim_player := $AnimationPlayer

# Se ejecuta cuando el nodo es llamado por primera vez
func _ready() -> void:
	# Ejecuta el fade de reversa.
	_anim_player.play_backwards("Fade")

#Transiciona a la escena que recibio despues del fade
func transition_to(_next_scene := next_scene_path) -> void:
	#Ejecuta el fade y espera hasta que termine
	_anim_player.play("Fade")
	yield(_anim_player,"animation_finished")
	#cambia la escena
	get_tree().change_scene(_next_scene)
	
