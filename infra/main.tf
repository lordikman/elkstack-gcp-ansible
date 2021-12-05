provider "google" {
 credentials = file("KEY.json")
 project     = "INSERT_PROJECT"
 region      = "europe-west1-b"
}

// Terraform plugin for creating random ids
resource "random_id" "instance_id" {
 byte_length = 8
}


resource "google_compute_instance" "elastic" {
 name         = "elsatic-vm-${random_id.instance_id.hex}-${count.index}"
 count        = "3"
 machine_type = "e2-medium"
 zone         = "europe-west1-b"

 boot_disk {
   initialize_params {
     image = "centos-cloud/centos-7"
   }
 }


 metadata_startup_script = "sudo apt-get update"

 metadata = {
    ssh-keys = "ENTER LOGIN:SSHKEY"
 }

 network_interface {
   network = "default"

   access_config {
     
   }
 }
}

resource "google_compute_instance" "logstash" {
 name         = "logstash-vm-${random_id.instance_id.hex}"
 count        = "1"
 machine_type = "e2-medium"
 zone         = "europe-west1-b"

 boot_disk {
   initialize_params {
     image = "centos-cloud/centos-7"
   }
 }

 metadata_startup_script = "sudo apt-get update"

 metadata = {
    ssh-keys = "ENTER LOGIN:SSHKEY"
 }

 network_interface {
   network = "default"

   access_config {
     
   }
 }
}

resource "google_compute_instance" "kibana" {
 name         = "kibana-vm-${random_id.instance_id.hex}"
 count        = "1"
 machine_type = "e2-medium"
 zone         = "europe-west1-b"

 boot_disk {
   initialize_params {
     image = "centos-cloud/centos-7"
   }
 }


 metadata_startup_script = "sudo apt-get update"

 metadata = {
    ssh-keys = "ENTER LOGIN:SSHKEY"
 }

 network_interface {
   network = "default"

   access_config {
     
   }
 }
}

resource "google_compute_firewall" "default" {
 name    = "elastic-app-firewall"
 network = "default"

 allow {
   protocol = "tcp"
   ports    = ["0-65535"]
 }
 source_tags = ["default"]
}