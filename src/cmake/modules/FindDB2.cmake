#TODO: Add detection on win32

find_path(DB2_INCLUDE_DIR sqlcli1.h
  $ENV{DB2_INCLUDE_DIR}
  $ENV{DB2_DIR}/include
  /opt/ibm/db2/V9.7/include
  /opt/ibm/db2/V9.5/include
  /opt/ibm/db2/V9.1/include)

find_library(DB2_LIBRARY NAMES db2
    PATHS
    $ENV{DB2_LIB_DIR}
    $ENV{DB2_DIR}/lib32
    $ENV{DB2_DIR}/lib64
  /opt/ibm/db2/V9.7/lib32
  /opt/ibm/db2/V9.5/lib64
  /opt/ibm/db2/V9.1/lib32
  /opt/ibm/db2/V9.1/lib64)

if(DB2_LIBRARY)
  get_filename_component(DB2_LIBRARY_DIR ${DB2_LIBRARY} PATH)
endif()

if(DB2_INCLUDE_DIR AND DB2_LIBRARY_DIR)
  set(DB2_FOUND TRUE)

  include_directories(${DB2_INCLUDE_DIR})
  link_directories(${DB2_LIBRARY_DIR})

endif()

set(DB2_LIBRARIES ${DB2_LIBRARY})

# Handle the QUIETLY and REQUIRED arguments and set DB2_FOUND to TRUE
# if all listed variables are TRUE
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(DB2
  DEFAULT_MSG
  DB2_INCLUDE_DIR
  DB2_LIBRARIES)

mark_as_advanced(DB2_INCLUDE_DIR DB2_LIBRARIES)