with import <nixpkgs> {};
let
  libvterm = stdenv.mkDerivation {
    name = "libvterm";
    src = fetchurl {
      url = "http://www.leonerd.org.uk/code/libvterm/libvterm-0.1.4.tar.gz";
      sha256 = "bc70349e95559c667672fc8c55b9527d9db9ada0fb80a3beda533418d782d3dd";
    };
    nativeBuildInputs = [ libtool ];

    makeFlags = [ "PREFIX=$(out)" ];
  };

in mkShell {
  nativeBuildInputs = [ cmake ];
  buildInputs = [ libvterm ];
}
