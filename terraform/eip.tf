resource "aws_eip" "ngw-eip-1" {
    depends_on = [ aws_internet_gateway.IGW ]
}

resource "aws_eip" "ngw-eip-2" {
    depends_on = [ aws_internet_gateway.IGW ]
}