provider "grafana" {
  url  = "http://127.0.0.1:3000"
}


terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "1.27.0"
    }
  }
}

resource "grafana_team" "team" {
  name = "DevOps"
}

resource "grafana_user" "user" {
  count = length(var.users)
  email = var.users[count.index]
  password = "p@s5W0rd"
}

resource "grafana_dashboard" "metrics" {
  config_json = file("./pubsub-dashboard.json")
}

resource "grafana_dashboard_permission" "collectionPermission" {
  count = length(var.users)
  dashboard_id = grafana_dashboard.metrics.dashboard_id
  permissions {
    role       = "Editor"
    permission = "Edit"
  }
  permissions {
    team_id    = grafana_team.team.id
    permission = "View"
  }
  permissions {
    user_id    = grafana_user.user[count.index].id
    permission = "Admin"
  }
}

