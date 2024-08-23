extends AnimationPlayer

@onready var fish_1_timer = $"Fish1/Fish1 Timer"
@onready var angler_timer = $"Sea angler/Angler Timer"

@onready var fish_1 = $Fish1
@onready var sea_angler = $"Sea angler"

func _ready():
	fish_1_timer.start()
	angler_timer.start()



func _on_fish_1_timer_timeout():
	fish_1.play("Move")


func _on_angler_timer_timeout():
	sea_angler.play("Move")
