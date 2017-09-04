# Local public key
variable "public_key_path" {
  description = "local public key path"
  default = "~/.ssh/id_rsa.pub"
}
# Local private key
variable "private_key_path" {
  description = "private key path"
  default = "~/.ssh/id_rsa"
}
# Name of the keypair to be made
variable "key_name" {
  description = "Desired name of AWS key pair"
  default = "evolve"
}

# where to go
variable "aws_region" {
  description = "AWS region to launch servers."
  default = "us-west-2"
}

# My Centos 7 ami; in a real world, there'd be more than one
variable "aws_amis" {
  default = {
    us-west-2 = "ami-0c2aba6c"
  }
}
