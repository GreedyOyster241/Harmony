extends Control

var username = "" 
var password

var created = false


func _on_Login_button_down():
	if !created:
		if !$Username.text or $Username.text == "" or !$Password.text or $Password.text == "":
			print("Empty Username and/or password!")
			show_login_fail_message("Empty Username and/or password!")
		else:
			username = $Username.text
			password = $Password.text.sha256_text()
			created = true
			$Login.text = "Login"
			$Username.text = ""
			$Password.text = ""
			show_login_fail_message("Account Created!")
			print("Account Created!")
	else:
		if $Username.text == username:
			if $Password.text.sha256_text() == password:
				print("Login Successful!")
				get_tree().change_scene("res://src/scenes/Main.tscn")
			else:
				print("Login Fail D:")
				show_login_fail_message("Incorrect Username and/or Password.")
		else:
				print("Login Fail D:") 
				show_login_fail_message("Incorrect Username and/or Password.")
				

func show_login_fail_message(message):
	$LoginFail.text = message
	$LoginFail.visible = true
	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = 2.0
	timer.one_shot = true
	timer.connect("timeout", self, "_on_Timer_timeout")
	timer.start()

func _on_Timer_timeout():
	$LoginFail.visible = false
	



