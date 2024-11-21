#Provider
terraform {
	required_providers {
		aws = {
		source  = "hashicorp/aws"
		version = "~> 5.0"
		}
	}
}

provider "aws" {
	region                   = var.aws_region
	shared_credentials_files = ["~/.aws/credentials"]
	profile                  = "terraform"
}

# 2.Role and policies
data "aws_iam_policy_document" "assume_role" {
	statement {
		effect = "Allow"
		principals {
			type        = "Service"
			identifiers = ["lambda.amazonaws.com"]
		}
		actions = ["sts:AssumeRole"]
	}
}

resource "aws_iam_role" "udacity_iam" {
  	name               = "udacity_iam"
  	assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "lambda_logging" {
  statement {
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = ["arn:aws:logs:*:*:*"]
  }
}

resource "aws_iam_policy" "lambda_logging" {
  name        = "lambda_logging"
  path        = "/"
  description = "IAM policy for logging from a lambda"
  policy = data.aws_iam_policy_document.lambda_logging.json
}

resource "aws_iam_role_policy_attachment" "lambda_lambda_logging_attachment" {
  role       = aws_iam_role.udacity_iam.name
  policy_arn = aws_iam_policy.lambda_logging.arn
}

# Lambdas
data "archive_file" "lambda" {
  	type        = "zip"
  	source_file = "./greet_lambda.py"
  	output_path = "lambda_function_payload.zip"
}
// Createa lambda resource
resource "aws_lambda_function" "python_lambda" {
	filename      = "lambda_function_payload.zip"
	function_name = "udacity_lambda_function"
	role          = aws_iam_role.udacity_iam.arn
	handler       = "greet_lambda.lambda_handler"
	source_code_hash = data.archive_file.lambda.output_base64sha256
	runtime = var.python_runtime
}