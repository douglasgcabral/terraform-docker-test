# main.tf
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_image" "redis" {
  name         = "redis:alpine"
  keep_locally = true
}

resource "docker_image" "mysql" {
  name         = "mysql:8.0"
  keep_locally = true
}

resource "docker_container" "nginx" {
  name  = "web-server"
  image = docker_image.nginx.image_id
  ports {
    internal = 80
    external = 8081
  }
}

resource "docker_container" "redis" {
  name  = "cache-server"
  image = docker_image.redis.image_id
  ports {
    internal = 6379
    external = 6379
  }
}

resource "docker_container" "mysql" {
  name  = "database-server"
  image = docker_image.mysql.image_id
  ports {
    internal = 3306
    external = 3306
  }
  env = [
    "MYSQL_ROOT_PASSWORD=senha123",
    "MYSQL_DATABASE=meubanco",
    "MYSQL_USER=usuario",
    "MYSQL_PASSWORD=senha123"
  ]
}

output "nginx_url" {
  value = "http://localhost:8081"
}

output "redis_url" {
  value = "redis://localhost:6379"
}

output "mysql_connection" {
  value = "mysql://usuario:senha123@localhost:3306/meubanco"
}
