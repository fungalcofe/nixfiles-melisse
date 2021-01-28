let
  simon = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINOiFv7rm8ChxvFaggUHRWcgGriWxkfiIPxhUSgTeA6n";
  antonin = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJh6W2o61dlOIcBXeWRhXWSYD/W8FDVf3/p4FNfL2L6p";
  users = [ simon antonin ];

  coreilla = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDiqPblq1nqIQtP9YHkVMD0pwKsyL2yeK6KMdeQYoVrD";
  systems = [ coreilla ];
in
{
  "ldap_admin.age".publicKeys = users ++ [ coreilla ];
}