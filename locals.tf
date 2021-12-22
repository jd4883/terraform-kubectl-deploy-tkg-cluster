locals {
  version = {
    full      = var.full_version
    short     = split("+", var.full_version).0
    reference = replace(var.full_version, "+", "---")
  }
  parent-cluster = {
    apiVersion = var.api_version
    kind       = "TanzuKubernetesCluster"
    metadata = {
      name      = var.name
      namespace = var.namespace
    }
    spec = {
      distribution = {
        fullVersion = local.version.full
        version     = local.version.short
      }
      settings = {
        network = {
          cni           = { name = var.network_cni }
          pods          = { cidrBlocks = var.pod_cidr }
          serviceDomain = var.domain
          services      = { cidrBlocks = var.service_cidr }

        }
        storage = {
          classes      = distinct(concat([var.default_storage_class, var.control_plane_storage_class], var.node_pools.*.storage_class))
          defaultClass = var.default_storage_class
        }
      }
      topology = {
        controlPlane = {
          replicas     = var.control_plane_vm_count
          storageClass = var.control_plane_storage_class
          tkr = {
            reference = { name = local.version.reference }
          }
          vmClass = var.control_plane_vm_class
        }
        nodePools = [for i in var.node_pools :
          {
            name         = i.name
            replicas     = i.count
            storageClass = i.storage_class
            tkr = {
              reference = { name = local.version.reference }
            }
            vmClass = i.vm_class
          }
        ]
      }
    }
  }
}
