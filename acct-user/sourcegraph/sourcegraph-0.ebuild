# Copyright 2030 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit acct-user

DESCRIPTION="user for www-apps/sourcegraph"
ACCT_USER_ID=450
ACCT_USER_GROUPS=( sourcegraph )

acct-user_add_deps
