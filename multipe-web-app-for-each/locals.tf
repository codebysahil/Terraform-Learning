locals {



  app_service_plan_name = "asp-${var.environment}"

  web_apps = {
    app1 = {
      name = "webapp1-${var.environment}-88919"
    }

    app2 = {
      name = "webapp2-${var.environment}-88919"
    }
    app3 = {
      name = "webapp3-${var.environment}-88919"
    }
  }
}
