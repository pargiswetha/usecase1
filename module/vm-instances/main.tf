resource "google_compute_network" "sample-vpc" {
  name                    = var.vpc-name
  auto_create_subnetworks = var.auto-name

}

resource "google_compute_subnetwork" "sample-subnet3" {
  name          = var.subnet-name
  ip_cidr_range = var.range-name
  region        = var.region-name
  network       = google_compute_network.sample-vpc.name
}
 
 resource "google_compute_instance" "db-server" {
  name         = var.server-name
  machine_type = var.machine-name
  zone         = var.zone-name
  boot_disk {
    initialize_params {
      image = var.image-name
      size  = var.size-name
    }
  }
 
  network_interface {
    network = google_compute_network.sample-vpc.name
    subnetwork = google_compute_subnetwork.sample-subnet3.name
    access_config {
      
    }
  }
}


  

