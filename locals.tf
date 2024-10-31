locals {
    project = {
        "example-project" = { // this is the project name so it is implited becasue it is key value pair
            description = "Example description for project"
        }
    }
    workspace = {
        "infra-tfe" = {
            description = "Example description for workspace"
            execution_mode = "remote" 
            project_id = module.project["example-project"].id
            identifier = "${var.github_organization_name}/infra-starter-tfe"
        }
        "infra-github" = {
            description = "Example automation workspaces for github resources"
            execution_mode = "local" // there is no state first time so it is set to local
            project_id = module.project["example-project"].id
            identifier = "${var.github_organization_name}/infra-starter-github"
        }
    }
}