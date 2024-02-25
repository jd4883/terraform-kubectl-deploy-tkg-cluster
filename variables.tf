variable "api_version" {
  type    = string
  default = "run.tanzu.vmware.com/v1alpha2"
}

variable "sensitive_fields" {
  type    = list(string)
  default = ["data"]
}

variable "force_new" {
  type    = bool
  default = false
}

variable "validate_schema" {
  type    = bool
  default = true
}

variable "wait_for_rollout" {
  type    = bool
  default = true
}

variable "server_side_apply" {
  type    = bool
  default = false
}

variable "override_namespace" {
  type    = string
  default = ""
}

variable "wait" {
  type    = bool
  default = true
}

variable "ignore_fields" {
  type    = list(string)
  default = []
}

variable "control_plane_vm_count" {
  type    = number
  default = 1
  # TODO: add sizing validation
}
variable "node_pools" {
  type = list(object(
    {
      labels        = optional(map(string))
      name          = string
      count         = number
      storage_class = string
      vm_class      = string
    }
  ))
}

variable "network_cni" {
  type    = string
  default = "calico"
}
variable "pod_cidr" {
  type    = list(string)
  default = ["192.168.0.0/16"]
}

variable "service_cidr" {
  type    = list(string)
  default = ["10.96.0.0/12"]
}


variable "control_plane_storage_class" { type = string }
variable "control_plane_vm_class" { type = string }
variable "default_storage_class" { type = string }
variable "domain" { type = string }
variable "full_version" { type = string }
variable "name" { type = string }
variable "namespace" { type = string }
