# TODO: gotta figure out how to better set a dependency chain here
resource "kubectl_manifest" "parent-cluster" {
  yaml_body          = yamlencode(local.parent-cluster)
  validate_schema    = var.validate_schema
  server_side_apply  = var.server_side_apply
  wait_for_rollout   = var.wait_for_rollout
  ignore_fields      = var.ignore_fields
  wait               = var.wait
  override_namespace = var.override_namespace
  force_new          = var.force_new
  sensitive_fields   = var.sensitive_fields
}
