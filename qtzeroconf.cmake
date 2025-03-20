# below for >= Qt5
# linux:!android:!ubports {
#         HEADERS+= qzeroconf.h avahi-qt/qt-watch.h  avahi-qt/qt-watch_p.h
#         SOURCES+= avahiclient.cpp avahi-qt/qt-watch.cpp
# 	LIBS+= -lavahi-client -lavahi-common
# 	QMAKE_CXXFLAGS+= -I$$PWD
# }


if(WIN32)
    # add_compile_definitions(WIN32)
    # add_compile_definitions(NDEBUG)
    # add_compile_definitions(_WINDOWS)
    # add_compile_definitions(_USRDLL)
    # add_compile_definitions(MDNS_DEBUGMSGS=0)
    # add_compile_definitions(WIN32_LEAN_AND_MEAN)
    # add_compile_definitions(USE_TCP_LOOPBACK)
    # add_compile_definitions(_CRT_SECURE_NO_DEPRECATE)
    # add_compile_definitions(_CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES=1)
    # add_compile_definitions(NOT_HAVE_SA_LEN)
    # QMAKE_CFLAGS+= -Ibonjour-sdk
    # QMAKE_CXXFLAGS+= -Ibonjour-sdk -I$$PWD
    # HEADERS+= qzeroconf.h bonjour_p.h
    # set(QZC_SOURCES
    #     bonjour.cpp
    #     bonjour-sdk/dnssd_clientlib.c
    #     bonjour-sdk/dnssd_clientstub.c
    #     bonjour-sdk/dnssd_ipc.c
    # )
    # link_libraries(ws2_32 wsock32)
endif()

if(APPLE)
    set(QZC_HEADERS
        ${CMAKE_CURRENT_LIST_DIR}/qzeroconf.h
        ${CMAKE_CURRENT_LIST_DIR}/bonjour_p.h)
    set(QZC_SOURCES ${CMAKE_CURRENT_LIST_DIR}/bonjour.cpp)
    set(CMAKE_LFLAGS -F /System/Library/Frameworks/CoreServices.framework/)
    link_libraries("-framework CoreServices")
    include_directories(${CMAKE_CURRENT_LIST_DIR})
endif()

# ubports: {
# 	QMAKE_CXXFLAGS+= -I$$PWD
# 	QMAKE_CFLAGS+= -I$$PWD
# 	ACM = avahi-common
# 	ACR = avahi-core
# 	HEADERS+= qzeroconf.h avahi-qt/qt-watch.h  avahi-qt/qt-watch_p.h
# 	SOURCES+= avahicore.cpp avahi-qt/qt-watch.cpp
# 	# avahi-common
# 	android: {
# 		DEFINES+= HAVE_STRLCPY GETTEXT_PACKAGE
# 	}
# 	ubports: {
# 		DEFINES+= _GNU_SOURCE GETTEXT_PACKAGE
# 	}
# 	SOURCES+= $$ACM/address.c
# 	SOURCES+= $$ACM/alternative.c
# 	SOURCES+= $$ACM/domain.c
# 	SOURCES+= $$ACM/error.c
# 	SOURCES+= $$ACM/i18n.c
# 	SOURCES+= $$ACM/malloc.c
# 	SOURCES+= $$ACM/rlist.c
# 	SOURCES+= $$ACM/simple-watch.c
# 	SOURCES+= $$ACM/strlst.c
# 	SOURCES+= $$ACM/thread-watch.c
# 	SOURCES+= $$ACM/timeval.c
# 	SOURCES+= $$ACM/utf8.c
# 	# avahi-core
# 	DEFINES+= HAVE_NETLINK
# 	SOURCES+= $$ACR/addr-util.c
# 	SOURCES+= $$ACR/announce.c
# 	SOURCES+= $$ACR/browse.c
# 	SOURCES+= $$ACR/browse-dns-server.c
# 	SOURCES+= $$ACR/browse-domain.c
# 	SOURCES+= $$ACR/browse-service.c
# 	SOURCES+= $$ACR/browse-service-type.c
# 	SOURCES+= $$ACR/cache.c
# 	SOURCES+= $$ACR/dns.c
# 	SOURCES+= $$ACR/domain-util.c
# 	SOURCES+= $$ACR/entry.c
# 	SOURCES+= $$ACR/fdutil.c
# 	SOURCES+= $$ACR/hashmap.c
# 	SOURCES+= $$ACR/iface.c
# 	SOURCES+= $$ACR/iface-linux.c
# 	SOURCES+= $$ACR/log.c
# 	SOURCES+= $$ACR/multicast-lookup.c
# 	SOURCES+= $$ACR/netlink.c
# 	SOURCES+= $$ACR/prioq.c
# 	SOURCES+= $$ACR/probe-sched.c
# 	SOURCES+= $$ACR/querier.c
# 	SOURCES+= $$ACR/query-sched.c
# 	SOURCES+= $$ACR/resolve-address.c
# 	SOURCES+= $$ACR/resolve-host-name.c
# 	SOURCES+= $$ACR/resolve-service.c
# 	SOURCES+= $$ACR/response-sched.c
# 	SOURCES+= $$ACR/rr.c
# 	SOURCES+= $$ACR/rrlist.c
# 	SOURCES+= $$ACR/server.c
# 	SOURCES+= $$ACR/socket.c
# 	SOURCES+= $$ACR/timeeventq.c
# 	SOURCES+= $$ACR/util.c
# 	SOURCES+= $$ACR/wide-area.c
# 	#avahi-core/iface-none.c avahi-core/iface-pfroute.c avahi-core/avahi-reflector.c
# }

# if (ANDROID)
#     lessThan(QT_MAJOR_VERSION, 6) {
#             QT += androidextras
#     }
#     QT += gui
#     INCLUDEPATH += $$PWD
#     HEADERS += qzeroconf.h androidnsd_p.h
#     SOURCES += androidnsd.cpp
#     DISTFILES += QZeroConfNsdManager.java
# endif()

list(APPEND QZC_HEADERS
    ${CMAKE_CURRENT_LIST_DIR}/qzeroconfservice.h
    ${CMAKE_CURRENT_LIST_DIR}/qzeroconfglobal.h)

list(APPEND QZC_SOURCES ${CMAKE_CURRENT_LIST_DIR}/qzeroconfservice.cpp)
