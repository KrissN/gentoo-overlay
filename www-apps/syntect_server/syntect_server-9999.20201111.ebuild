# Copyright 2017-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.3.1

EAPI=7

inherit cargo git-r3

EGIT_REPO_URI="https://github.com/sourcegraph/syntect_server"
EGIT_COMMIT="9089f988f93ae6c76ba746e71036a7cd691de018"

DESCRIPTION="syntect_server"

HOMEPAGE="A HTTP server that exposes the Rust Syntect syntax highlighting library for use by other services"
RESTRICT="mirror"
LICENSE="0BSD Apache-2.0 Apache-2.0 WITH LLVM-exception BSD-3-Clause BSL-1.0 MIT Unlicense"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-libs/oniguruma"
RDEPEND="${DEPEND}"

src_unpack() {
        git-r3_src_unpack
        cargo_live_src_unpack
}

src_compile() {
        export RUSTONIG_SYSTEM_LIBONIG=1
        cargo_src_compile
}

src_install() {
        dobin target/release/syntect_server
}
