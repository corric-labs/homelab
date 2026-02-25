package homelab.edge

deny[msg] {
  r := input.rules[_]
  r.direction == "wan_in"
  not r.owner
  msg := "wan_in rule must include owner"
}

deny[msg] {
  r := input.rules[_]
  r.direction == "wan_in"
  not r.expires_at
  msg := "wan_in rule must include expires_at"
}
