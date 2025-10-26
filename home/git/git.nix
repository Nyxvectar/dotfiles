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
        settings = {
            user.name = "Raye Lattice";
            user.email = "nyxvectar@proton.me";
            alias = {
                ci = "commit -m";
                co = "checkout";
                l = "log --oneline";
                ll = "log";
                s = "status";
            };
        };
    };
}
