resource "aws_ses_email_identity" "terra-mail" {
  email = "example@example.com"
}


resource "aws_ses_email_identity" "terra-mail-second" {
  email = "example@example.com"
}
