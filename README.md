# terraform-rpi

terraform apply -target=null_resource.local_script -var='user={"name":"name","password":"password"}'
terraform state rm null_resource.local_script
sshpass -p ${var.user.password} ssh-copy-id ${var.user.name}@${var.subnets[count.index].ip}
cat ~/.ssh/id_rsa.pub | ssh username@remote_host "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"

.
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── modules
│ ├── module1
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ └── module2
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf
├── environments
│ ├── dev
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ └── prod
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf
└── .terraform
└── terraform.tfstate

Объяснение структуры папок:

main.tf: Основной файл конфигурации Terraform, содержащий ресурсы и провайдеры.
variables.tf: Файл, определяющий переменные Terraform для вашего проекта.
outputs.tf: Файл, определяющий выводы (output) Terraform для вашего проекта.
terraform.tfvars: Файл, содержащий значения переменных Terraform для каждой среды (например, dev, prod).
modules/: Папка, содержащая модули Terraform, которые могут быть использованы в вашем проекте.
modules/module1/, modules/module2/: Папки, содержащие файлы конфигурации, переменные и выводы для каждого модуля.
environments/: Папка, содержащая конфигурацию Terraform для разных сред (например, dev, prod).
environments/dev/, environments/prod/: Папки, содержащие файлы конфигурации, переменные и выводы для каждой среды.
.terraform/: Папка, создаваемая Terraform для хранения локальных данных и состояния проекта.
.terraform/terraform.tfstate: Файл состояния Terraform, содержащий текущее состояние инфраструктуры.

Структура папок может варьироваться в зависимости от требований вашего проекта. Однако, данная структура предлагает организацию по модулям и средам, что облегчает масштабирование и управление проектом с использованием Terraform.
