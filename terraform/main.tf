# terraformの設定
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.4.0"
    }
  }
}

# terraformで利用するプロバイダーの設定
provider "google" {
  credentials = file("/home/yshida/.config/gcloud/application_default_credentials.json") 
  #クレデンシャルファイルを利用の場合

  project = "my-project-minimum-api"
  region  = "us-west1-a"
}

resource "google_service_account" "default" {
  account_id   = "my-service-account"
  display_name = "minimum Instance Service Account"
}

resource "google_compute_instance" "default" {
  name         = "minimum-instance"
  machine_type = "e2-micro"
  zone         = "us-west1-a"

  tags = ["minimum"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  service_account {
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  }

}