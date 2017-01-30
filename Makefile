# $OpenBSD: Makefile.template,v 1.75 2016/03/20 17:19:49 naddy Exp $

COMMENT =	serialization protocol and RPC framework

V =	0.5.3
DISTNAME =	capnproto-c++-$V
PKGNAME =	capnproto-$V
REVISION =	0

CATEGORIES =	devel

SHARED_LIBS +=	kj                   0.0      # unknown
SHARED_LIBS +=	capnp                0.0      # unknown
SHARED_LIBS +=	capnpc               0.0      # unknown
SHARED_LIBS +=	kj-async             0.0      # unknown
SHARED_LIBS +=	capnp-rpc            0.0      # unknown

HOMEPAGE =	https://capnproto.org

MAINTAINER =		Steven Dee <i@wholezero.org>

# MIT
PERMIT_PACKAGE_CDROM =	Yes

WANTLIB =		c estdc++ m pthread

MASTER_SITES =		https://capnproto.org/

BUILD_DEPENDS =	lang/gcc/4.9,-c++>=4.9
LIB_DEPENDS =		lang/gcc/4.9,-libs>=4.9

MAKE_FLAGS =		-j$(shell sysctl -n hw.ncpu) SO_VERSION=$(REVISION)

USE_GMAKE =		Yes
CONFIGURE_STYLE =	simple
CONFIGURE_ENV =	CC=egcc CXX=eg++

TEST_TARGET =		check

.include <bsd.port.mk>
