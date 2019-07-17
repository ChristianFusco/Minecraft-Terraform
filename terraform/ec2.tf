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
}

resource "aws_launch_configuration" "minecraft-launch-config" {
  image_id             = "${var.ami}"
  instance_type        = "${var.instance_type}"
  iam_instance_profile = "${aws_iam_role.minecraft-ec2-role.name}"

  name_prefix                 = "minecraft-launch-config"
  associate_public_ip_address = true
}
