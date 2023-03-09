find_package(Threads REQUIRED)

include(FetchContent)
include(CheckIncludeFileCXX)

cmake_policy(SET CMP0097 NEW)

CHECK_INCLUDE_FILE_CXX("unistd.h" HAS_UNISTD_H)
if(NOT HAS_UNISTD_H)
    # unistd_h
    FetchContent_Declare(unistd_h
        GIT_REPOSITORY https://github.com/win32ports/unistd_h.git
        GIT_TAG master)

    FetchContent_GetProperties(unistd_h)
    if(NOT unistd_h_POPULATED)
        FetchContent_Populate(unistd_h)
        include_directories(SYSTEM ${unistd_h_SOURCE_DIR})
    endif()
endif()


CHECK_INCLUDE_FILE_CXX("sys/time.h" HAS_SYS_TIME_H)
if(NOT HAS_SYS_TIME_H)
    # sys_time_h
    FetchContent_Declare(sys_time_h
        GIT_REPOSITORY https://github.com/win32ports/sys_time_h.git
        GIT_TAG master)

    FetchContent_GetProperties(sys_time_h)
    if(NOT sys_time_h_POPULATED)
        FetchContent_Populate(sys_time_h)
        include_directories(SYSTEM ${sys_time_h_SOURCE_DIR})
    endif()
endif()


# winpthreads
FetchContent_Declare(winpthreads
    GIT_REPOSITORY https://github.com/LonghronShen/winpthreads.git
    GIT_TAG master
    GIT_SHALLOW TRUE
    GIT_SUBMODULES "")

FetchContent_GetProperties(winpthreads)
if(NOT winpthreads_POPULATED)
    FetchContent_Populate(winpthreads)
    add_subdirectory(${winpthreads_SOURCE_DIR} ${winpthreads_BINARY_DIR} EXCLUDE_FROM_ALL)
endif()


# libcxx
FetchContent_Declare(libcxx
    GIT_REPOSITORY https://github.com/LonghronShen/libcxx.git
    GIT_TAG master
    GIT_SHALLOW TRUE
    GIT_SUBMODULES "")

FetchContent_GetProperties(libcxx)
if(NOT libcxx_POPULATED)
    FetchContent_Populate(libcxx)
    add_subdirectory(${libcxx_SOURCE_DIR} ${libcxx_BINARY_DIR} EXCLUDE_FROM_ALL)
endif()


# EnlyzeWinCompatLib
FetchContent_Declare(enlyze_win_compat_lib
    GIT_REPOSITORY https://github.com/LonghronShen/EnlyzeWinCompatLib.git
    GIT_TAG clang
    GIT_SHALLOW TRUE
    GIT_SUBMODULES "")

FetchContent_GetProperties(enlyze_win_compat_lib)
if(NOT enlyze_win_compat_lib_POPULATED)
    FetchContent_Populate(enlyze_win_compat_lib)
    add_subdirectory(${enlyze_win_compat_lib_SOURCE_DIR} ${enlyze_win_compat_lib_BINARY_DIR} EXCLUDE_FROM_ALL)
endif()


# opencow
FetchContent_Declare(opencow
    GIT_REPOSITORY https://github.com/LonghronShen/opencow.git
    GIT_TAG master
    GIT_SHALLOW TRUE
    GIT_SUBMODULES "")

FetchContent_GetProperties(opencow)
if(NOT opencow_POPULATED)
    FetchContent_Populate(opencow)
    add_subdirectory(${opencow_SOURCE_DIR} ${opencow_BINARY_DIR} EXCLUDE_FROM_ALL)
endif()