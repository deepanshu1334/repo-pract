# terraform {
#   required_providers {
#     aws = {
#         source = "hashicorp/aws"
#         version = "5.54.1"
#     }
#   }
# }

# provider "aws" {
#     region = "ap-south-1"
# }

# resource "aws_instance" "myserver" {
#   ami = "ami-0e35ddab05955cf57"
#   instance_type = "t3.micro"

#   tags = {
#     Name = "sample server"
#   }
# }




#using cloudfromation crating an ec2 instnace 

# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "5.54.1"
#     }
#   }
# }

# provider "aws" {
#   region = "ap-south-1"  # Specify your AWS region
# }

# # CloudFormation Stack: EC2 instance creation template
# resource "aws_cloudformation_stack" "ec2_instance_stack" {
#   name = "ec2-instance-stack"

#   template_body = <<-TEMPLATE
#   Resources:
#     EC2Instance:
#       Type: "AWS::EC2::Instance"
#       Properties:
#         InstanceType: "t3.micro"  # Instance type
#         ImageId: "ami-0e35ddab05955cf57"  # Specify the AMI ID for the EC2 instance
#         Tags:
#           - Key: "Name"
#             Value: "sample server"
#   Outputs:
#     InstanceId:
#       Value: !Ref EC2Instance
#       Description: "EC2 Instance ID"
#   TEMPLATE

#   # Deletion protection is not supported directly here, so omit it.
# }

# # Output the EC2 instance ID from the CloudFormation stack
# output "instance_id" {
#   value = aws_cloudformation_stack.ec2_instance_stack.outputs["InstanceId"]
# }





# # This block specifies the required provider, which in this case is AWS.
# # It is telling Terraform to use the AWS provider and specifying the version to be used (v5.54.1).
# # terraform {
# #   required_providers {
# #     aws = {
# #       source  = "hashicorp/aws"  # The source of the AWS provider.
# #       version = "5.54.1"  # The version of the AWS provider to use.
# #     }
# #   }
# # }

# # # This block specifies the AWS provider configuration.
# # # It defines the region where the AWS resources will be created.
# # provider "aws" {
# #   region = "ap-south-1"  # The region to deploy resources, here it's Asia Pacific (Mumbai).
# # }

# # # This block creates a CloudFormation stack using Terraform.
# # # The CloudFormation stack will define the EC2 instance resources.
# # resource "aws_cloudformation_stack" "ec2_instance_stack" {
# #   # The name of the CloudFormation stack. This will be used to identify the stack in AWS.
# #   name = "ec2-instance-stack"

# #   # This is the CloudFormation template in YAML format embedded directly in the Terraform script.
# #   # It defines an EC2 instance and the properties it should have.
# #   template_body = <<-TEMPLATE
# #   Resources:
# #     EC2Instance:
# #       Type: "AWS::EC2::Instance"  # The resource type is an EC2 instance.
# #       Properties:
# #         InstanceType: "t3.micro"  # The type of EC2 instance to create (t3.micro is a small instance type).
# #         ImageId: "ami-0e35ddab05955cf57"  # The AMI (Amazon Machine Image) ID to use for the instance (Amazon Linux 2).
# #         Tags:
# #           - Key: "Name"  # Tag key is "Name", which is commonly used to name the EC2 instance.
# #             Value: "sample server"  # Tag value is "sample server", which will be the name of the EC2 instance.
# #   Outputs:
# #     InstanceId:
# #       Value: !Ref EC2Instance  # Refers to the EC2 instance created in the template, and its ID will be output.
# #       Description: "EC2 Instance ID"  # A description for the output, explaining that this is the EC2 instance ID.
# #   TEMPLATE

# #   # Deletion protection is omitted in this script because Terraform currently doesn't support it in the CloudFormation resource.
# # }

# # # This output block defines the value that will be displayed once the resources are created.
# # # It will output the EC2 instance ID from the CloudFormation stack.
# # output "instance_id" {
# #   value = aws_cloudformation_stack.ec2_instance_stack.outputs["InstanceId"]  # Fetches the InstanceId from the CloudFormation stack output.
# # }




