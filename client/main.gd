extends Node2D

@onready var label := $Label
@onready var test_sprite := $TestSprite

# Simple TCP client using StreamPeerTCP
var stream := StreamPeerTCP.new()
const SERVER_ADDRESS := "localhost"
const SERVER_PORT := 27015
const BUFFER_SIZE := 512

func _ready() -> void:
    label.text = "Connecting to server..."
    print("Godot client: Connecting to server...")
    _connect_to_server()

func _connect_to_server() -> void:
    var err = stream.connect_to_host(SERVER_ADDRESS, SERVER_PORT)
    if err != OK:
        label.text = "Connection failed: %s" % err
        print("Godot client: Connection failed: %s" % err)
        return
    label.text = "Connected! Sending test message..."
    print("Godot client: Connected! Sending test message...")
    # Send a test message as raw bytes
    var message = "Hello from Godot client!"
    var msg_bytes = message.to_utf8()
    stream.put_data(msg_bytes)
    # Wait for response (we'll do it in _process for simplicity)
    set_process(true)

func _process(delta) -> void:
    if stream.get_status() != StreamPeerTCP.STATUS_CONNECTED:
        label.text = "Disconnected"
        print("Godot client: Disconnected")
        set_process(false)
        return
    
    if stream.get_available_bytes() > 0:
        var response_bytes = stream.get_data(BUFFER_SIZE)
        var response = response_bytes.get_string_from_utf8()
        label.text = "Received: %s" % response
        print("Godot client: Received: %s" % response)
        set_process(false)
        # Optionally, change sprite color to indicate success
        test_sprite.color = Color(0.2, 0.8, 0.2)
