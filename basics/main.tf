resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}

resource "random_string" "list" {

  count   = length(var.regions)
  length  = 6
  upper   = false
  special = false
}

resource "random_string" "map" {

  for_each = var.region_instance_count
  length   = each.value
  upper    = false
  special  = false

}


resource "random_string" "if" {


  count = var.enabled ? 1 : 0
  length   = 6
  upper    = false
  special  = false

}
