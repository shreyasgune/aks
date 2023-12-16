variable "application_id" {
  description = "application id"
  type = string
}

variable "location" {
  type        = string
  default     = "eastus"
  description = "Location of the resource group."
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type = string
}

variable "client_secret" {
    description = "client secret from env var"
    type = string
}

variable "end_date" {
    description = "end date of the secret"
    type = string
    default = "2025-01-01T01:02:03Z"
}

