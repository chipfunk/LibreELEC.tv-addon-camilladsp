PKG_NAME="camilladsp"
PKG_VERSION="2.0.0"
PKG_REV="100"
PKG_ARCH="any"
PKG_LICENSE="Proprietary"
PKG_SITE="https://henquist.github.io/"
PKG_URL="https://github.com/HEnquist/camilladsp/archive/refs/tags/v${PKG_VERSION}.tar.gz"
PKG_MAINTAINER="chipfunk" # Full name or forum/GitHub nickname, if you want to be identified as the addon maintainer
PKG_DEPENDS_HOST="cargo rust"
PKG_DEPENDS_TARGET="alsa-lib fftw3 fftw3f"
PKG_SECTION="service/system"
PKG_SHORTDESC=" IIR and FIR engine for crossovers, room correction etc."
PKG_LONGDESC=" A flexible cross-platform IIR and FIR engine for crossovers, room correction etc."
PKG_TOOLCHAIN="manual" # or one of auto, meson, cmake, cmake-make, configure, make, ninja, autotools, manual

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="CamillaDSP"
PKG_ADDON_TYPE="xbmc.service.library"
# PKG_ADDON_PROJECTS="[project, only set when not any]"
# PKG_ADDON_PROVIDES="executable"
# PKG_ADDON_REQUIRES="some.addon:0.0.0"

make_target() {
  cargo build -r
}

makeinstall_target() {
  export
  cp ${CARGO_TARGET_DIR}/camilladsp ${PKG_INSTALL}/bin
}

addon() {
  export
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  cp ${PKG_INSTALL}/release/ ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
}
