# ─── Key Vault Inputs ───
variable "name" {
  type        = string
  description = "Name of the Key Vault."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group in which to create the Key Vault."
}

variable "location" {
  type        = string
  description = "Azure location for the Key Vault."
}

variable "sku_name" {
  type        = string
  description = "SKU name for Key Vault (standard or premium)."
  default     = "standard"
  validation {
    condition     = contains(["standard","premium"], lower(var.sku_name))
    error_message = "sku_name must be either 'standard' or 'premium'"
  }
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the Key Vault. All mandatory tags must be included."
}

variable "soft_delete_retention_days" {
  type        = number
  description = "Number of days to retain soft deleted keys/secrets."
  default     = 90
}
