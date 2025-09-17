# Contenedores de las aplicaciones backend.
# Usan hashicorp/http-echo para responder con un mensaje sencillo.

resource "docker_container" "app1" {
  name  = "app1"
  image = "hashicorp/http-echo:0.2.3"

  networks_advanced {
    name = docker_network.labnet.name
  }

  ports {
    internal = 5670
    external = 5670
  }

  command = [
    "-text=Respuesta de app1",
    "-listen=:5670"
  ]
}

resource "docker_container" "app2" {
  name  = "app2"
  image = "hashicorp/http-echo:0.2.3"

  networks_advanced {
    name = docker_network.labnet.name
  }

  ports {
    internal = 5678
    external = 5678
  }

  command = [
    "-text=Respuesta de app2",
    "-listen=:5678"
  ]
}
