variable "name" {
  type        = string
  default     = ""
  description = "Name  (e.g. `app` or `cluster`)."
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)."
}

variable "enabled" {
  type        = bool
  default     = true
  description = "Whether to create Iam user."
}

variable "force_destroy" {
  type        = bool
  default     = false
  description = "When destroying this user, destroy even if it has non-Terraform-managed IAM access keys, login profile or MFA devices. Without force_destroy a user with non-Terraform-managed access keys and login profile will fail to be destroyed."
}

variable "path" {
  type        = string
  default     = "/"
  description = "The path to the role."
}
variable "permissions_boundary" {
  type        = string
  default     = ""
  description = "The ARN of the policy that is used to set the permissions boundary for the role."
  sensitive   = true
}
variable "policy" {
  type        = string
  default     = ""
  description = "The policy document."
}


variable "policy_arn" {
  type        = string
  default     = ""
  description = "The ARN of the policy you want to apply."
  sensitive   = true
}

variable "groups" {
  type        = list(string)
  default     = []
  description = "(Optional) List of IAM groups to add the User to."
}

variable "create_user" {
  type        = bool
  default     = true
  description = "Whether to create the IAM user"
}






