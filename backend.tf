terraform {
  backend "gcs" {
    bucket      = "tf-state-adeolutee"
    prefix      = "state"
    credentials = "credentials.json"
  }
}
