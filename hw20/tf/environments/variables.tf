variable "aws_region" {
  default = "eu-central-1"
}

variable "vpc_id" {
  type        = string
  description = "Default aws vpc id"
}

variable "list_of_open_ports" {
  type        = list(number)
  description = "List of open ports to be used in security group"
}

variable "repo_url" {
  type = string
  description = "Repo URL to use for the Dockerfile"
}