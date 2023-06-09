variable "user" {}
variable "subnets" {}

resource "null_resource" "user_settings" {
  count = length(var.subnets)

  connection {
    type        = "ssh"
    user        = var.user.name
    # password    = var.user.password
    private_key = file("~/.ssh/id_rsa")
    host        = var.subnets[count.index].ip
  }

  provisioner "remote-exec" {
    inline = [
      "whoami"
      # Добавьте необходимые команды для настройки сети на сервере 1
    ]
  }
}