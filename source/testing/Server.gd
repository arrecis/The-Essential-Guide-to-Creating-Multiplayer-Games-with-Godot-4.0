extends Node

const PORT :int = 9999
var peer = ENetMultiplayerPeer.new()

func _ready() -> void:
	peer.create_server(PORT)
	multiplayer.multiplayer_peer = peer
	print("Server ready...")
	multiplayer.peer_connected.connect(_on_peer_connected)

func _on_peer_connected(peer_id) -> void:
	print("peer_id: ", peer_id)

@rpc("any_peer", "call_remote")
func test_server(number) -> void:
	print("RPC in server: ", number)
	
@rpc("call_remote")
func test_client(number) -> void:
	pass


func _on_button_pressed() -> void:
	rpc("test_client", 0)
