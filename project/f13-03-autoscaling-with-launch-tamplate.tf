
# Launch Template Resource

resource "aws_launch_template" "my_launch_tamplate" {
  name = "${local.name}-launch-template" # Increment the name to indicate a new version

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size           = 10
      delete_on_termination = true
      volume_type           = "gp2"
    }
  }

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "myasgx"
    }
  }

  image_id               = data.aws_ami.amazon_linux2.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [module.public_group.security_group_id]
  user_data              = filebase64("${path.module}/app1-install.sh")
  ebs_optimized          = true
  monitoring {
    enabled = true
  }
  update_default_version = true
}