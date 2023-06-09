variable "user" {}
variable "subnets" {}

resource "null_resource" "server_settings" {
  count = length(var.subnets)

  provisioner "local-exec" {
    command = <<-EOT
    cat ~/.ssh/id_rsa.pub | sshpass -p ${var.user.password} ssh ${var.user.name}@${var.subnets[count.index].ip} "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys" &&
    ssh ${var.user.name}@${var.subnets[count.index].ip} "/boot/dietpi/dietpi-software install 0"
    EOT
  }
}