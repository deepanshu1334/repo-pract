variable "zone" {
  description = "The zone to deploy the VM in"
  default     = "us-central1-a"
}

variable "machine_type" {
  description = "The machine type for the VM"
  default     = "n1-standard-1"
}

variable "image_family" {
  description = "The image family to use"
  default     = "debian-12"
}
