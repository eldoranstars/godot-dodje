extends Panel

func _ready():
	get_node("Button").connect("button_down", self, "_on_Button_button_down")
	get_node("Button").connect("button_up", self, "_on_Button_button_up")
	$Timer.connect("timeout", self, "_on_Timer_timeout")

func _on_Button_button_down():
	get_node("Label").text = "Hello!"

func _on_Button_button_up():
	get_node("Label").text = ""


func _on_Timer_timeout():
	$Sprite.visible = !$Sprite.visible
