output "vm_1_name" {
  value = yandex_compute_instance.vm_1.name
}

output "vm_1_public_ip" {
  value = yandex_compute_instance.vm_1.network_interface.0.nat_ip_address
}
