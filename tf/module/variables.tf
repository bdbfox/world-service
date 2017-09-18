# user inputs
variable "profile" {
  description = "The AWS profile to use for deployment"
  default = ""
}

variable "common_state_bucket" {
  description = "The s3 bucket that contains the remote state for the networking"
  default = ""
}

variable "deploy_tag" {
  description = "The deployment tag, ie. blue, green, etc..."
  default = "blue"
}

variable "docker_tag" {
  description = "The docker tag, defaults to latest"
  default = "latest"
}

variable "env_name" {
  description = "The name of the environment to deploy this to"
  default = ""
}

variable "region" {
  description = "The region to deploy the cluster in, e.g: us-east-1."
  default = "us-east-2"
}

variable "version" {
  description = "The version number for deployment, ie. v1, v2, etc..."
  default = "v1"
}

# ignored
variable "env_state_bucket" {
  description = "The s3 bucket that contains the environment remote state, leave blank to use the common one"
  default = ""
}

# retrieved from common
variable "docker_image" {
  description = "The docker image for your docker image"
  default = ""
}

variable "service_name" {
  description = "The service name"
  default = ""
}
