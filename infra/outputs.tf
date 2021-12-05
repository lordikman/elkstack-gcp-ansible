output "Elastic1_VM_IP" {
  value = google_compute_instance.elastic[0].network_interface.0.network_ip
}

output "Elastic2_VM_IP" {
  value = google_compute_instance.elastic[1].network_interface.0.network_ip
}

#output "Elastic3_VM_IP" {
#  value = google_compute_instance.elastic[2].network_interface.0.network_ip
#}

output "Logstash_VM_IP" {
  value = google_compute_instance.logstash[0].network_interface.0.network_ip
}

output "Kibana_VM_IP" {
  value = google_compute_instance.kibana[0].network_interface.0.network_ip
}