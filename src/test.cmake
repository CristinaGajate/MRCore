SET(curdir2 "C:/Users/drodri/Desktop/mrcoregit/src")
#SET(curdir2 ${CMAKE_CURRENT_SOURCE_DIR})
MESSAGE ( HI ${curdir2} )

FILE(GLOB children RELATIVE ${curdir2} ${curdir2}/*)
SET(HEADERS "")
FOREACH(child ${children})
IF(IS_DIRECTORY ${curdir2}/${child})
     FILE(GLOB_RECURSE child_headers ${curdir2}/${child}/*.h)
     SET(HEADERS ${HEADERS} ${child_headers})
ENDIF()
ENDFOREACH()

SET(MRCORE_H "#pragma once\n")
FOREACH(header ${HEADERS})
string(REGEX REPLACE ^${curdir2}/ "" DIR_FILE ${header})
string(REGEX MATCH "(.*)[/\\]" DIR_INSTALL ${DIR_FILE})
SET(MRCORE_H ${MRCORE_H} "#include \"" ${DIR_FILE} "\"\n")
#INSTALL(FILES ${header} DESTINATION ${CMAKE_INSTALL_PREFIX}/include/mrcore/${DIR_INSTALL})
#INSTALL(FILES ${header} DESTINATION ${CMAKE_INSTALL_PREFIX}/include/mrcore/${DIR_INSTALL})
FILE(COPY ${header} DESTINATION ${CMAKE_INSTALL_PREFIX}/include/mrcore/${DIR_INSTALL})
ENDFOREACH()

###INSTALL mrcore.h
SET(MRCORE_H_FILE ${CMAKE_INSTALL_PREFIX}/include/mrcore/mrcore.h)
FILE(WRITE ${MRCORE_H_FILE} ${MRCORE_H})
