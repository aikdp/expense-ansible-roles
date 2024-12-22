resource "aws_instance" "ansible" {

    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.ansible.id]
    
    tags = {
         Name = "Ansible-server"
     }

    #For remote exec; need conection block
    connection {
        type     = "ssh"
        user     = "ec2-user"
        password = "DevOps321"
        host     = self.public_ip
    }

    provisioner "remote-exec" {
        inline = [
            "sudo dnf install ansible -y",
        ]
    }  
}

resource "aws_security_group" "ansible" {
    
    name = "ansible-allow-all-ports"
    description = "allow all traffic for ansible"


    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        }

    tags = {
        Name = "ansible-all-ports"
    }
}

