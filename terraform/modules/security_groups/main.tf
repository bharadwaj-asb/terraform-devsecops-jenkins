variable "name" {
  type = string
}

variable "allowed_cidr" {
  type    = list(string)
  default = ["0.0.0.0/0"]   # insecure default (intentional)
}

resource "aws_security_group" "this" {
  name = var.name

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr
  }
}
