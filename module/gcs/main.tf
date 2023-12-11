
resource "google_storage_bucket" "storage_bucket" {
  name = var.bucket-name
  location= var.bucket-location
  storage_class= var.bucket-class
}





