resource "google_apigee_environment_iam_binding" "apigee_environment_iam_bindings" {
  for_each = var.apigee_environment_iam_bindings

  env_id  = each.value.env_id
  members = each.value.members
  org_id  = each.value.org_id
  role    = each.value.role

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

