resource "aws_nat_gateway" "ngw-1" {
    allocation_id = aws_eip.ngw-eip-1.id
    subnet_id = aws_subnet.public-subnet-1.id
    tags = {
      Name = "tc-ngw-1"
    }
}

resource "aws_nat_gateway" "ngw-2" {
    allocation_id = aws_eip.ngw-eip-2.id
    subnet_id = aws_subnet.public-subnet-2.id
    tags = {
      Name = "tc-ngw-2"
    }
}