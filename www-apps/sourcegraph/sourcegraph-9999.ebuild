# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
#EGO_PN="github.com/grafana/grafana/..."
#EGO_SRC="github.com/grafana/grafana"
#S="${WORKDIR}/${PN}"

inherit git-r3

DESCRIPTION="Sourcegraph"
HOMEPAGE="http://sourcegraph.com"

EGIT_REPO_URI="https://github.com/sourcegraph/sourcegraph.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"

DEPEND="
    dev-lang/go
    net-libs/nodejs
    sys-apps/yarn
    dev-db/postgresql
    dev-db/sqlite-pcre
"
RDEPEND=""
BDEPEND="sys-process/parallel"

PATCHES=(
        "${FILESDIR}"/${P}-persistent-outdir.patch
        "${FILESDIR}"/${P}-fix-absolute-paths.patch
)

OUTDIR="${S}/output"

src_compile() {
	cmd/server/pre-build.sh
	IMAGE=sourcegraph/server:0.0.0-DEVELOPMENT VERSION=0.0.0-DEVELOPMENT OUTPUT=${OUTDIR} cmd/server/build.sh
}

src_install() {
	install -d -m0755 "${D}/usr/bin"
	install -m0755 "${OUTDIR}/usr/local/bin/"* "${D}/usr/bin/"
}
