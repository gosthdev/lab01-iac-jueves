resource "docker_network" "lab_network" {
  name = "lab-network-${terraform.workspace}"
}

resource "docker_container" "api" {
  name = "api-${terraform.workspace}"
  image = "lab/api"

  ports {
    internal = 3000
    external = var.api_port[terraform.workspace]
  }

  networks_advanced {
    name    = docker_network.lab_network.name
    aliases = ["api"]
  }

  depends_on = [docker_container.db]
}

resource "docker_container" "web" {
  name = "web-${terraform.workspace}"
  image = "lab/web"

  ports {
    internal = 80
    external = var.web_port[terraform.workspace]
  }

  networks_advanced {
    name    = docker_network.lab_network.name
    aliases = ["web"]
  }

  depends_on = [docker_container.api]
}

resource "docker_container" "db" {
  name = "db-${terraform.workspace}"
  image = "lab/db"

  ports {
    internal = 5432
    external = var.db_port[terraform.workspace]
  }

  networks_advanced {
    name    = docker_network.lab_network.name
    aliases = ["db"]
  }
}