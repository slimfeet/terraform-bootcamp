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
      + desired_capacity                 = 1
      + force_delete                     = false
      + force_delete_warm_pool           = false
      + health_check_grace_period        = 300
      + health_check_type                = "EC2"
      + id                               = (known after apply)
      + ignore_failed_scaling_activities = false
      + load_balancers                   = (known after apply)
      + max_size                         = 2
      + metrics_granularity              = "1Minute"
      + min_size                         = 1
      + name                             = (known after apply)
      + name_prefix                      = "web-server-group-"
      + predicted_capacity               = (known after apply)
      + protect_from_scale_in            = false
      + service_linked_role_arn          = (known after apply)
      + target_group_arns                = (known after apply)
      + vpc_zone_identifier              = (known after apply)
      + wait_for_capacity_timeout        = "10m"
      + warm_pool_size                   = (known after apply)

      + launch_template {
          + id      = (known after apply)
          + name    = (known after apply)
          + version = "$Latest"
        }

      + mixed_instances_policy (known after apply)

      + traffic_source (known after apply)
    }

  # aws_eip.eip will be created
  + resource "aws_eip" "eip" {
      + allocation_id        = (known after apply)
      + arn                  = (known after apply)
      + association_id       = (known after apply)
      + carrier_ip           = (known after apply)
      + customer_owned_ip    = (known after apply)
      + domain               = (known after apply)
      + id                   = (known after apply)
      + instance             = (known after apply)
      + network_border_group = (known after apply)
      + network_interface    = (known after apply)
      + private_dns          = (known after apply)
      + private_ip           = (known after apply)
      + ptr_record           = (known after apply)
      + public_dns           = (known after apply)
      + public_ip            = (known after apply)
      + public_ipv4_pool     = (known after apply)
      + tags                 = {
          + "Name" = "nat_gateway_eip"
        }
      + tags_all             = {
          + "Name" = "nat_gateway_eip"
        }
      + vpc                  = (known after apply)
    }

  # aws_iam_instance_profile.server_profile will be created
  + resource "aws_iam_instance_profile" "server_profile" {
      + arn         = (known after apply)
      + create_date = (known after apply)
      + id          = (known after apply)
      + name        = "server_profile"
      + name_prefix = (known after apply)
      + path        = "/"
      + role        = "bootcamp_server_role"
      + tags_all    = (known after apply)
      + unique_id   = (known after apply)
    }

  # aws_iam_role.server_role will be created
  + resource "aws_iam_role" "server_role" {
      + arn                   = (known after apply)
      + assume_role_policy    = jsonencode(
            {
              + Statement = [
                  + {
                      + Action    = "sts:AssumeRole"
                      + Effect    = "Allow"
                      + Principal = {
                          + Service = "ec2.amazonaws.com"
                        }
                      + Sid       = ""
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + managed_policy_arns   = (known after apply)
      + max_session_duration  = 3600
      + name                  = "bootcamp_server_role"
      + name_prefix           = (known after apply)
      + path                  = "/"
      + tags                  = {
          + "Name"  = "server_role"
          + "Owner" = "bootcamp"
        }
      + tags_all              = {
          + "Name"  = "server_role"
          + "Owner" = "bootcamp"
        }
      + unique_id             = (known after apply)

      + inline_policy (known after apply)
    }

  # aws_iam_role_policy_attachment.attach will be created
  + resource "aws_iam_role_policy_attachment" "attach" {
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"    
      + role       = "bootcamp_server_role"
    }

  # aws_instance.app-server will be created
  + resource "aws_instance" "app-server" {
      + ami                                  = "ami-0ae8f15ae66fe8cda"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = "server_profile"
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t3.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = "skillec2"
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Name" = "app-server"
        }
      + tags_all                             = {
          + "Name" = "app-server"
        }
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)

      + capacity_reservation_specification (known after apply)

      + cpu_options (known after apply)

      + ebs_block_device (known after apply)

      + enclave_options (known after apply)

      + ephemeral_block_device (known after apply)

      + instance_market_options (known after apply)

      + maintenance_options (known after apply)

      + metadata_options (known after apply)

      + network_interface (known after apply)

      + private_dns_name_options (known after apply)

      + root_block_device {
          + delete_on_termination = false
          + device_name           = (known after apply)
          + encrypted             = true
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + tags_all              = (known after apply)
          + throughput            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = 20
          + volume_type           = "gp3"
        }
    }

  # aws_instance.web-server will be created
  + resource "aws_instance" "web-server" {
      + ami                                  = "ami-0ae8f15ae66fe8cda"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = "server_profile"
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t3.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = "skillec2"
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Name" = "web-server"
        }
      + tags_all                             = {
          + "Name" = "web-server"
        }
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)

      + capacity_reservation_specification (known after apply)

      + cpu_options (known after apply)

      + ebs_block_device (known after apply)

      + enclave_options (known after apply)

      + ephemeral_block_device (known after apply)

      + instance_market_options (known after apply)

      + maintenance_options (known after apply)

      + metadata_options (known after apply)

      + network_interface (known after apply)

      + private_dns_name_options (known after apply)

      + root_block_device {
          + delete_on_termination = false
          + device_name           = (known after apply)
          + encrypted             = true
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + tags_all              = (known after apply)
          + throughput            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = 20
          + volume_type           = "gp3"
        }
    }

  # aws_internet_gateway.internet_gateway will be created
  + resource "aws_internet_gateway" "internet_gateway" {
      + arn      = (known after apply)
      + id       = (known after apply)
      + owner_id = (known after apply)
      + tags     = {
          + "Name" = "internet_gateway"
        }
      + tags_all = {
          + "Name" = "internet_gateway"
        }
      + vpc_id   = (known after apply)
    }

  # aws_launch_template.app_server_temp will be created
  + resource "aws_launch_template" "app_server_temp" {
      + arn                    = (known after apply)
      + default_version        = (known after apply)
      + id                     = (known after apply)
      + image_id               = "ami-0ae8f15ae66fe8cda"
      + instance_type          = "t3.micro"
      + key_name               = "skillec2"
      + latest_version         = (known after apply)
      + name                   = (known after apply)
      + name_prefix            = "web-server-template-"
      + tags_all               = (known after apply)
      + vpc_security_group_ids = (known after apply)

      + iam_instance_profile {
          + name = "server_profile"
        }

      + metadata_options (known after apply)

      + tag_specifications {
          + resource_type = "instance"
          + tags          = {
              + "Name" = "app-server"
            }
        }
    }

  # aws_launch_template.web_server_template will be created
  + resource "aws_launch_template" "web_server_template" {
      + arn                    = (known after apply)
      + default_version        = (known after apply)
      + id                     = (known after apply)
      + image_id               = "ami-0ae8f15ae66fe8cda"
      + instance_type          = "t3.micro"
      + key_name               = "skillec2"
      + latest_version         = (known after apply)
      + name                   = (known after apply)
      + name_prefix            = "web-server-template-"
      + tags_all               = (known after apply)
      + vpc_security_group_ids = (known after apply)

      + block_device_mappings {
          + device_name = "/dev/sda1"

          + ebs {
              + delete_on_termination = "false"
              + encrypted             = "true"
              + iops                  = (known after apply)
              + throughput            = (known after apply)
              + volume_size           = 20
              + volume_type           = "gp3"
            }
        }

      + iam_instance_profile {
          + name = "server_profile"
        }

      + metadata_options (known after apply)

      + tag_specifications {
          + resource_type = "instance"
          + tags          = {
              + "Name" = "web-server"
            }
        }
    }

  # aws_nat_gateway.nat_a will be created
  + resource "aws_nat_gateway" "nat_a" {
      + allocation_id                      = (known after apply)
      + association_id                     = (known after apply)
      + connectivity_type                  = "public"
      + id                                 = (known after apply)
      + network_interface_id               = (known after apply)
      + private_ip                         = (known after apply)
      + public_ip                          = (known after apply)
      + secondary_private_ip_address_count = (known after apply)
      + secondary_private_ip_addresses     = (known after apply)
      + subnet_id                          = (known after apply)
      + tags                               = {
          + "Name" = "nat_gateway"
        }
      + tags_all                           = {
          + "Name" = "nat_gateway"
        }
    }

  # aws_network_acl.app_private_nacl will be created
  + resource "aws_network_acl" "app_private_nacl" {
      + arn        = (known after apply)
      + egress     = [
          + {
              + action          = "allow"
              + cidr_block      = "0.0.0.0/0"
              + from_port       = 0
              + protocol        = "-1"
              + rule_no         = 100
              + to_port         = 0
                # (1 unchanged attribute hidden)
            },
        ]
      + id         = (known after apply)
      + ingress    = [
          + {
              + action          = "allow"
              + cidr_block      = "0.0.0.0/0"
              + from_port       = 0
              + protocol        = "-1"
              + rule_no         = 100
              + to_port         = 0
                # (1 unchanged attribute hidden)
            },
        ]
      + owner_id   = (known after apply)
      + subnet_ids = (known after apply)
      + tags       = {
          + "Name" = "bootcamp-app-private-nacl"
        }
      + tags_all   = {
          + "Name" = "bootcamp-app-private-nacl"
        }
      + vpc_id     = (known after apply)
    }

  # aws_network_acl.bastion-public-nacl will be created
  + resource "aws_network_acl" "bastion-public-nacl" {
      + arn        = (known after apply)
      + egress     = [
          + {
              + action          = "allow"
              + cidr_block      = "0.0.0.0/0"
              + from_port       = 0
              + protocol        = "-1"
              + rule_no         = 100
              + to_port         = 0
                # (1 unchanged attribute hidden)
            },
        ]
      + id         = (known after apply)
      + ingress    = [
          + {
              + action          = "allow"
              + cidr_block      = "0.0.0.0/0"
              + from_port       = 0
              + protocol        = "-1"
              + rule_no         = 100
              + to_port         = 0
                # (1 unchanged attribute hidden)
            },
        ]
      + owner_id   = (known after apply)
      + subnet_ids = (known after apply)
      + tags       = {
          + "Name" = "bootcamp-bastion-public-nacl"
        }
      + tags_all   = {
          + "Name" = "bootcamp-bastion-public-nacl"
        }
      + vpc_id     = (known after apply)
    }

  # aws_network_acl.nacl_public will be created
  + resource "aws_network_acl" "nacl_public" {
      + arn        = (known after apply)
      + egress     = [
          + {
              + action          = "allow"
              + cidr_block      = "0.0.0.0/0"
              + from_port       = 0
              + protocol        = "-1"
              + rule_no         = 100
              + to_port         = 0
                # (1 unchanged attribute hidden)
            },
        ]
      + id         = (known after apply)
      + ingress    = [
          + {
              + action          = "allow"
              + cidr_block      = "0.0.0.0/0"
              + from_port       = 0
              + protocol        = "-1"
              + rule_no         = 100
              + to_port         = 0
                # (1 unchanged attribute hidden)
            },
        ]
      + owner_id   = (known after apply)
      + subnet_ids = (known after apply)
      + tags       = {
          + "Name" = "bootcamp-public-nacl"
        }
      + tags_all   = {
          + "Name" = "bootcamp-public-nacl"
        }
      + vpc_id     = (known after apply)
    }

  # aws_network_acl.web_private_nacl will be created
  + resource "aws_network_acl" "web_private_nacl" {
      + arn        = (known after apply)
      + egress     = [
          + {
              + action          = "allow"
              + cidr_block      = "0.0.0.0/0"
              + from_port       = 0
              + protocol        = "-1"
              + rule_no         = 100
              + to_port         = 0
                # (1 unchanged attribute hidden)
            },
        ]
      + id         = (known after apply)
      + ingress    = [
          + {
              + action          = "allow"
              + cidr_block      = "0.0.0.0/0"
              + from_port       = 0
              + protocol        = "-1"
              + rule_no         = 100
              + to_port         = 0
                # (1 unchanged attribute hidden)
            },
        ]
      + owner_id   = (known after apply)
      + subnet_ids = (known after apply)
      + tags       = {
          + "Name" = "bootcamp-web-private-nacl"
        }
      + tags_all   = {
          + "Name" = "bootcamp-web-private-nacl"
        }
      + vpc_id     = (known after apply)
    }

  # aws_route_table.app-private-route-table will be created
  + resource "aws_route_table" "app-private-route-table" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = [
          + {
              + cidr_block                 = "0.0.0.0/0"
              + nat_gateway_id             = (known after apply)
                # (11 unchanged attributes hidden)
            },
        ]
      + tags             = {
          + "Name" = "bootcamp-app-private-route-table"
        }
      + tags_all         = {
          + "Name" = "bootcamp-app-private-route-table"
        }
      + vpc_id           = (known after apply)
    }

  # aws_route_table.bastion-public-route-table will be created
  + resource "aws_route_table" "bastion-public-route-table" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = [
          + {
              + cidr_block                 = "0.0.0.0/0"
              + gateway_id                 = (known after apply)
                # (11 unchanged attributes hidden)
            },
        ]
      + tags             = {
          + "Name" = "bootcamp-bastion-public-route-table"
        }
      + tags_all         = {
          + "Name" = "bootcamp-bastion-public-route-table"
        }
      + vpc_id           = (known after apply)
    }

  # aws_route_table.public-route-table will be created
  + resource "aws_route_table" "public-route-table" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = [
          + {
              + cidr_block                 = "0.0.0.0/0"
              + gateway_id                 = (known after apply)
                # (11 unchanged attributes hidden)
            },
        ]
      + tags             = {
          + "Name" = "bootcamp-public-route-table"
        }
      + tags_all         = {
          + "Name" = "bootcamp-public-route-table"
        }
      + vpc_id           = (known after apply)
    }

  # aws_route_table.web-private-route-table will be created
  + resource "aws_route_table" "web-private-route-table" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = [
          + {
              + cidr_block                 = "0.0.0.0/0"
              + nat_gateway_id             = (known after apply)
                # (11 unchanged attributes hidden)
            },
        ]
      + tags             = {
          + "Name" = "bootcamp-web-private-route-table"
        }
      + tags_all         = {
          + "Name" = "bootcamp-web-private-route-table"
        }
      + vpc_id           = (known after apply)
    }

  # aws_route_table_association.app-private-subnet-a will be created
  + resource "aws_route_table_association" "app-private-subnet-a" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_route_table_association.app-private-subnet-b will be created
  + resource "aws_route_table_association" "app-private-subnet-b" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_route_table_association.bastion-subnet-a will be created
  + resource "aws_route_table_association" "bastion-subnet-a" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_route_table_association.public-subnet_a will be created
  + resource "aws_route_table_association" "public-subnet_a" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_route_table_association.web-private-subnet-a will be created
  + resource "aws_route_table_association" "web-private-subnet-a" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_route_table_association.web-private-subnet-b will be created
  + resource "aws_route_table_association" "web-private-subnet-b" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_security_group.bastion-security-group will be created
  + resource "aws_security_group" "bastion-security-group" {
      + arn                    = (known after apply)
      + description            = "Allowing Inbound Traffic"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = "Allowing All Traffic Outbound"
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = "Allowing port 22 Inbound"
              + from_port        = 22
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 22
            },
        ]
      + name                   = "bootcamp-bastion-public-security-group"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name" = "bastion-public-security-group"
        }
      + tags_all               = {
          + "Name" = "bastion-public-security-group"
        }
      + vpc_id                 = (known after apply)
    }

  # aws_security_group.web-app-security-group will be created
  + resource "aws_security_group" "web-app-security-group" {
      + arn                    = (known after apply)
      + description            = "Allowing Web and App Traffic"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = "Allowing All Traffic Outbound"
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = "Allowing port 22 Inbound"
              + from_port        = 22
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 22
            },
          + {
              + cidr_blocks      = []
              + description      = "Allowing port 443 Inbound"
              + from_port        = 443
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = (known after apply)
              + self             = false
              + to_port          = 443
            },
          + {
              + cidr_blocks      = []
              + description      = "Allowing port 80 Inbound"
              + from_port        = 80
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = (known after apply)
              + self             = false
              + to_port          = 80
            },
        ]
      + name                   = "bootcamp-web-app-private-security-group"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name" = "bootcamp-web-private-security-group"
        }
      + tags_all               = {
          + "Name" = "bootcamp-web-private-security-group"
        }
      + vpc_id                 = (known after apply)
    }

  # aws_security_group.web-elb-security-group will be created
  + resource "aws_security_group" "web-elb-security-group" {
      + arn                    = (known after apply)
      + description            = "Allowing Web Traffic"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = "Allowing All Traffic Outbound"
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = "Allowing port 443 Inbound"
              + from_port        = 443
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 443
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = "Allowing port 80 Inbound"
              + from_port        = 80
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 80
            },
        ]
      + name                   = "bootcamp-web-elb-public-security-group"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name" = "bootcamp-web-elb-public-security-group"
        }
      + tags_all               = {
          + "Name" = "bootcamp-web-elb-public-security-group"
        }
      + vpc_id                 = (known after apply)
    }

  # aws_subnet.app-private-a will be created
  + resource "aws_subnet" "app-private-a" {
      + arn                                            = (known after apply)       
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1a"
      + availability_zone_id                           = (known after apply)       
      + cidr_block                                     = "10.0.3.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)       
      + ipv6_cidr_block_association_id                 = (known after apply)       
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)       
      + private_dns_hostname_type_on_launch            = (known after apply)       
      + tags                                           = {
          + "Name" = "bootcamp-app-private-subnetA"
        }
      + tags_all                                       = {
          + "Name" = "bootcamp-app-private-subnetA"
        }
      + vpc_id                                         = (known after apply)       
    }

  # aws_subnet.app-private-b will be created
  + resource "aws_subnet" "app-private-b" {
      + arn                                            = (known after apply)       
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1a"
      + availability_zone_id                           = (known after apply)       
      + cidr_block                                     = "10.0.4.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)       
      + ipv6_cidr_block_association_id                 = (known after apply)       
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)       
      + private_dns_hostname_type_on_launch            = (known after apply)       
      + tags                                           = {
          + "Name" = "bootcamp-app-private-subnetB"
        }
      + tags_all                                       = {
          + "Name" = "bootcamp-app-private-subnetB"
        }
      + vpc_id                                         = (known after apply)       
    }

  # aws_subnet.bastion-public-a will be created
  + resource "aws_subnet" "bastion-public-a" {
      + arn                                            = (known after apply)       
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1b"
      + availability_zone_id                           = (known after apply)       
      + cidr_block                                     = "10.0.7.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)       
      + ipv6_cidr_block_association_id                 = (known after apply)       
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = true
      + owner_id                                       = (known after apply)       
      + private_dns_hostname_type_on_launch            = (known after apply)       
      + tags                                           = {
          + "Name" = "bootcamp-bastion-public-subnetA"
        }
      + tags_all                                       = {
          + "Name" = "bootcamp-bastion-public-subnetA"
        }
      + vpc_id                                         = (known after apply)       
    }

  # aws_subnet.public-a will be created
  + resource "aws_subnet" "public-a" {
      + arn                                            = (known after apply)       
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1a"
      + availability_zone_id                           = (known after apply)       
      + cidr_block                                     = "10.0.0.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)       
      + ipv6_cidr_block_association_id                 = (known after apply)       
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = true
      + owner_id                                       = (known after apply)       
      + private_dns_hostname_type_on_launch            = (known after apply)       
      + tags                                           = {
          + "Name" = "bootcamp-public-subnetA"
        }
      + tags_all                                       = {
          + "Name" = "bootcamp-public-subnetA"
        }
      + vpc_id                                         = (known after apply)       
    }

  # aws_subnet.web-private-a will be created
  + resource "aws_subnet" "web-private-a" {
      + arn                                            = (known after apply)       
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1a"
      + availability_zone_id                           = (known after apply)       
      + cidr_block                                     = "10.0.1.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)       
      + ipv6_cidr_block_association_id                 = (known after apply)       
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)       
      + private_dns_hostname_type_on_launch            = (known after apply)       
      + tags                                           = {
          + "Name" = "bootcamp-web-private-subnetA"
        }
      + tags_all                                       = {
          + "Name" = "bootcamp-web-private-subnetA"
        }
      + vpc_id                                         = (known after apply)       
    }

  # aws_subnet.web-private-b will be created
  + resource "aws_subnet" "web-private-b" {
      + arn                                            = (known after apply)       
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1b"
      + availability_zone_id                           = (known after apply)       
      + cidr_block                                     = "10.0.2.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)       
      + ipv6_cidr_block_association_id                 = (known after apply)       
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)       
      + private_dns_hostname_type_on_launch            = (known after apply)       
      + tags                                           = {
          + "Name" = "bootcamp-web-private-subnetB"
        }
      + tags_all                                       = {
          + "Name" = "bootcamp-web-private-subnetB"
        }
      + vpc_id                                         = (known after apply)       
    }

  # aws_vpc.vpc will be created
  + resource "aws_vpc" "vpc" {
      + arn                                  = (known after apply)
      + cidr_block                           = "10.0.0.0/16"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_dns_hostnames                 = true
      + enable_dns_support                   = true
      + enable_network_address_usage_metrics = (known after apply)
      + id                                   = (known after apply)
      + instance_tenancy                     = "default"
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + tags                                 = {
          + "Name" = "bootcamp_vpc"
        }
      + tags_all                             = {
          + "Name" = "bootcamp_vpc"
        }
    }

Plan: 36 to add, 0 to change, 0 to destroy.
![Snapshot](planoutput.png)
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