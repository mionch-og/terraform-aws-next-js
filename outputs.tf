output "static_upload_bucket_id" {
  value = module.statics_deploy.static_upload_bucket_id
}

##################################
# Internal CloudFront distribution
##################################

output "cloudfront_domain_name" {
  description = "Domain of the main CloudFront distribution (When created)."
  value       = var.cloudfront_create_distribution ? module.cloudfront_main[0].cloudfront_domain_name : null
}

output "cloudfront_hosted_zone_id" {
  description = "Zone id of the main CloudFront distribution (When created)."
  value       = var.cloudfront_create_distribution ? module.cloudfront_main[0].cloudfront_hosted_zone_id : null
}

##################################
# External CloudFront distribution
##################################

output "cloudfront_default_root_object" {
  description = "Preconfigured root object the CloudFront distribution should use."
  value       = local.cloudfront_default_root_object
}

output "cloudfront_default_cache_behavior" {
  description = "Preconfigured default cache behavior the CloudFront distribution should use."
  value       = local.cloudfront_default_behavior
}

output "cloudfront_ordered_cache_behaviors" {
  description = "Preconfigured ordered cache behaviors the CloudFront distribution should use."
  value       = local.cloudfront_ordered_cache_behaviors
}

output "cloudfront_origins" {
  description = "Preconfigured origins the CloudFront distribution should use."
  value       = local.cloudfront_origins
}

output "cloudfront_custom_error_response" {
  description = "Preconfigured custom error response the CloudFront distribution should use."
  value       = local.cloudfront_custom_error_response
}

##################################
# Lambda function
##################################

output "lambda_functions" {
  description = "The map of ARNs mapped to the published version of the Lambda functions deployed. Can be used in a for_each as needed."
  value = tomap({
    for x in aws_lambda_function.this : x.arn => x.function_name
  })
}