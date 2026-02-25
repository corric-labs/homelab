package homelab.governance

deny[msg] {
  input.change_type == "high_risk"
  not input.justification
  msg := "high-risk changes require explicit justification"
}
