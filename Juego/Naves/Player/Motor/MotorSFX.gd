#Motor.gd
class_name Motor
extends AudioStreamPlayer2D

export var tiempo_transicion:float = 0.6
export var volumen_apagado:float = -30.0

onready var tween_sonido:Tween = $Tween

var volumen_original:float
var volumen_db:float = -3

func _ready() -> void:
	volumen_original = volumen_db
	volumen_db = volumen_apagado
	
func sonido_on() -> void:
	if not playing:
		play()

func sonido_off() -> void:
	efecto_transicion(volumen_db, volumen_original)

func efecto_transicion(desde_vol: float, hasta_vol: float) -> void:
	tween_sonido.interpolate_property(
		self,
		"volumen_db",
		desde_vol,
		hasta_vol,
		tiempo_transicion,
		Tween.TRANS_LINEAR,
		Tween.EASE_OUT_IN
	)
	tween_sonido.start()	
