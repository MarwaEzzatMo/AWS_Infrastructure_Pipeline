resource "aws_s3_bucket_notification" "s3_lambda_event" {
  bucket = "backend-terroo"

  lambda_function {
    lambda_function_arn = aws_lambda_function.lambda_ses_s3action.arn
    events              = ["s3:ObjectCreated:*", "s3:ObjectRemoved:*", "s3:ObjectRestore:*"]
  }

  depends_on = [aws_lambda_permission.allow_bucket]
}



resource "aws_lambda_permission" "allow_bucket" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_ses_s3action.arn
  principal     = "s3.amazonaws.com"
  source_arn    = "arn:aws:s3:::backend-terroo"
}