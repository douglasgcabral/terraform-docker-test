# variables.tf
variable "nome_container" {
  description = "Nome do container"
  type        = string
  default     = "web-server"
}

variable "porta_externa" {
  description = "Porta para acesso externo"
  type        = number
  default     = 8081
}
