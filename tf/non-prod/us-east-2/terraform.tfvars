terragrunt = {
  remote_state {
    backend = "s3"
    config {
      # adjust the bucket for the environment
      bucket          = "sample-tf-non-prod-state-us-east-2-776609208984"
      # change the service name below
      key             = "world/${path_relative_to_include()}/terraform.tfstate"
      # adjust the lock table for the environment
      lock_table      = "sample-tf-non-prod-lock-table"
      encrypt         = true
      profile         = "dcgapi-dev"
      region          = "us-east-2"
    }
  }

  terraform {
    extra_arguments "common_vars" {
      commands = [
        "apply",
        "destroy",
        "init",
        "plan",
        "import",
        "push",
        "refresh"
      ]

      required_var_files = [
        "${get_parent_tfvars_dir()}/./common.tfvars"
      ]
    }
  }
}
