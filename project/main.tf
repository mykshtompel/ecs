variable "region" {
  description = "The AWS region for the project"
  default     = "us-east-2"
}

provider "aws" {
  region = var.region
}

module "network" {
  source = "./modules/network"

  cidr_block                = "10.10.0.0/16"
  aws_dns                   = true
  env                       = "stage"
  app                       = "app"
  app_port                  = 80
  app_target_port           = 80
  health_check_path         = "/"
  name_container            = "nginx"
  web_server_image          = "447854022972.dkr.ecr.us-east-2.amazonaws.com/app-stage-nginx"
  web_server_count          = 2
  web_server_fargate_cpu    = 256
  web_server_fargate_memory = 512
}
