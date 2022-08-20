#role
resource "aws_iam_role" "lambda_ses" {
  name = "lambda_ses"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}



# Lambda Execution Policy
resource "aws_iam_policy" "lambda_execution" {
  name = "lambda_execution"

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": "*"
        }
    ]
})
}

# Policy allowing sending SES emails

resource "aws_iam_policy" "lambda_SES" {
  name = "lambda_SES"

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ses:SendEmail",
                "ses:SendRawEmail"
            ],
            "Resource": "*"
        }
    ]
})
}





#policy_role_attachment

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.lambda_ses.name
  policy_arn = aws_iam_policy.lambda_execution.arn
}


resource "aws_iam_role_policy_attachment" "lambda_ses" {
  role       = aws_iam_role.lambda_ses.name
  policy_arn = aws_iam_policy.lambda_SES.arn
}
