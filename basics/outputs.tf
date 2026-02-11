output "application_name" {
  value = var.application_name
}

output "environment_name" {
  value = var.environment_name
}

output "application_prefix" {
  value = local.environment_prefix
}

output "suffix" {
  value = random_string.suffix.result
}

output "isEnabled" {
  value = var.enabled
}

output "supported_regions" {
  value = var.regions
}


output "total_instances" {
  value = var.instance_count
}


output "primary_region" {
  value = var.regions[0]
}

output "primary_region_instance_count" {
  value = var.region_instance_count[var.regions[0]]
}


output "kind" {
  value = var.sku_settings.kind
}


output "random_id" {
  value = { for k,v in random_string.map: k=> v.result}
}


output "random_boolean" {
  value = try( random_string.if[0].result,null)
  // value = random_string.if.result[1]
}
