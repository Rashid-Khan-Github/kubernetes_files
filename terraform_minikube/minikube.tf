module "minikube" {
  source = "github.com/scholzj/terraform-aws-minikube"

  aws_region    = "us-east-1"
  cluster_name  = "minikube-robo"
  aws_instance_type = "t3.medium"
  ssh_public_key = "~/MyPersonalKey.pub"
  aws_subnet_id = "subnet-0e5126e2752177046"           // any subnet in any VPC
  ami_image_id = "ami-0b4f379183e5706b9"               // it will consider centos 7 by default
  hosted_zone = "bsebregistration.com"
  hosted_zone_private = false

  tags = {
    Application = "Minikube"
  }

  addons = [
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/storage-class.yaml",
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/heapster.yaml",
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/dashboard.yaml",
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/external-dns.yaml"
  ]
}