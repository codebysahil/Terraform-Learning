locals{
    resource_group_name = "test-rg"
    resource_group_location = "West Europe"
    ip_address_prefix = ["10.0.1.0/24","10.0.2.0/24"]
    virtual_network = {
        name="app-network"
        address_prefixes = ["10.0.0.0/16"] # list of strings
    }
    subnets_data = [{
        name = "websubnet01"
        address_prefix = ["10.0.1.0/24"]
    },
    
    {
        name= "appsubnet01"
        address_prefix = ["10.0.2.0/24"]
    }]
    webinterface_name = "webinterface01"
    privateinterface_name = "privateinterface01"
}
