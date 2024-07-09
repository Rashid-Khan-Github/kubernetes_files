module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "kube_worker"

  instance_type          = "t2.micro"
  ami                    = "ami-0b4f379183e5706b9"
  monitoring             = true
  vpc_security_group_ids = [aws_security_group.minikube_sg.id]
  subnet_id              = "subnet-0e5126e2752177046"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
  user_data = file("docker.sh")
}

resource "aws_security_group" "minikube_sg" {
  name        = "allow_minikube"
  description = "allow_all_traffic_to_minikube"

  ingress {
    description = "All traffic to minikube"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Allow_TCP"
  }

}
