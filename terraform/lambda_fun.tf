resource "aws_lambda_function" "lambda_ses_s3action" {
  filename      = "code.zip"
  function_name = "lambda_ses_s3action"
  role          = aws_iam_role.lambda_ses.arn
  handler = "code.lambda_handler"
  runtime = "python3.9"
}

