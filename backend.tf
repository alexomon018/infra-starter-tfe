terraform { 
  cloud { 
    organization = "alexomon018"
    workspaces { 
      name = "example-workspace" 
    } 
  } 
}