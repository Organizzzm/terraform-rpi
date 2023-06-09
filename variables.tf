variable "subnets" {
  type = list(object({
    ip = string
    name = string
  }))

  default = [ {
      ip = "192.168.1.101"
      name = "kube_master"
    },
    {
      ip = "192.168.1.102"
      name = "kube_1"
    },
    {
      ip = "192.168.1.103"
      name = "kube_2"
    } ]
  
}

variable "user" {
  type = object({
    name = string
    password = string
  })

  default = {
    name = "root"
    password = "dietpi"
  }
}
