extends Panel

var accum = 0
#var commons = get_tree().get_nodes_in_group("Commons")

func _process(delta):
	accum += delta
	get_node("Counter").text = str(accum) # 'text' is a built-in label property.

func _ready():
	get_node("Button").connect("button_down", self, "_on_Button_button_down")
	get_node("Button").connect("button_up", self, "_on_Button_button_up")

func _on_Button_button_down():
#	get_node("Label").text = str(commons)
	get_node("Label").text = "Hello!"

func _on_Button_button_up():
	get_node("Label").text = ""
