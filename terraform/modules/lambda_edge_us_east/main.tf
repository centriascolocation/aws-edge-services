locals {
  region        = var.config["default_region"]
  region_config = var.config[local.region]
  name          = var.config["name"]
  common_tags = merge(
    lookup(local.region_config, "tags"),
    {
      Module = "aws.terraform.modules.lambda_edge_us_west"
    }
  )
}

data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "index.js"
  output_path = "lambda_function.zip"
}

resource "aws_lambda_function" "lambda_edge" {
  filename         = "lambda_function.zip"
  function_name    = "${local.name}-lambdaedge-origin-request"
  handler          = "index.handler"
  role             = aws_iam_role.iam_for_lambda.arn
  runtime          = "nodejs12.x"
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  publish          = true
  tags             = local.common_tags
}

resource "aws_lambda_alias" "lambda_edge_alias" {
  name             = "${local.name}-lambdaedge-origin-request-alias"
  description      = "a sample description"
  function_name    = aws_lambda_function.lambda_edge.arn
  function_version = "$LATEST"
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.iam_for_lambda.json
}

data "aws_iam_policy_document" "iam_for_lambda" {
  statement {
    sid     = ""
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type = "Service"

      identifiers = [
        "edgelambda.amazonaws.com",
        "lambda.amazonaws.com",
      ]
    }
  }
}
