resource "aws_launch_template" "mylaunchtemp" {
  name_prefix   = "mylaunchtemp"
  
  block_device_mappings {
    device_name = "/dev/sdf"

    ebs {
      volume_size = 20
    }
  }

  image_id      = data.aws_ssm_parameter.instance_ami.value
  instance_type = "t2.micro"
  key_name = "mykeypair"
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]

  # Optional: You can define additional settings like security groups, if required
  # network_interfaces {
  #   associate_public_ip_address = true
  #   delete_on_termination        = true
  #   security_groups              = [aws_security_group.instance_sg.id]  # Replace with your security group ID
  # }

  # Optional: Tag for EC2 instance created by this template
  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "test"
    }
  }

  #user_data = filebase64("userdata.sh")
}