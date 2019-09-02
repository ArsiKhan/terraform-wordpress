resource "aws_vpc" "main_vpc" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true

    tags {
        Name = "terraform-aws-vpc"
    }
}

resource "aws_eip" "web-1" {
    instance = "${aws_instance.web-1.id}"
    vpc = true
}

resource "aws_route_table" "us-east-1a-public" {
    vpc_id = "${aws_vpc.main_vpc.id}"
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.ig-main.id}"
    }

    tags {
        Name = "Public Subnet"
    }
}

resource "aws_route_table_association" "us-east-1a-public" {
    subnet_id = "${aws_subnet.us-east-1a-public.id}"
    route_table_id = "${aws_route_table.us-east-1a-public.id}"
}
