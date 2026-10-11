{...}: {
  services.fprintd.enable = true;

  # SDDM runs its PAM stack serially, so pam_fprintd stalls password login for 30s.
  security.pam.services.login.fprintAuth = false;
}
