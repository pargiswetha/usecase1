terraform {
  required_providers {
    google = {
        source = "hashicorp/google"
        version = "5.4.0"
    }
  }
}

provider "google" {
    project = "swetha-sceg"
  credentials = file("key.json")
}

module "vm-instances" {
    source = "./module/vm-instances"
    vpc-name = var.virtual-name
    auto-name = var.automate-name
    subnet-name = var.subnetwork-name
    range-name = var.range-ip-name
    region-name = var.reg-name
    server-name = var.servers-name
    machine-name = var.mach-name
    zone-name = var.zonal-name
    image-name = var.debain-name
    size-name = var.boot-name

}
module "bigquery"{
    source = "./module/biquery"
    dataset-name = var.data-name
    location-name = var.region-name
    table-name = var.table-id-name
    
}
module "gcs" {
    source = "./module/gcs"
    bucket-name = var.buck-name
    bucket-location = var.location-name
    bucket-class = var.class-name
    
}
module "stack-driver" {
    source = "./module/stack-driver"
    stackdriver-name = var.stack-name
    destination = module.gcs.bucket-name

} 
    
module "datatransfer" {
    source = "./module/datatransfer"
    project-name = var.projecting-name
    schedule-name = var.scheduling-name
    display_name = var.displaying-name
    location-name = var.locating-name
    source-name = var.sourc-name
    destination-name = module.bigquery.big_query
    account-name = var.accounting-name
    path-name = var.pathing-name
    table-template-name = var.table-name
    file-format-name = var.file-name
    delimiter-name = var.delimi-name
    records-name = var.record-name
    ignore-name = var.ignoring-name
    allow-name = var.allowing-name
    delete-name = var.deleting-name   
}