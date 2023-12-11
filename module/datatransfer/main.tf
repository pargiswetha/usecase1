resource "google_bigquery_data_transfer_config" "logs_export" {
  project = var.project-name
  schedule       = var.schedule-name
  display_name   = var.display_name
   location      = var.location-name
  data_source_id = var.source-name
  destination_dataset_id = var.destination-name
  service_account_name   = var.account-name
 

  params = {
     data_path_template              = var.path-name
     destination_table_name_template = var.table-template-name
     file_format                     = var.file-format-name
    field_delimiter                 = var.delimiter-name
     max_bad_records                 = var.records-name
    ignore_unknown_values           = var.ignore-name
    allow_quoted_newlines           = var.allow-name
    delete_source_files             = var.delete-name
  }
 }
 

 




