resource "aws_service_discovery_service" "default" {
  name = var.project_name

  dns_config {
    namespace_id = var.service_discovery_id

    dns_records {
      ttl  = 10
      type = "A"
    }

    routing_policy = "MULTIVALUE"
  }

}
