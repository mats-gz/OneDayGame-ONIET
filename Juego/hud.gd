extends CanvasLayer

@export var seconds=0
@export var minutes=0
var Dseconds=40
var Dminutes=0

@onready var timer = $Timer
@onready var label = $Label

func _ready():
	timer.wait_time = 1.0
	timer.start()

func Reset_Timer():
	seconds=Dseconds
	minutes=Dminutes
	label.text=str(minutes)+":"+str(seconds).pad_zeros(2)

func _on_timer_timeout() -> void:
	print("tick")
	
	if seconds == 0 && minutes == 0:
		Reset_Timer()
			
	if seconds == 0:
		if minutes>0:
			minutes-=1
			seconds=59
		else:
			timer.stop()
			get_tree().change_scene_to_file("res://Arhex/Menu Principal/menu_principal.tscn")
			return
	else:
		seconds -= 1
	
	label.text=str(minutes)+":"+str(seconds).pad_zeros(2)
