{ stdenv, lib, ... }:

stdenv.mkDerivation rec {
  pname = "mistex-buildroot";
  version = "0.0.0";
  
  src = ./.;

  nativeBuildInputs = [ ];
  buildInputs = [ ];

  buildPhase = ''
    cd ${src}/buildroot
    make BR2_EXTERNAL=../buildroot-external mistex_defconfig
    make BR2_EXTERNAL=../buildroot-external sdk
  '';

  installPhase = ''
    mkdir -p $out
    cp ${src}/buildroot/output/images/sdcard.img $out/
    cp ${src}/buildroot/output/images/*sdk*gz $out/
  '';

  meta = with lib; {
    homepage = "https://github.com/MiSTeX-devel/MiSTeX-buildroot";
    description = ''
      embedded Linux firmware and SDK for the MiSTeX project
    '';
    licencse = licenses.mit;
    platforms = with platforms; linux;
    maintainers = [ maintainers.hansfbaier ];    
  };
}