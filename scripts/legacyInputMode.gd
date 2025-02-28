extends CheckButton

@export var nonLegacy:Array[Control]
@export var legacy: Array[Control]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var toggled_on = self.toggle_mode
	
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


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func Toggle(toggled_on: bool) -> void:
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
