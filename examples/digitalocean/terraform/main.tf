terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.11.1"
    }
  }
}

variable "do_token" {}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}

variable "region" {
  type    = string
  default = "fra1" # list available regions with `doctl compute region list`
}

variable "cluster_name" {
  type    = string
  default = "ethereum-kubernetes"
}

data "digitalocean_kubernetes_versions" "main" {
  version_prefix = "1.21.3" # list available options with `doctl kubernetes options versions`
}

resource "digitalocean_vpc" "main" {
  name     = format("%s-%s", var.cluster_name, var.region)
  region   = var.region
  ip_range = "10.100.0.0/16"
}

resource "digitalocean_kubernetes_cluster" "main" {
  name    = var.cluster_name
  region  = var.region
  version = data.digitalocean_kubernetes_versions.main.latest_version

  vpc_uuid = digitalocean_vpc.main.id

  tags = ["ethereum-kubernetes"]

  node_pool {
    name       = "default"
    size       = "s-8vcpu-16gb" # list available options with `doctl compute size list`
    auto_scale = false
    node_count = 2
    tags       = ["ethereum-kubernetes"]
  }

}
