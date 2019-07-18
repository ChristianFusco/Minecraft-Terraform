resource "aws_security_group" "minecraft-instances-sg" {
  name        = "minecraft-instances-sg"
  description = "Allow traffic from the load balancer"

  #todo healthchecks?
  ingress {
    from_port   = 25565
    to_port     = 25565
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_autoscaling_group" "minecraft-asg" {
  lifecycle {
    create_before_destroy = true
  }

  name                      = "minecraft-asg"
  max_size                  = "1"
  min_size                  = "1"
  desired_capacity          = "1"
  health_check_type         = "EC2"
  force_delete              = false
  launch_configuration      = "${aws_launch_configuration.minecraft-launch-config.name}"
  wait_for_capacity_timeout = "0"
  availability_zones        = ["us-east-1a"]
  //target_group_arns         = ["${aws_lb_target_group.minecraft-tg.arn}"]
}

resource "aws_launch_configuration" "minecraft-launch-config" {
  image_id                    = "${var.ami}"
  instance_type               = "${var.instance_type}"
  iam_instance_profile        = "${aws_iam_instance_profile.minecraft-ec2-profile.name}"
  name_prefix                 = "minecraft-launch-config"
  associate_public_ip_address = false
  security_groups             = ["${aws_security_group.minecraft-instances-sg.id}"]


  user_data = "${file("${path.module}/userdata.sh")}"
}

