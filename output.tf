output "ec2_public_ip" {
    description = "public ip of the docker_tf__server"
    value = aws_instance.docker_server.public_ip
}