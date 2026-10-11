variable "apigee_environment_iam_bindings" {
  description = <<EOT
Map of apigee_environment_iam_bindings, attributes below
Required:
    - env_id
    - members
    - org_id
    - role
Optional:
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    env_id  = string
    members = set(string)
    org_id  = string
    role    = string
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

