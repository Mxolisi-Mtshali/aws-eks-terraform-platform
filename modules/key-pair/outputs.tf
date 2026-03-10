output "key_name" {
  description = "Created AWS key pair name"
  value       = aws_key_pair.this.key_name
}