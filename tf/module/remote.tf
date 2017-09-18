data "terraform_remote_state" "network" {
  backend = "s3"
  config {
    bucket          = "${var.common_state_bucket}"
    encrypt         = true
    key             = "common/network/terraform.tfstate"
    profile         = "${var.profile}"
    region          = "${var.region}"
  }
}

data "terraform_remote_state" "service_cluster" {
  backend = "s3"
  config {
    bucket          = "${var.env_state_bucket != "" ? var.env_state_bucket : var.common_state_bucket}"
    encrypt         = true
    key             = "${var.env_name}/service_cluster/terraform.tfstate"
    profile         = "${var.profile}"
    region          = "${var.region}"
  }
}

data "terraform_remote_state" "data_storage" {
  backend = "s3"
  config {
    bucket          = "${var.env_state_bucket != "" ? var.env_state_bucket : var.common_state_bucket}"
    encrypt         = true
    key             = "${var.env_name}/data_storage/terraform.tfstate"
    profile         = "${var.profile}"
    region          = "${var.region}"
  }
}
