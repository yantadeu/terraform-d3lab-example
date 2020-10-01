variable "amis" {
    type = map

    default = {
        "us-east-1" = "ami-06b263d6ceff0b3dd"
        "us-east-2" = "ami-0603cbe34fd08cb81"
    }
}

variable "cdirs_acesso_remoto" {
    type = list
    default = ["0.0.0.0/0"]
}

variable "key_name" {
    type = string
    default = "terraform"
}