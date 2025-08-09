{ config, pkgs, ... }:

{
  users.users.user = {
    isNormalUser = true;
    description = "user";
    extraGroups = [ "networkmanager" "wheel" "docker" "libvirt" "dialout" ];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDEVVZCcO7GKUdDINhN8Uca2BcU+34tuLqYe83MxxjS0z0xlFgZbnU4zizZtfx1CfR6YPYwqJny+45yD6aHCKLA++HLWzInSLBqRhxiHI5UG+LZsw3pbrNcuYiIywn+a36pnmf5w64KXMZGQ2wGI8FVvqMqrcXPby86HnHlI4/W1gFNQ7gyDWahjTNZEHsoHjWHSxtNc6F/P+R/JZGaQl9vkiHCgTTvw2JwyhnmVYDoglUMCjWus4c+nOfzY+aYdTxLvidMEUqnQLMXPFr7OF+u2uFZ1kiE1sK8j1vXxvhj7uetE7aayLVWikcyTduxuJRdZ0GXHaKgJq+IjQMc9QTeIxMv3diqQS03XaUwsw7NOzpLw6lezRr5SAZdFHSl86zMA54sbWxcIwRPKn6vRTOTph0gkfem9gt0SM7bEJFFqWOgDHM+5WJnVac1h1apjs1vXoAm6XfzSSYkBVPrX1yVT/42H7ieNUssrSYlzfdcIu2SsN3VLsmEUF+yHCFUXm0= root@orangepi3b"
    ];
  };
}
