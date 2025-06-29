provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "employee_app" {
  ami           = "ami-0c02fb55956c7d316"  # ✅ Amazon Linux 2 (us-east-1) – you can change this later
  instance_type = "t2.micro"
  key_name      = "your-keypair"           # 🔑 Replace with your AWS EC2 key pair name

  tags = {
    Name = "EmployeeAppServer"
  }

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install docker -y
              service docker start
              usermod -aG docker ec2-user
              docker run -d -p 8080:8080 yourdockerhubusername/employee-management:latest
              EOF
}
