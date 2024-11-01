locals {
  project = {
    "example-project" = { // this is the project name so it is implited becasue it is key value pair
      description = "Example description for project"
    }
  }
  workspace = {
    "infra-tfe" = {
      description    = "Example description for workspace"
      execution_mode = "remote"
      project_id     = module.project["example-project"].id
      identifier     = "${var.github_organization_name}/infra-starter-tfe"
    }
    "infra-github" = {
      description    = "Example automation workspaces for github resources"
      execution_mode = "local" // there is no state first time so it is set to local
      project_id     = module.project["example-project"].id
      identifier     = "${var.github_organization_name}/infra-starter-github"
    }

    "infra-aws-network" = {
      description         = "Automation for AWS network resources."
      execution_mode      = "remote"
      project_id          = module.project["example-project"].id
      vcs_repo_identifier = "${var.github_organization_name}/infra-starter-aws-network"

      variables = [
        {
          category = "terraform"
          hcl      = true
          key      = "azs"
          value    = jsonencode(["us-west-2a", "us-west-2b"])
        },
        {
          category = "terraform"
          key      = "cidr"
          value    = "10.0.0.0/16"
        },
        {
          category = "terraform"
          key      = "name"
          value    = "infra-starter-network"
        },
      ]
    }

    "infra-cluster-prod" = {
      description         = "Automation for AWS cluster resources."
      execution_mode      = "remote"
      project_id          = module.project["example-project"].id
      vcs_repo_identifier = "${var.github_organization_name}/infra-starter-aws-cluster"


      variables = [
        {
          category = "terraform"
          key      = "domain"
          value    = "supwr.click"
        },
        {
          category = "terraform"
          key      = "environment"
          value    = "prod"
        },
        {
          category = "terraform"
          key      = "name"
          value    = "infra-starter-cluster-prod"
        },
        {
          category = "terraform"
          key      = "vpc_name"
          value    = "infra-starter-network"
        },
      ]
    }
  }

}
