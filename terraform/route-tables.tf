resource "aws_route_table" "public-rt" {
    vpc_id = aws_vpc.tc-vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.IGW.id
    }
    tags = {
        Name = "public-route-table"
    }
}

resource "aws_route_table_association" "public-rt-association-1" {
    subnet_id = aws_subnet.public-subnet-1.id
    route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "public-rt-association-2" {
    subnet_id = aws_subnet.public-subnet-2.id
    route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table" "private-rt-1" {
    vpc_id = aws_vpc.tc-vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.ngw-1.id
    }
    tags = {
        Name = "private-route-table-1"
    }
}

resource "aws_route_table" "private-rt-2" {
    vpc_id = aws_vpc.tc-vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.ngw-2.id
    }
    tags = {
        Name = "private-route-table-2"
    }
}

resource "aws_route_table_association" "private-rt-association-1" {
    subnet_id = aws_subnet.private-subnet-1.id
    route_table_id = aws_route_table.private-rt-1.id
}

resource "aws_route_table_association" "private-rt-association-2" {
    subnet_id = aws_subnet.private-subnet-2.id
    route_table_id = aws_route_table.private-rt-2.id
}