################################
## GCP App Engine - Variables ##
################################

variable "app_bucket_name" {
  type        = string
  description = "Which bucket should the App Engine zip containing the application be deployed"
}