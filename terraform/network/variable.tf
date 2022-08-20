variable "name" {
  type = string
  description = "prefix for environment"
}

variable "vpc_cidr" {
    type = string
    description = "cidr for vpc" 
}

variable "region" {
  type = string
}

variable "public_1_cidr" {
  type = string
}

variable "public_2_cidr" {
  type = string
}

variable "private_1_cidr" {
  type = string
}

variable "private_2_cidr" {
  type = string
}
