# msteams-aisearch-terraform
Terraform to setup the AI Search resources, including resource group required for
working with the Microsoft 365 Agent Toolkit "Chat to my data" scaffold

This is based on the terraform at https://learn.microsoft.com/en-us/azure/search/search-get-started-terraform

## Instructions
1. Install Terraform for your platform. https://developer.hashicorp.com/terraform/install
2. `terraform init`
3. `terraform plan` and check what it will do
4. `terraform apply` to create the resources defined in the terraform module.
