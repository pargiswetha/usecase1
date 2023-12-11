resource "google_logging_project_sink" "stackdrivers_logs_sink" {
  name        = var.stackdriver-name
  project     = "swetha-sceg"
  destination = "storage.googleapis.com/${var.destination}"
}
 








 
