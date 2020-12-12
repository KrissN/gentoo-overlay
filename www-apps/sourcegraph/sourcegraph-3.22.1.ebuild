# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
#EGO_PN="github.com/grafana/grafana/..."
#EGO_SRC="github.com/grafana/grafana"
#S="${WORKDIR}/${PN}"

inherit git-r3

DESCRIPTION="Sourcegraph"
HOMEPAGE="http://sourcegraph.com"

EGIT_REPO_URI="https://github.com/sourcegraph/sourcegraph.git"
EGIT_BRANCH="3.22"
EGIT_COMMIT="72092d6f776c3242d46f66a09354263aefa7e2ef"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"

DEPEND="
    dev-lang/go
    net-libs/nodejs
    sys-apps/yarn
"

RDEPEND="
    app-admin/su-exec
    dev-db/postgresql
    dev-db/sqlite-pcre
    www-apps/syntect_server
"
BDEPEND="sys-process/parallel"

PATCHES=(
        "${FILESDIR}"/${PN}-3.22-persistent-outdir.patch
        "${FILESDIR}"/${PN}-3.22-remove-dist-tag.patch
        "${FILESDIR}"/${PN}-3.22-remove-docker.patch
        "${FILESDIR}"/${PN}-3.22-use-glibc.patch
)

OUTDIR="${S}/output"

src_compile() {
	cmd/server/pre-build.sh || die "Pre-build failed"
	IMAGE=sourcegraph/server:0.0.0-DEVELOPMENT VERSION=0.0.0-DEVELOPMENT OUTPUT=${OUTDIR} cmd/server/build.sh || die "Build failed"
}

src_install() {
	install -d -m0755 "${D}/usr/bin"
	install -m0755 "${OUTDIR}/usr/local/bin/"* "${D}/usr/bin/"
	install -m0755 "${OUTDIR}/frontend" "${D}/usr/bin/"
}
