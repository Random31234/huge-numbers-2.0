extends CheckButton

@export var nonLegacy:Array[Control]
@export var legacy: Array[Control]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	Toggle(self.button_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	await(self.toggled)
	Toggle(self.button_pressed)


func Toggle(toggled_o: bool) -> void:
	print(toggled_o)
	var toggled_on
	toggled_on = self.button_pressed
	if toggled_on == false:
		for n in nonLegacy:
			n.process_mode =Node.PROCESS_MODE_INHERIT
			n.visible = true
		for n in legacy:
			n.process_mode = Node.PROCESS_MODE_DISABLED
			n.visible = false
	if toggled_on == true:
		for n in nonLegacy:
			n.process_mode = Node.PROCESS_MODE_DISABLED
			n.visible = false
		for n in legacy:
			n.process_mode = Node.PROCESS_MODE_INHERIT
			n.visible = true
