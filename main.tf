module "project" {
  source  = "ALT-F4-LLC/project/tfe"
  version = "0.5.0"
  description = "Example description for project"
  name        = "example-project"
  organization_name = var.organization_name
}

module "workspace" {
  source  = "ALT-F4-LLC/workspace/tfe"
  version = "0.8.0"
  execution_mode = "local"
  name = "example-workspace"
  description = "Example description for workspace"
  organization_name = var.organization_name
  project_id = module.project.id
}