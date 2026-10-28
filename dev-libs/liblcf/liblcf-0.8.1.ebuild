EAPI=8

inherit cmake

DESCRIPTION="Library to handle RPG Maker 2000/2003 and EasyRPG projects"
HOMEPAGE="https://github.com/EasyRPG/liblcf"
SRC_URI="https://github.com/EasyRPG/liblcf/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT BSD Boost-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-libs/expat:0=
		 dev-libs/icu:0="

BDEPEND="dev-libs/inih:0="

DEPEND="${RDEPEND}"

src_unpack() {
	unpack ${P}.tar.gz
}

src_prepare() {
	sed -i 's/\r$//' CMakeLists.txt || die
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DCMAKE_BUILD_TYPE=Release
	)

	cmake_src_configure
}
