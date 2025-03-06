resource "aws_vpc" "tc-vpc" {
    cidr_block = "172.0.0.0/16"
    tags = {
      Name = "threat-composer-vpc"
    }
}



