#  	By Nyxvectar Yan <nyxvectar@proton.me>  #
#   Under the MIT LICENSE, free to use.     #

{
    pkgs,
    ...
}:

{
    programs.git = {
        enable = true;
        userName = "Nyxvectar Yan";
        userEmail = "Nyxvectar@proton.me";
    };
}
