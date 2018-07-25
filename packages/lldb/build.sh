TERMUX_PKG_HOMEPAGE=https://lldb.llvm.org
TERMUX_PKG_DESCRIPTION="LLVM based debugger"
TERMUX_PKG_VERSION=6.0.1
TERMUX_PKG_SHA256=6b8573841f2f7b60ffab9715c55dceff4f2a44e5a6d590ac189d20e8e7472714
TERMUX_PKG_SRCURL=http://releases.llvm.org/${TERMUX_PKG_VERSION}/lldb-$TERMUX_PKG_VERSION.src.tar.xz
TERMUX_PKG_DEPENDS="libedit, libllvm, libxml2, ncurses-ui-libs"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DLLDB_DISABLE_CURSES=0
-DLLDB_DISABLE_LIBEDIT=0
-DLLDB_DISABLE_PYTHON=1
-DLLVM_CONFIG=$TERMUX_PREFIX/bin/llvm-config
-DLLVM_ENABLE_TERMINFO=1
-DLLVM_LINK_LLVM_DYLIB=ON
"

termux_step_pre_configure() {
	LDFLAGS+=" -Wl,--exclude-libs=libLLVMSupport.a"
}

termux_step_post_make_install() {
	cp $TERMUX_PKG_SRCDIR/docs/lldb.1 $TERMUX_PREFIX/share/man/man1
}
