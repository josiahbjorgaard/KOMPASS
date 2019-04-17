resource "kubernetes_persistent_volume" "database" {
    metadata {
        name = "kompass-data"
    }
    spec {
        capacity {
            storage = "2Gi"
        }
        access_modes = ["ReadWriteMany"]
        persistent_volume_source {
            vsphere_volume {
                volume_path = "/absolute/path"
            }
        }
    }
}
