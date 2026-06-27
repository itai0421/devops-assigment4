###############################################
# Jenkins EC2 Instance
###############################################

resource "aws_instance" "jenkins" {
  ami           = "ami-0c02fb55956c7d316"   # Ubuntu 20.04
  instance_type = var.instance_type
  key_name      = var.key_name

  # חיבור ה‑IAM Instance Profile לשרת Jenkins
  iam_instance_profile = aws_iam_instance_profile.jenkins_profile.name

  security_groups = [
    aws_security_group.jenkins_sg.id
  ]

  tags = {
    Name = "Jenkins-Server"
  }
}
