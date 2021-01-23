variable "zone_id" {
  type        = string
  description = "ID of hosted zone where the records will be added."
}

variable "zone_name" {
  type        = string
  description = "zone_name is needed to generate correct recordset"
}

variable "records" {
  type        = any
  description = "(optional) describe your variable"
}

variable "ttl" {
  type        = string
  description = "(optional) Default TTL for non-aliased records"
  default     = "300"
}

variable "type" {
  type        = string
  description = "Specify the record type"
}