resource "aws_instance" "chris-app" {
	ami 			= "${local.instance_ami_debian}"  
	instance_type 	= "${local.instance_type}"  
  key_name = "${aws_key_pair.chris_ssh.key_name}"
 # vpc_security_group_ids = [ aws_security_group.allow_app.id ]
  #user_data = "${file("userdata.yaml")}"
  #user_data = "${file("install_apache.sh")}"

  tags = {
        Name = "chris-app"
    }
}
