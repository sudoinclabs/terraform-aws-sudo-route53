variable "zone_id" {
  type        = string
  description = "ID of hosted zone where the records will be added."
  default     = ""
}

variable "zone_name" {
  type        = string
  description = "Name of the zone i.e your domain name"
}

variable "private_zone" {
  type        = bool
  description = "(optional) Specify if private zone needs to be created. Default: false"
  default     = false
}

variable "vpc_id" {
  type        = string
  description = "(optional) Specify VPC ID for private zone. Default: null"
  default     = null
}

variable "comment" {
  type        = string
  description = "(optional) Add a comment to your hosted zone. Default 'Managed by Terraform'"
  default     = "Managed by Terraform"
}

variable "tags" {
  type        = map(any)
  description = "(optional) map of tags to be assigned to hosted zone"
  default     = {}
}

variable "records" {
  type        = any
  description = "(Optional) Provide the map of records"
  default     = {}
}

variable "ttl" {
  type        = string
  description = "(optional) Default TTL for non-aliased records"
  default     = "300"
}