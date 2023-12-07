variable "elb_name" {
  type        = string
  description = "Name of ELB"
}

variable "azs" {
  type        = list(string)
  description = "Name of AZ's for ELB (List format)"
}

variable "idle_timeout" {
  type        = number
  description = "Idle Timeout for ELB"
  default     = 400
}

variable "elb_tags" {
  type        = map(any)
  description = "Tags for ELB"
  default     = { "Name" : "terraform ELB" }
}

variable "s3_bucket_names" {
    type = list
    default = ["demo-bucket1" , "demo-bucket2"]  
}