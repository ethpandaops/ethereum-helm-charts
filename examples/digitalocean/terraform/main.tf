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
  version_prefix = "1.21.5" # list available options with `doctl kubernetes options versions`
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
    size       = "s-4vcpu-8gb-amd" # list available options with `doctl compute size list`
    labels = {
      priority  = "high"
      service   = "default"
    }
    auto_scale = true
    min_nodes  = 2
    max_nodes  = 2
    tags       = ["ethereum-kubernetes"]
  }

}

# Dedicated pool of nodes for ethereum clients
resource "digitalocean_kubernetes_node_pool" "clients" {
  cluster_id = digitalocean_kubernetes_cluster.main.id
  name       = "clients"
  size       = "s-4vcpu-8gb-amd" # $48/month
  auto_scale = true
  min_nodes  = 10
  max_nodes  = 10
  tags       = ["ethereum-kubernetes", "ethereum-kubernetes-clients"]

  labels = {
    dedicated  = "clients"
  }
  taint {
    key    = "dedicated"
    value  = "clients"
    effect = "NoSchedule"
  }
}

# Dedicated pool of nodes for the beacon explorer
resource "digitalocean_kubernetes_node_pool" "beaconexplorer" {
  cluster_id = digitalocean_kubernetes_cluster.main.id
  name       = "beaconexplorer"
  size       = "so1_5-2vcpu-16gb" # $125/month
  node_count = 1
  tags       = ["ethereum-kubernetes", "ethereum-kubernetes-beaconexplorer"]

  labels = {
    dedicated  = "beaconexplorer"
  }
  taint {
    key    = "dedicated"
    value  = "beaconexplorer"
    effect = "NoSchedule"
  }
}

# Dedicated pool of nodes for the blockscout explorer
resource "digitalocean_kubernetes_node_pool" "blockscout" {
  cluster_id = digitalocean_kubernetes_cluster.main.id
  name       = "blockscout"
  size       = "so1_5-2vcpu-16gb" # $125/month
  node_count = 1
  tags       = ["ethereum-kubernetes", "ethereum-kubernetes-blockscout"]

  labels = {
    dedicated  = "blockscout"
  }
  taint {
    key    = "dedicated"
    value  = "blockscout"
    effect = "NoSchedule"
  }
}

# Dedicated pool of nodes for prometheus
resource "digitalocean_kubernetes_node_pool" "prometheus" {
  cluster_id = digitalocean_kubernetes_cluster.main.id
  name       = "prometheus"
  size       = "m3-4vcpu-32gb" # $195/month
  node_count = 1
  tags       = ["ethereum-kubernetes", "ethereum-kubernetes-prometheus"]

  labels = {
    dedicated  = "prometheus"
  }
  taint {
    key    = "dedicated"
    value  = "prometheus"
    effect = "NoSchedule"
  }
}
