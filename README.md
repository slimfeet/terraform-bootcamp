# terraform-bootcamp
# Project Overview
This project is aimed at creating a web and app server in an autoscaling group. The instances will be hosted on aws inside a VPC with a well defined NAT gateway, NACL, routetables, Security Groups, and subnets.
# Pre-requisites
Terraform
VScode
Git bash
AWS CLI 
# Setup Instructions
1. Update the Debian package
sudo apt-get update
2. Install the required dependencies
sudo apt-get install -y software-properties-common
3. Add the hashicopr GPG Key
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
4. Add HashiCorp Repository
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
5. Update Debian package for a second time
sudo apt-get update
6. Install Terraform
sudo apt-get install -y terraform
7. Verify Terraform installation
terraform --version
# Screenshots for Terraform plan output
![Snapshot](C:\Users\welcome\Documents\Terraform\terraform-bootcamp\applyoutput.PNG)
# Terraform apply out
![Snapshot](applyoutput.png)
# AWS Console pictures of the resources
![Snapshot](autoscalinggroups.png)
![Snapshot](elasticupaddress.png)
![Snapshot](internetgateway.png)
![Snapshot](networkacl.png)
![Snapshot](routetable.png)
![Snapshot](securitygroup.png)
![Snapshot](serverrole.png)
![Snapshot](subnets.png)
![Snapshot](vpc.png)
![Snapshot](webappinstances.png)
# Clean instruction
1. Write terraform command to destroy the resources
terraform destroy