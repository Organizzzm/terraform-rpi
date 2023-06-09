# Импорт модулей
module "server_settings" {
  source = "./modules/servers-settings"

  user    = var.user
  subnets = var.subnets
}

module "user_settings" {
  depends_on = [module.server_settings]
  source = "./modules/user-settings"

  user    = var.user
  subnets = var.subnets
}