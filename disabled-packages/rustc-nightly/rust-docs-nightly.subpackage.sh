TERMUX_SUBPKG_DESCRIPTION="Rust language documentation"
TERMUX_SUBPKG_PLATFORM_INDEPENDENT=true
TERMUX_SUBPKG_INCLUDE="opt/rust-nightly/share"
if [ $TERMUX_ARCH = "x86_64" ]; then
SUB_PKG_NAME="x86_64-dummy"
fi
