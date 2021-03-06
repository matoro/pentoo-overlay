# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7} )

inherit distutils-r1

DESCRIPTION="The Harvester is a tool designed to collect email accounts of the target domain"
HOMEPAGE="http://www.edge-security.com/theharvester.php"
SRC_URI="https://github.com/laramies/theHarvester/archive/V${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
# IUSE="test"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

# RESTRICT="!test? ( test )"

RDEPEND="${PYTHON_DEPS}
	dev-python/aiodns[${PYTHON_USEDEP}]
	dev-python/beautifulsoup:4[${PYTHON_USEDEP}]
	>=dev-python/dnspython-1.16.0[${PYTHON_USEDEP}]
	dev-python/grequests[${PYTHON_USEDEP}]
	dev-python/netaddr[${PYTHON_USEDEP}]
	dev-python/plotly[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.1.2[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	>=dev-python/shodan-1.17.0[${PYTHON_USEDEP}]
	dev-python/texttable[${PYTHON_USEDEP}]
	dev-python/retrying[${PYTHON_USEDEP}]
	dev-python/zope-event[${PYTHON_USEDEP}]
	"

DEPEND="${RDEPEND}"
	# test? (
	# 	dev-python/flake8[${PYTHON_USEDEP}]
	# 	dev-python/mypy[${PYTHON_USEDEP}]
	# )"

PATCHES=( "${FILESDIR}/${P}_fix_asyncio_detect.patch")

# distutils_enable_tests pytest

src_prepare() {
	default

	# network required for tests
	rm -r tests || die
}
