extends Position2D

var bussy = false

func _draw():
	draw_circle(Vector2.ZERO, 55, Color.blanchedalmond)
func select():
	bussy = true
	modulate = Color.webmaroon

func deselect():
	bussy = false
	modulate = Color.white

func getBussy():
	return bussy
