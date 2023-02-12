terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.47.0"
    }
    rediscloud = {
      source = "RedisLabs/rediscloud"
      version = "1.0.1"
    }
  }
}