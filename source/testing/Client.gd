extends Node

const IPSERVER:String = "127.0.0.1"
const PORT:int = 9999

var peer = ENetMultiplayerPeer.new()


func _ready() -> void:
	peer.create_client(IPSERVER, PORT)
	multiplayer.multiplayer_peer = peer
	multiplayer.connected_to_server.connect(_on_connected_to_server)
	print("Client ready...")

func _on_connected_to_server() -> void:
	print("Client connected")


@rpc
func test_server(number) -> void:
	pass

@rpc
func test_client(number) -> void:
	print("RPC in client: ", number)

func _on_button_pressed() -> void:
	rpc_id(get_multiplayer_authority(),"test_server", 1)
