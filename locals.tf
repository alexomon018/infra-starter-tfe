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
            identifier = "alexomon018/infra-starter-tfe"
        }
    }
}