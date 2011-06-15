# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit subversion

DESCRIPTION="An open source wireless development platform suitable for Bluetooth experimentation"
HOMEPAGE="http://ubertooth.sourceforge.net/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~arm ~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="sys-devel/sourcery-arm-gcc-bin"

ESVN_REPO_URI="https://ubertooth.svn.sourceforge.net/svnroot/ubertooth/trunk/firmware"

src_compile() {
	cd "${S}"/bluetooth_rxtx
	emake
}

src_install() {
	insinto /lib/firmware
	doins bluetooth_rxtx/bluetooth_rxtx.bin
}

