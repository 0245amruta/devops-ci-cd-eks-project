module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.0"

  name = "eks-vpc"
  cidr = "This contains cidr"

  azs             = ["ap-south-1a", "ap-south-1b"]
  private_subnets = ["This contains Private subnet ip", "....."]
  public_subnets  = ["This contains public subnet ip", "...."]

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Project = "python-ci-cd-eks"
  }
}

