
resource "google_bigquery_dataset" "dataset1" {
  dataset_id                  = var.dataset-name
  location                    = var.location-name
  }

  resource "google_bigquery_table" "my_table1" {
    dataset_id =  google_bigquery_dataset.dataset1.dataset_id
    table_id   =  var.table-name

    schema     = <<EOF
   [ 
    {
      "name": "sno",
      "type": "INTEGER",
      "mode": "NULLABLE"
    },
    {
      "name": "name",
      "type": "STRING",
      "mode": "NULLABLE"
    }
   ] 
EOF

}

