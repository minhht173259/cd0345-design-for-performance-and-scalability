# TODO: Define the output variable for the lambda function.
output "lambda_output" {
  value = aws_lambda_function.python_lambda.function_name
}