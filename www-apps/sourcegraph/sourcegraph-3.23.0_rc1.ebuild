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
EGIT_BRANCH="3.23"
EGIT_COMMIT="fe79bbf6bfee9ad9e3eb79b663db0957f5c0391d"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"

DEPEND="
    dev-lang/go
    net-libs/nodejs
    sys-apps/yarn
"

RDEPEND="
    acct-user/sourcegraph
    app-admin/su-exec
    app-metrics/alertmanager
    app-metrics/prometheus
    dev-db/postgresql
    dev-db/sqlite-pcre
    dev-util/ctags
    www-apps/syntect_server
    www-servers/nginx
"
BDEPEND="sys-process/parallel"

PATCHES=(
        "${FILESDIR}"/${PN}-3.23-persistent-outdir.patch
        "${FILESDIR}"/${PN}-3.23-remove-docker.patch
        "${FILESDIR}"/${PN}-3.23-remove-grafana.patch
        "${FILESDIR}"/${PN}-3.22-use-glibc.patch
        "${FILESDIR}"/${PN}-3.23-fix-filesystem-paths.patch
        "${FILESDIR}"/${PN}-3.23-increase-initial-frontent-timeout.patch
)

OUTDIR="${S}/output"

src_compile() {
	export PATH="$(npm bin):${PATH}"
	cmd/server/pre-build.sh || die "Pre-build failed"
	export OUTPUT="${OUTDIR}"
	IMAGE=sourcegraph/server:0.0.0-DEVELOPMENT VERSION=0.0.0-DEVELOPMENT cmd/server/build.sh || die "Build failed"
}

src_install() {
	dobin "${OUTDIR}"/usr/local/bin/*
    dobin "${OUTDIR}"/prometheus/.bin/prom-wrapper
    
    exeinto /usr/libexec/sourcegraph/
    doexe "${OUTDIR}"/prometheus/prometheus.sh
    doexe "${OUTDIR}"/prometheus/alertmanager.sh
    
    insinto /usr/share/sourcegraph/sg_config_prometheus/
    doins "${OUTDIR}"/prometheus/config/*_rules.yml
    doins "${OUTDIR}"/prometheus/config/prometheus.yml
    doins "${OUTDIR}"/prometheus/config/alertmanager.yml
    PROMETHEUS_DIR="${D}/usr/share/sourcegraph/sg_config_prometheus/" GRAFANA_DIR='' DOCS_DIR='' NO_PRUNE=true "${OUTDIR}"/prometheus/.bin/monitoring-generator || die "Failed to generate Prometheus monitoring rules"
    
    insinto /usr/share/sourcegraph/sg_prometheus_add_ons
    doins "${OUTPUT}"/sg_prometheus_add_ons/prometheus_targets.yml
    
    insinto /usr/share/sourcegraph/sg_config_grafana
    doins -r "${OUTPUT}"/sg_config_grafana/*
	
	keepdir /var/lib/sourcegraph/prometheus
	keepdir /var/lib/sourcegraph/alertmanager
	keepdir /var/log/sourcegraph
	fowners -R sourcegraph /var/lib/sourcegraph /var/log/sourcegraph
}
