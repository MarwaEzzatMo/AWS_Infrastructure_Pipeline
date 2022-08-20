# resource "tls_private_key" "private_key_pair" {
#   algorithm = "RSA"
#   rsa_bits  = 4096

#   provisioner "local-exec" {
#     command = "echo ${self.private_key_pem} > ${var.region}-${var.name}-private_key.pem"
#   }
# }

# resource "aws_key_pair" "public_key_pair" {
#   key_name   = "${var.region}-${var.name}-public-key_pair"
#   public_key = tls_private_key.private_key_pair.public_key_openssh
# }

# resource "aws_secretsmanager_secret" "private_key" {
#   name = "${var.region}-${var.name}-private_key"
# }

# resource "aws_secretsmanager_secret" "public_key" {
#   name = "${var.region}-${var.name}-public_key"
# }

# resource "aws_secretsmanager_secret_version" "private_key_value" {
#   secret_id     = aws_secretsmanager_secret.private_key.id
#   secret_string = tls_private_key.private_key_pair.private_key_pem
# }

# resource "aws_secretsmanager_secret_version" "public_key_value" {
#   secret_id     = aws_secretsmanager_secret.public_key.id
#   secret_string = aws_key_pair.public_key_pair.public_key
# }
