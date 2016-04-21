TERMUX_PKG_HOMEPAGE=http://aria2.sourceforge.net/
TERMUX_PKG_DESCRIPTION="Multi-protocol & multi-source command-line download utility supporting HTTP/HTTPS, FTP, BitTorrent and Metalink"
TERMUX_PKG_VERSION=1.22.0
TERMUX_PKG_SRCURL=https://github.com/tatsuhiro-t/aria2/releases/download/release-$TERMUX_PKG_VERSION/aria2-${TERMUX_PKG_VERSION}.tar.xz
TERMUX_PKG_DEPENDS="c-ares, openssl, libxml2, libgnustl"
# sqlite3 is only used for loading cookies from firefox or chrome:
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="--with-openssl --without-gnutls --without-libuv --without-sqlite3 ac_cv_search_getaddrinfo=no ac_cv_func_getaddrinfo=yes ac_cv_func_gettimeofday=yes ac_cv_func_sleep=yes ac_cv_func_usleep=yes ac_cv_func_basename=yes"

termux_step_pre_configure () {
	export CXXFLAGS="$CXXFLAGS -lgnustl_shared"
	cd $TERMUX_PKG_SRCDIR
}
