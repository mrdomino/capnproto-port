# $OpenBSD: Makefile.template,v 1.75 2016/03/20 17:19:49 naddy Exp $

COMMENT =	serialization protocol and RPC framework

V =	0.5.3

DISTNAME =	capnproto-c++-$V
PKGNAME =	capnproto-$V
REVISION =	0

SHARED_LIBS +=	kj                   0.0      # unknown
SHARED_LIBS +=	capnp                0.0      # unknown
SHARED_LIBS +=	capnpc               0.0      # unknown
SHARED_LIBS +=	kj-async             0.0      # unknown
SHARED_LIBS +=	capnp-rpc            0.0      # unknown

CATEGORIES =	devel

HOMEPAGE =	https://capnproto.org

MAINTAINER =		Steven Dee <i@wholezero.org>

# MIT
PERMIT_PACKAGE_CDROM =	Yes

# "make port-lib-depends-check" can help
WANTLIB =		c estdc++ m pthread

MASTER_SITES =		https://capnproto.org/

# Dependencies
#
#MODULES =		???
BUILD_DEPENDS =	lang/gcc/4.9,-c++>=4.9
#RUN_DEPENDS =		???
LIB_DEPENDS =		lang/gcc/4.9,-libs>=4.9
#TEST_DEPENDS =		???

MAKE_FLAGS =		-j$(shell sysctl -n hw.ncpu) SO_VERSION=$(REVISION)
#MAKE_ENV =		???
#FAKE_FLAGS =		???
#TEST_FLAGS =		???

# build/configuration variables
#
#SEPARATE_BUILD =	Yes (build in a directory other than WRKSRC)
#SEPARATE_BUILD =	flavored (distinct flavors may share a common WRKSRC)
USE_GMAKE =		Yes
#USE_GROFF =		Yes
# Programs that require GNU libtool to build instead of the OpenBSD one
# should use this option. Add a comment explaining why. Don't use this if
# a port requires libtool's .m4 files but otherwise can use OpenBSD libtool,
# in that case use "BUILD_DEPENDS=devel/libtool" instead.
#USE_LIBTOOL=		gnu
# Set CONFIGURE_STYLE to value corresponding to some standard configuration
# 	  perl [modbuild]: perl's MakeMaker Makefile.PL (modbuild: perl's
#	  Module::Build Build.PL)
# 	  gnu [autoconf] [old] [dest]: gnu style configure (old: no
# 	  sysconfdir), (dest: add DESTDIR, does not handle it),
# 	  (autoconf: needed by port, implies gnu)
# 	XXX: cygnus products do NOT use autoconf for making the main
# 		configure from configure.in
# 	  imake [noman]: port uses imake for configuration.
#	  (noman: no man page installation)
# 	  simple: port has its own configure script
CONFIGURE_STYLE =	simple
#CONFIGURE_SCRIPT =	??? (if other than configure)
#CONFIGURE_ARGS =	???
CONFIGURE_ENV =	CC=egcc CXX=eg++

# for gnu stuff
#AUTOCONF_VERSION =	??? (defaults to 2.13)
#AUTOMAKE_VERSION =	??? (defaults to 1.4)
# config.guess and others are copied here
#MODGNU_CONFIG_GUESS_DIRS = ??? (defaults to ${WRKSRC})

# Is the build automagic or is it interactive
#
#IS_INTERACTIVE =		Yes
#TEST_IS_INTERACTIVE =		Yes

# Assume you have one multiple choice flavor: 1 2 3 and switches a b.
# You would write
#
#FLAVORS =	1 2 3 a b
#FLAVOR ?=
# grab multiple choice value
#CHOICE = ${FLAVOR:Na:Nb}
# check that CHOICE is 1 OR 2 OR 3, or error out
#.if ${CHOICE} == "1"
# code for 1
#.elif ${CHOICE} == "2"
# code for 2
#.elif ${CHOICE} == "3"
# code for 3
#.else
#ERRORS += "Fatal: Conflicting flavor: ${FLAVOR}"
#.endif
# check for switches
#.if ${FLAVOR:Ma}
# code for a
#.endif
#.if ${FLAVOR:Mb}
# code for b
#.endif

# Things that we don't want to do for this port/package
# Generally, DON'T set anything to No if it's not needed.
# The time gained is not worth it.
#
#NO_BUILD =		Yes
#NO_TEST =		Yes

# Overrides for default values
#
#CFLAGS =		???
#LDFLAGS =		???
#MAKE_FILE =		???
#PKG_ARCH =		??? (* for arch-independent packages)
#WRKDIST =		??? if other than ${WRKDIR}/${DISTNAME}
#WRKSRC =		??? if other than ${WRKDIST}
#WRKBUILD =		??? if other than ${WRKSRC}
#WRKCONF =		??? if other than ${WRKBUILD}

#ALL_TARGET =		???
#INSTALL_TARGET =	???
TEST_TARGET =		check

.include <bsd.port.mk>
