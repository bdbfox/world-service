####################################################
# Leave this file alone (it'll be the same always) #
####################################################

terragrunt = {
  # Include all settings from the root terraform.tfvars file
  include {
    path = "${find_in_parent_folders()}"
  }

  terraform {
    # I would suggest you use a git repo for the module instead
    # see foo/bar services
    source = "${get_parent_tfvars_dir()}/../../../../..//module"

    extra_arguments "env_vars" {
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
        "${get_tfvars_dir()}/./deploy.tfvars",
        "${get_tfvars_dir()}/../../env.tfvars"
      ]
    }
  }
}
