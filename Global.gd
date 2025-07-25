extends Node

var hasTeleported = null

var portals = {
	"bluePortal": null,
	"orangePortal": null,
}

var _health: int = 100
signal health_changed

func set_health(value: int) -> void:
	_health = value
	emit_signal("health_changed")

var health: int:
	get: return _health
	set(value): set_health(value)
