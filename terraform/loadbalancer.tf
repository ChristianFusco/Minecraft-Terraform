data "aws_vpcs" "default-vpc" {
  filter {
    name   = "isDefault"
    values = [true]
  }
}

data "aws_subnet_ids" "default-subnets" {
  vpc_id = "${element(tolist(data.aws_vpcs.default-vpc.ids), 0)}"
}

resource "aws_security_group" "minecraft-lb-sg" {
  name        = "minecraft-lb-sg"
  description = "Allow traffic from the open internet"

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

resource "aws_lb" "minecraft-lb" {
  name               = "minecraft-lb"
  load_balancer_type = "network"
  subnets            = "${tolist(data.aws_subnet_ids.default-subnets.ids)}"
}

resource "aws_lb_target_group" "minecraft-tg" {
  name     = "minecraft-lb-tg"
  port     = 25565
  protocol = "TCP"
  vpc_id   = "${element(tolist(data.aws_vpcs.default-vpc.ids), 0)}"

}

resource "aws_lb_listener" "minecraft-lb-listener-tcp" {
  load_balancer_arn = "${aws_lb.minecraft-lb.arn}"
  port              = 25565
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.minecraft-tg.arn}"
  }
}
