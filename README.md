# AWS ECS + Terraform
This page describes how to create a Amazon Elastic Container Service using Terraform. 

### Tool versions:
- Terraform - 1.02
- AWS CLI - 2.2.23

## Description
This solution was created to demonstrate how creating a Elastic Container Service on AWS based on "Infrastructure as a code" using Terraform looks like. It consists of Terraform module "network" and "main" Terraform files to create infrastructure, an AWS Application Load Balancer which returns a web page containing a text from web server container.

The solution creates a Virtual Private Cloud, an Elastic Container Registry, an Elastic Container Service, an AWS Identity Access Management Role, and an Application Load Balancer according to requirements.

The repo contains the next components:
* Terraform project

## Folders and Files
- /project - Terraform directory
  - ./modules - Terraform modules
    - ./network - "network" module
      - ./web - Web content and Dockerfile 

## Configuration
Main configuration files are the next:
- /project/modules/network/
    - ./web/
      - Dockerfile - Container configuration
      - index.html - Custom web page   
- /project/modules/network/ 
  - variables.tf - Module variables 
  - vpc.tf - Virtual Private Cloud
  - ecr.tf - Elastic Container Registry
  - ecs.tf - Elastic Container Service
  - roles.tf - Identity Access Management Role
  - alb.tf - Application Load Balancer
  - outputs.tf - Module outputs
- /project/
  - main.tf - Infrastructure configuration
  - outputs.tf - Main outputs

## Implemention
### Preparation
- Create an account on AWS
- Create an user with required permissions using AWS IAM
- Install the required version of Terraform and AWS CLI
- Download the repo content
- Update "locals" block in /project/modules/network/variables.tf file
- Change "variables" block in /project/main.tf file
- Change "index.html" in /project/web/index.html file
### Deployment
- Add AWS AIM user credentials using command line

export AWS_AWS_PROFILE=YOUR AWS PROFILE 
  
- Go to the /project directory and run:
  
terraform init  
terraform plan  
terraform apply

- Check results
  - Go to your AWS account and check created infrastructure elements 
  - Go to the DNS name created Application Load Balancer and check an information on a web page
  
- To delete created infrastructure, go to the /project directory and run:
  
terraform destroy