# Instacne created Succefully after specifying all the details  using cloudfront 

# terraform {
#   required_providers {
#     aws = {
#       source = "hashicorp/aws"
#       version = "5.54.1"
#     }
#   }
# }

# provider "aws" {
#   region = "ap-south-1"  # Use your desired AWS region
# }

# # Generate a random suffix for the EC2 instance to ensure uniqueness
# resource "random_id" "unique" {
#   byte_length = 8
# }

# # Create the CloudFormation stack
# resource "aws_cloudformation_stack" "ec2_nginx_stack" {
#   name = "ec2-nginx-stack"

#   template_body = <<-TEMPLATE
#   AWSTemplateFormatVersion: "2010-09-09"
#   Resources:
#     EC2Instance:
#       Type: "AWS::EC2::Instance"
#       Properties:
#         InstanceType: "t2.micro"  # Adjust as needed
#         KeyName: "deep"  # Replace with your SSH key pair name
#         ImageId: "ami-0e35ddab05955cf57"  # Ubuntu 20.04 LTS AMI ID (replace with the correct one for your region)
#         SecurityGroups:
#           - !Ref InstanceSecurityGroup
#         UserData: !Base64 |
#           #!/bin/bash
#           apt-get update -y
#           apt-get install -y nginx
#           systemctl start nginx
#           systemctl enable nginx
#         AvailabilityZone: "ap-south-1a"  # Adjust to your preferred availability zone

#     InstanceSecurityGroup:
#       Type: "AWS::EC2::SecurityGroup"
#       Properties:
#         GroupDescription: "Allow SSH and HTTP traffic"
#         SecurityGroupIngress:
#           - IpProtocol: "tcp"
#             FromPort: "22"
#             ToPort: "22"
#             CidrIp: "0.0.0.0/0"  # Allow SSH from anywhere
#           - IpProtocol: "tcp"
#             FromPort: "80"
#             ToPort: "80"
#             CidrIp: "0.0.0.0/0"  # Allow HTTP from anywhere

#   Outputs:
#     InstancePublicIP:
#       Description: "Public IP of the EC2 instance"
#       Value: !GetAtt EC2Instance.PublicIp
#   TEMPLATE
# }

# # Output the public IP of the EC2 instance
# output "instance_public_ip" {
#   value = aws_cloudformation_stack.ec2_nginx_stack.outputs["InstancePublicIP"]
# }



#s3 bucket created succesfully 

#  provider "aws" {
#   region = "us-east-1"  # Change this to your desired AWS region
# }


# resource "aws_cloudformation_stack" "s3_bucket_stack" {
#   name = "s3-bucket-stack"

#   template_body = <<-EOF
#     Resources:
#       MyS3Bucket:
#         Type: "AWS::S3::Bucket"
#         Properties:
#           BucketName: "my-unique-bucket-name-${random_id.bucket_id.hex}"
#           AccessControl: "Private"
#   EOF

#   # Optionally, add parameters or other properties for CloudFormation stack
# }

# resource "random_id" "bucket_id" {
#   byte_length = 8
# }

# output "s3_bucket_name" {
#   value = "my-unique-bucket-name-${random_id.bucket_id.hex}"
# }
 

#the bucket we created above now we are adding the content inside the bucket index.html 
# provider "aws" {
#   region = "us-east-1"  # Change this to your desired AWS region
# }

# resource "random_id" "bucket_id" {
#   byte_length = 8
# }

# resource "aws_cloudformation_stack" "s3_bucket_stack" {
#   name = "s3-bucket-stack"

#   template_body = <<-EOF
#     Resources:
#       MyS3Bucket:
#         Type: "AWS::S3::Bucket"
#         Properties:
#           BucketName: "my-unique-bucket-name-${random_id.bucket_id.hex}"
#           AccessControl: "Private"
#   EOF
# }

# # Uploading index.html to the newly created bucket without ACL - working
# resource "aws_s3_object" "index_html" {
#   bucket = "my-unique-bucket-name-${random_id.bucket_id.hex}"
#   key    = "index.html"
#   source = "index.html"  # Path to the index.html file on your local machine

