{ stdenvNoCC, fetchurl }:
let
  wallpapers = [
    {
      name = "mygo-watch-tv.png";
      url = "https://i.imgur.com/FSneBN2.jpg";
      sha256 = "1pznrjx6rb8qm947q63dzkrmv188h3nrcp8cdmd7hs5gs30azfww";
    }
    {
      name = "frieren-butterflies.jpg";
      url = "https://i.imgur.com/H1noDhu.jpg";
      sha256 = "0vypn9sxarv2gw42hs2haasyvzqyp02s6vaqygp9xbg59m0x2l73";
    }
    {
      name = "frieren-fire.jpg";
      url = "https://i.imgur.com/c3CWmia.jpg";
      sha256 = "0lgqwjl6jd1y84cz368s4sq0krzg67znqxirzapqxqvfdpn9rwbw";
    }
    {
      name = "anon-soyo.jpg";
      url = "https://i.imgur.com/koPV5sz.png";
      sha256 = "031s3v8fp5q2dm95wra898jq9l4i49wlwf97iah6bjqi5ihaxs2x";
    }
    {
      name = "mygo-train.jpg";
      url = "https://i.imgur.com/OzR8c12.jpg";
      sha256 = "0fnwasnr19wfyhxa5yq7g3315d1641602x7fg8sv1qv95dlj55w2";
    }
    {
      name = "green-blue-flowers.jpg";
      url = "https://i.imgur.com/Kvjqksw.jpg";
      sha256 = "1la4g50sxc940j9vcf7440l73ycx05z63dmpfq8xn0b746hzmnkq";
    }
    {
      name = "bangqiaoyan-girl-sky.jpg";
      url = "https://i.imgur.com/qJ3ta1b.jpg";
      sha256 = "1chzklk6j893fdxhp0jhjwgwyhg3p6hjrgrrr5fw8gkllx91sx5w";
    }
    {
      name = "morncolour-pink-landscape.png";
      url = "https://i.imgur.com/BBzCYYQ.png";
      sha256 = "14kjc7zipbwvswjbkzqk4781as6pn31naq26nxknzhmr4z5rhzci";
    }
    {
      name = "jiaocha-girl-sea.jpg";
      url = "https://i.imgur.com/LBowln5.jpeg";
      sha256 = "0agpr2z7v6q77ypgfsl6b57gac7ncrgf1fh0b5g7g0a53mzib5hm";
    }
    {
      name = "muji-monochrome.jpg";
      url = "https://i.imgur.com/F2h7rsD.jpg";
      sha256 = "02q0wd2xpyjfiifmrsf6sg1ja3zlb9514g98w156f7jdpw2c9ppb";
    }
    {
      name = "zzzzoka-gbc.jpg";
      url = "https://i.imgur.com/qE6Pr45.jpg";
      sha256 = "1li5ypdvlvdpihiplf5mjj0lvf9gbcwyjslpxgla6wz0fzrwnvgi";
    }
    {
      name = "celestia-lunar.jpg";
      url = "https://i.imgur.com/QIhYwtH.jpg";
      sha256 = "04dsm4dpv2mddzw7vw77bb0s2mkd4n54hnfa277181smnns7cdzz";
    }
    {
      name = "kita.png";
      url = "https://i.imgur.com/fn2kneH.png";
      sha256 = "1pl9234h48xffyvbkvyg3rdxjw0432p8m0jbx7k8pb1l2d2m09a4";
    }
    {
      name = "android-nautilus.jpg";
      url = "https://i.imgur.com/53Azuew.jpg";
      sha256 = "09qaj2nzlsk3xv88lsawpy3dnhw5vjcgs1r4ski9wdknbnxvl3b2";
    }
    {
      name = "city.jpeg";
      url = "https://i.imgur.com/pUG5lpl.jpeg";
      sha256 = "0zsfih9c09mkjdlimla6bmilkdvj7hqsavqc729w9ymxxqfyyyqj";
    }
    {
      name = "jw-follow-the-wind.jpeg";
      url = "https://i.imgur.com/eCilr4R.jpeg";
      sha256 = "1vnnmlxa6bx1yi9b3hh7v5wggwab3k5nx7hxpnc56ld4p1wm3g4l";
    }
  ];

  wallpaperSrcs = map fetchurl wallpapers;
in
stdenvNoCC.mkDerivation {
  name = "wallpapers";
  phases = [ "installPhase" ];
  installPhase = ''
    mkdir -p $out
  ''
  + (
    map (wallpaper: "ln -s ${wallpaper} $out/${wallpaper.name}") wallpaperSrcs
    |> builtins.concatStringsSep "\n"
  );
  meta = {
    description = "My wallpapers";
  };
}
