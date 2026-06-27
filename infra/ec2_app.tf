# יצירת שרת האפליקציה (Docker Host)
resource "aws_instance" "app" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = var.instance_type
  key_name      = var.key_name

  security_groups = [aws_security_group.app_sg.id]

  tags = {
    Name = "App-Server"
  }
}
