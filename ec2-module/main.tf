resource "aws_instance" "webserver" {
  count         = var.ec2_count
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [var.security_group_id]
  subnet_id     = var.public_subnet_id
  tags = merge(
    {
      Name        = "NginxEC2",
      App         = var.App,
      Environment = var.environment
    },
    var.tags
  )

  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo amazon-linux-extras install nginx1 -y 
    sudo systemctl enable nginx
    sudo systemctl start nginx
    EOF
}