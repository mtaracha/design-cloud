resource "aws_instance" "test_node" {
    ami           = "ami-3e713f4d"
    count         = 1
    instance_type = "t2.micro"
    key_name      = "DevSSH"
    subnet_id     = "${var.app_subnet_id}"
    vpc_security_group_ids = ["${aws_security_group.allow_admin_sg.id}"]
    associate_public_ip_address = "false"
    user_data     = "${file("${path.module}/bin/user_data_node.sh")}"

    tags {
        Name = "test_node.home.co.uk"
    }
}
