terraform {
  backend "gcs" {
    bucket      = "tf-state-adeolutee"
    prefix      = "state"
    credentials = file("credentials.json")
  }
}
