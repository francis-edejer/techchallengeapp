terraform {
  backend "s3" {
    bucket         = "tf-bucket"
    key            = "development"
    encrypt        = true
    region         = "us-east-1"
    dynamodb_table = "test_dynamo_db"
    profile        = "development"
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "development"
}

module "us-east-1" {
  source                  = "../modules"
  region                  = "us-east-1"
  # ECS Service container fleet and deployment configs
  ecs_cluster             = "default"
  desired_count           = 4
  task_cpu                = 4
  task_memory             = 512
  project_name            = "techchallengeapp"
  docker_repo             = "servian"
  release_version         = var.release_version
  service_discovery_id    = "sd-1234557788"
  # DB configs
  postgres_engine_version = "10.7"
  # Application listener configs
  listenhost              = "localhost"
  listenport              = "3000"
  # VPC configs
  vpc_id                  = "vpc-123456"
  task_subnet             = "subnet-123456"
  allowed_sg              = var.allowed_sg
  providers = {
    aws = aws.development
  }
}
