locals {
    project = {
        "example-project" = { // this is the project name so it is implited becasue it is key value pair
            description = "Example description for project"
        }
    }
    workspace = {
        "example-workspace" = {
            description = "Example description for workspace"
            execution_mode = "local" 
            project_id = module.project.id
        }
    }
}