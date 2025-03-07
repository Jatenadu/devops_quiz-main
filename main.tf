terraform { 
  required_providers { 
    docker = { 
      source  = "kreuzwerker/docker" 
      version = "3.0.2" 
    }
    null = {
      source  = "hashicorp/null"
      version = "3.2.3"
    } 
  } 
} 

provider "docker" {
  host = "unix:///Users/aphisitkludrung/.docker/run/docker.sock"
}


resource "null_resource" "execute_script" {
  provisioner "local-exec" {
    command = "sh ./script.sh"
  }
}


resource "docker_image" "my_app" {
  name = "node-web-app:latest"
  depends_on = [null_resource.execute_script]
}

resource "docker_container" "my_container" {
  name = "my-web-app"
  image = docker_image.my_app.name
  ports {
    internal = 3000
    external = 3000
  }
}