#   # Ensure the S3 object is only uploaded after the CloudFormation stack is created
#   depends_on = [aws_cloudformation_stack.s3_bucket_stack]
# }

# output "s3_bucket_name" {
#   value = "my-unique-bucket-name-${random_id.bucket_id.hex}"
# }






#working created an ec2 insntace using deployment manager in google cloud ,working succefully 

# provider "google" {
#   project = "manifest-zephyr-457115-v2"  # Your GCP Project ID
#   region  = "us-central1"                # Choose your preferred region
#   zone    = "us-central1-a"              # Choose your preferred zone
# }

# resource "google_deployment_manager_deployment" "vm_deployment" {
#   name = "my-vm-deployment"

#   // This template would be in your GCP project, or you can reference an external file.
#   // Here we're assuming you're using an existing template for the VM creation
#   target {
#     config {
#       content = <<-EOT
#         resources:
#           - name: my-vm
#             type: compute.v1.instance
#             properties:
#               zone: ${var.zone}
#               machineType: zones/${var.zone}/machineTypes/n1-standard-1
#               disks:
#                 - boot: true
#                   autoDelete: true
#                   initializeParams:
#                     sourceImage: "projects/debian-cloud/global/images/family/debian-12"
#               networkInterfaces:
#                 - network: global/networks/default
#                   accessConfigs:
#                     - name: External NAT
#                       type: ONE_TO_ONE_NAT
#       EOT
#     }
#   }
# }

# output "deployment_name" {
#   value = google_deployment_manager_deployment.vm_deployment.name
# }



#private VM has been created using 
# provider "google" {
#   project = "manifest-zephyr-457115-v2"  # Your GCP Project ID
#   region  = "us-central1"                # Choose your preferred region
#   zone    = "us-central1-a"              # Choose your preferred zone
# }

# resource "google_deployment_manager_deployment" "vm_deployment" {
#   name = "my-vm-deployment12"

#   target {
#     config {
#       content = <<-EOT
#         resources:
#           - name: my-private-vm
#             type: compute.v1.instance
#             properties:
#               zone: ${var.zone}
#               machineType: zones/${var.zone}/machineTypes/${var.machine_type}
#               disks:
#                 - boot: true
#                   autoDelete: true
#                   initializeParams:
#                     sourceImage: "projects/debian-cloud/global/images/family/debian-12"
#               networkInterfaces:
#                 - network: global/networks/default
#                   # No external IP (public IP), remove the accessConfigs block
#                   accessConfigs: []  # Empty array means no public IP
#       EOT
#     }
#   }
# }

# output "deployment_name" {
#   value = google_deployment_manager_deployment.vm_deployment.name
# }





# provider "google" {
#   project = "manifest-zephyr-457115-v2"  # Your GCP Project ID
#   region  = "us-central1"                # Choose your preferred region
#   zone    = "us-central1-a"              # Choose your preferred zone
# }

# resource "google_deployment_manager_deployment" "vm_deployment" {
#   name = "my-vm-deployment23124"

#   target {
#     config {
#       content = <<-EOT
#         resources:
#           - name: my-vm
#             type: compute.v1.instance
#             properties:
#               zone: ${var.zone}
#               machineType: zones/${var.zone}/machineTypes/${var.machine_type}
#               disks:
#                 - boot: true
#                   autoDelete: true
#                   initializeParams:
#                     sourceImage: "projects/debian-cloud/global/images/family/debian-12"  # Updated to Debian 12
#               networkInterfaces:
#                 - network: global/networks/default
#                   accessConfigs:
#                     - name: External NAT
#                       type: ONE_TO_ONE_NAT  # Public IP
#               metadata:
#                 items:
#                   - key: startup-script
#                     value: |
#                       #! /bin/bash
#                       apt-get update
#                       apt-get install -y nginx
#                       systemctl enable nginx
#                       systemctl start nginx
#                       echo "Welcome to Nginx on GCP!" > /var/www/html/index.html
#                       systemctl restart nginx
#       EOT
#     }
#   }
# }

