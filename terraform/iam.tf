resource "aws_iam_instance_profile" "minecraft-ec2-profile" {
  name = "minecraft-ec2-profile"
  role = "${aws_iam_role.minecraft-ec2-role.name}"
}

resource "aws_iam_role" "minecraft-ec2-role" {
  name = "minecraft-ec2-role"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "",
            "Effect": "Allow",
            "Principal": {
                "Service": "ec2.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy" "minecraft-ec2-policy" {
  name = "minecraft-ec2-policy"
  role = "${aws_iam_role.minecraft-ec2-role.name}"
  policy = "${data.aws_iam_policy_document.minecraft-ec2-policy-document.json}"
}

data "aws_iam_policy_document" "minecraft-ec2-policy-document" {
  statement {
    sid = "allowS3"
    actions = [
      "s3:*"
    ]
    resources = [
      "arn:aws:s3:::*"
    ]
  }
}
