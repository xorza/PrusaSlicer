include(CMakeFindDependencyMacro)

find_library(OpenCSG_LIBS NAMES opencsg)

find_file(OpenCSG_HEADER NAMES opencsg.h opencsg/opencsg.h)

if (NOT OpenCSG_FIND_QUIETLY)
    message(STATUS "OpenCSG libs: ${OpenCSG_LIBS}")
    message(STATUS "OpenCSG include: ${OpenCSG_HEADER}")
endif()

if (NOT OpenCSG_LIBS OR NOT OpenCSG_HEADER)
    find_dependency(OpenCSG CONFIG)
else()
    get_filename_component(OpenCSG_INCLUDE_DIR ${OpenCSG_HEADER} DIRECTORY )
    
    add_library(OpenCSG::opencsg INTERFACE IMPORTED)
    set_target_properties(OpenCSG::opencsg PROPERTIES 
        INTERFACE_LINK_LIBRARIES "${OpenCSG_LIBS}"
        INTERFACE_INCLUDE_DIRECTORIES "${OpenCSG_INCLUDE_DIR}"
        )
    set(OpenCSG_FOUND TRUE)
endif()
