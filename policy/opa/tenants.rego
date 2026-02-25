package homelab.tenants

deny[msg] {
  vm := input
  vm.ssh.password_auth == true
  msg := "password authentication must be disabled for tenant VMs"
}

deny[msg] {
  vm := input
  not startswith(vm.image, "ubuntu")
  msg := "only ubuntu images are allowed in phase 0/1"
}
