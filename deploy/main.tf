###########
# Defaults
##########

provider "aws" {
  region = var.region
}

terraform {
  required_version = ">= 1.0.0"
  backend "remote" {}
}

module "codebuild" {
  source             = "../"
  build_image        = "aws/codebuild/amazonlinux2-x86_64-standard:3.0"
  build_spec_file    = var.build_spec_file
  compute_type       = "BUILD_GENERAL1_MEDIUM"
  environment        = var.environment
  git_clone_depth    = "1"
  git_repo           = var.git_repo
  project_name       = var.project_name
  codebuild_env_vars = var.codebuild_env_vars
}

