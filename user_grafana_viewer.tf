resource "keycloak_user" "grafana_viewer" {
  realm_id       = keycloak_realm.sikademo.id
  username       = "grafana-viewer"
  enabled        = true
  email          = "grafana-viewer@sikademo.com"
  email_verified = true
  first_name     = "Grafana"
  last_name      = "Viewer"
  initial_password {
    value     = "a"
    temporary = true
  }
}

resource "keycloak_user_groups" "grafana_viewer" {
  realm_id = keycloak_realm.sikademo.id
  user_id  = keycloak_user.ondrej.id
  group_ids = [
    keycloak_group.grafana_viewer.id,
  ]
}
