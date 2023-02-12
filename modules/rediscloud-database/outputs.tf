output "database_private_endpoint" {
  description = "Output private endpoint"
  sensitive = true
  value = rediscloud_subscription_database.rediscloud-database.private_endpoint
}

output "database_password" {
  description = "Output password"
  sensitive = true
  value = rediscloud_subscription_database.rediscloud-database.password
}