# # Allow HTTP traffic on port 80 from the internet
# resource "google_compute_firewall" "allow_http" {
#   name    = "allow-http"
#   network = "default"

#   allow {
#     protocol = "tcp"
#     ports    = ["80"]
#   }

#   source_ranges = ["0.0.0.0/0"]  # Allow all sources (public access)
# }

# output "deployment_name" {
#   value = google_deployment_manager_deployment.vm_deployment.name
# }




#working
# created a bucket and store content inside it 
# provider "google" {
#   project = "manifest-zephyr-457115-v2"  # Your GCP Project ID
#   region  = "us-central1"                # Your preferred region
#   zone    = "us-central1-a"              # Your preferred zone
# }

# # Create a Cloud Storage bucket
# resource "google_storage_bucket" "my_bucket" {
#   name          = "my-static-website-bucket56431"  # Replace with your desired bucket name
#   location      = "US"
#   storage_class = "STANDARD"

#   # Enable Uniform bucket-level access (this disables ACL-based permissions)
#   uniform_bucket_level_access = true
# }

# # Upload the HTML file to the bucket using google_storage_bucket_object
# resource "google_storage_bucket_object" "html_file" {
#   name   = "index.html"
#   bucket = google_storage_bucket.my_bucket.name  # Reference the bucket created above
#   source = "index.html"  # Path to your local index.html file
#   content_type = "text/html"
# }

# output "bucket_name" {
#   value = google_storage_bucket.my_bucket.name
# }

# output "storage_url" {
#   value = "http://storage.googleapis.com/${google_storage_bucket.my_bucket.name}/index.html"
# }



#  azure resource manager
#  aws cloud formation 
#  gcp infrastrcure manager





provider "azurerm" {
  features {}

  # Subscription ID (provided by you)
  subscription_id = "6449dbeb-a056-4321-a82e-ce6acd3048ab"
}

# Define the resource group (demo-rg2)
resource "azurerm_resource_group" "example" {
  name     = "demo-rg2"
  location = "West US"  # Updated region where Ubuntu 22.04 Minimal LTS is available
}

# Define the virtual network for the VM
resource "azurerm_virtual_network" "example" {
  name                = "example-vnet"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.0.0.0/16"]
}

# Define the subnet within the virtual network
resource "azurerm_subnet" "example" {
  name                 = "example-subnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Define a public IP for the VM
resource "azurerm_public_ip" "example" {
  name                = "example-public-ip"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  allocation_method   = "Static"  # Static IP allocation for VM
  sku                  = "Standard"
}

# Define a network interface (NIC) for the VM
resource "azurerm_network_interface" "example" {
  name                = "example-nic"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.example.id
  }
}

# Define the Virtual Machine (VM)
resource "azurerm_linux_virtual_machine" "example" {
  name                            = "example-vm"
  resource_group_name             = azurerm_resource_group.example.name
  location                        = azurerm_resource_group.example.location
  size                            = "Standard_B1s"  # Adjust the VM size as needed
  admin_username                  = "adminuser"
  disable_password_authentication = true  # Disable password authentication (only SSH key will work)

  # Specify the SSH public key for authentication
  admin_ssh_key {
    username   = "adminuser"
    public_key = file("demo-rg.pub")  # Path to your public SSH key file (now in the same directory as main.tf)
  }

  network_interface_ids           = [azurerm_network_interface.example.id]  # Ensure the NIC is referenced here
  availability_set_id             = null

  # Specify the OS image (Ubuntu 22.04 Minimal LTS)
  os_disk {
    name                    = "example-os-disk"
    caching                 = "ReadWrite"
    storage_account_type    = "Standard_LRS"
  }

  # Corrected Image Reference for Ubuntu 22.04 Minimal LTS
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuMinimal"  # Use Ubuntu Minimal offer
    sku       = "22.04-LTS"      # Ubuntu 22.04 LTS
    version   = "latest"         # Use the latest available version of Ubuntu 22.04 Minimal LTS
  }
}

output "public_ip" {
  value = azurerm_public_ip.example.ip_address
}
