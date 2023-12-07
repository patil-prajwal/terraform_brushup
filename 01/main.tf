# Example for the "Provider" 
    # default value to region attribute for resources
provider "aws" {
  region = "ap-south-1"
  profile = "default"
}

# Example for the "Resource Block"
resource "aws_instance" "tf_created_vm" {
  instance_type = "t2.micro"
  availability_zone = "ap-south-1b"
  ami = "ami-007855ac798b5175e"
}


# Output block => Show attributes and its values of resources
output "publicIP" {
  value = aws_instance.tf_created_vm.public_ip
}
