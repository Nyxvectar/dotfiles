#  	By Raye Lattice  <nyxvectar@proton.me>  #
#   Under the MIT LICENSE, free to use.     #

{
    pkgs,
    ...
}:

{
    programs.git = {
        enable = true;
        lfs.enable = true;
        userName = "Raye Lattice";
        userEmail = "nyxvectar@proton.me";
        aliases = {
            ci = "commit";
            co = "checkout";
            l = "log --oneline";
            ll = "log";
            s = "status";
        };
    };
}
