resource "aws_instance" "this" {
  count         = var.instance_count
  ami           = "ami-0f8ca728008ff5af4"   # Example Ubuntu AMI in ap-south-1
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [var.security_group]

  tags = {
    Name = "app-instance-${count.index}"
  }
}

output "instance_ids" {
  value = aws_instance.this[*].id
}
