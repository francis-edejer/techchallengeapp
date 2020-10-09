resource "aws_iam_role" "default" {
  name               = "${var.project_name}_${var.region}"
  path               = "/"
  assume_role_policy = <<EOF
{
		    "Version": "2012-10-17",
		    "Statement": [
		        {
		            "Action": "sts:AssumeRole",
		            "Principal": {
		               "Service": "ecs-tasks.amazonaws.com"
		            },
		            "Effect": "Allow"
		        }
		    ]
}
EOF
}

resource "aws_iam_policy" "default" {
  name        = "${var.project_name}-policy_${var.region}"
  description = "${var.project_name} policy"
  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Placeholder",
      "Effect": "Deny",
      "Action": [
        ec2:DescribeTags
      ],
      "Resource": [ "*" ]
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "default" {
  role       = aws_iam_role.default.name
  policy_arn = aws_iam_policy.default.arn
}

resource "aws_iam_instance_profile" "default" {
  name = "${var.project_name}_${var.region}"
  role = aws_iam_role.default.name
}
