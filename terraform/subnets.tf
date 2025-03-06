resource "aws_subnet" "public-subnet-1" {
    vpc_id = aws_vpc.tc-vpc.id
    cidr_block = "172.0.0.0/24"
    availability_zone = "eu-west-2a"
    tags = {
      Name = "public-subnet-1"
    }
}

resource "aws_subnet" "public-subnet-2" {
    vpc_id = aws_vpc.tc-vpc.id
    cidr_block = "172.0.1.0/24"
    availability_zone = "eu-west-2b"
    tags = {
      Name = "public-subnet-2"
    }
}

resource "aws_subnet" "private-subnet-1" {
    vpc_id = aws_vpc.tc-vpc.id
    cidr_block = "172.0.2.0/24"
    availability_zone = "eu-west-2a"
    tags = {
      Name = "private-subnet-1"
    }
}

resource "aws_subnet" "private-subnet-2" {
    vpc_id = aws_vpc.tc-vpc.id
    cidr_block = "172.0.3.0/24"
    availability_zone = "eu-west-2b"
    tags = {
      Name = "private-subnet-2"
    }
}