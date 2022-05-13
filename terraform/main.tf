variable "TOKEN" {
  type = string
}

variable "BUILD" {
  type = string
}


# Configure the provider
provider github {
  organization = "super-awesome-org"
  version      = "~> 2.1"
  token        =  var.TOKEN
}

# Add a repository
resource "github_repository" "repository" {
  name               = "a-test-repository-${var.BUILD}"
  description        = "This repository only exists for testing purposes."
  private            = false
  allow_merge_commit = true
  auto_init          = true
}
