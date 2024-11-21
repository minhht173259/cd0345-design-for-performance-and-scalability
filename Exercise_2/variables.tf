# TODO: Define the output variable for the lambda function.
variable "aws_region" {
    description = "AWS Region"
    default = "us-east-1"
}
variable "python_runtime" {
    description = "Python Runtime"
    default = "python3.12"
}