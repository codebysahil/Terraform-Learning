locals {
  address_space = ["10.0.0.0/16"] # list ,address_space = list(string)
  subnets = {
    subnet1 = {
      name           = "subnet_app"
      address_prefix = "10.0.1.0/24" # string address_prefixes = list(string)

    }
    subnet2 = {
      name           = "subnet_db"
      address_prefix = "10.0.2.0/24"
    }
    subnet3 = {
      name           = "subnet_web"
      address_prefix = "10.0.3.0/24"
    }
  }



}
