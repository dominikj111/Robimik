#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=cof
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Robimik_Firmware_2_0.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Robimik_Firmware_2_0.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=delay.c sonar_modul.c bluetooth_modul.c engine_modul.c analog_modul.c main.c routines.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/delay.p1 ${OBJECTDIR}/sonar_modul.p1 ${OBJECTDIR}/bluetooth_modul.p1 ${OBJECTDIR}/engine_modul.p1 ${OBJECTDIR}/analog_modul.p1 ${OBJECTDIR}/main.p1 ${OBJECTDIR}/routines.p1
POSSIBLE_DEPFILES=${OBJECTDIR}/delay.p1.d ${OBJECTDIR}/sonar_modul.p1.d ${OBJECTDIR}/bluetooth_modul.p1.d ${OBJECTDIR}/engine_modul.p1.d ${OBJECTDIR}/analog_modul.p1.d ${OBJECTDIR}/main.p1.d ${OBJECTDIR}/routines.p1.d

# Object Files
OBJECTFILES=${OBJECTDIR}/delay.p1 ${OBJECTDIR}/sonar_modul.p1 ${OBJECTDIR}/bluetooth_modul.p1 ${OBJECTDIR}/engine_modul.p1 ${OBJECTDIR}/analog_modul.p1 ${OBJECTDIR}/main.p1 ${OBJECTDIR}/routines.p1

# Source Files
SOURCEFILES=delay.c sonar_modul.c bluetooth_modul.c engine_modul.c analog_modul.c main.c routines.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
	${MAKE} ${MAKE_OPTIONS} -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/Robimik_Firmware_2_0.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=16F877A
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/delay.p1: delay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	${MP_CC} --pass1 delay.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}" -N31 --warn=0 --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+stackwarn,+clib --summary=default,-psect,-class,+mem,-hex --opt=default,+asm,-asmfile,9 -D__DEBUG --debugger=pickit3  --double=24 --float=24 --addrqual=ignore --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"
	@${MP_CC} --scandep  delay.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}" -N31 --warn=0 --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+stackwarn,+clib --opt=default,+asm,-asmfile,9 -D__DEBUG --debugger=pickit3  --double=24 --float=24 --addrqual=ignore --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"
	@echo ${OBJECTDIR}/delay.p1: > ${OBJECTDIR}/delay.p1.d
	@cat ${OBJECTDIR}/delay.dep >> ${OBJECTDIR}/delay.p1.d
	@${FIXDEPS} "${OBJECTDIR}/delay.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/sonar_modul.p1: sonar_modul.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	${MP_CC} --pass1 sonar_modul.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}" -N31 --warn=0 --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+stackwarn,+clib --summary=default,-psect,-class,+mem,-hex --opt=default,+asm,-asmfile,9 -D__DEBUG --debugger=pickit3  --double=24 --float=24 --addrqual=ignore --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"
	@${MP_CC} --scandep  sonar_modul.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}" -N31 --warn=0 --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+stackwarn,+clib --opt=default,+asm,-asmfile,9 -D__DEBUG --debugger=pickit3  --double=24 --float=24 --addrqual=ignore --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"
	@echo ${OBJECTDIR}/sonar_modul.p1: > ${OBJECTDIR}/sonar_modul.p1.d
	@cat ${OBJECTDIR}/sonar_modul.dep >> ${OBJECTDIR}/sonar_modul.p1.d
	@${FIXDEPS} "${OBJECTDIR}/sonar_modul.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/bluetooth_modul.p1: bluetooth_modul.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	${MP_CC} --pass1 bluetooth_modul.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}" -N31 --warn=0 --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+stackwarn,+clib --summary=default,-psect,-class,+mem,-hex --opt=default,+asm,-asmfile,9 -D__DEBUG --debugger=pickit3  --double=24 --float=24 --addrqual=ignore --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"
	@${MP_CC} --scandep  bluetooth_modul.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}" -N31 --warn=0 --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+stackwarn,+clib --opt=default,+asm,-asmfile,9 -D__DEBUG --debugger=pickit3  --double=24 --float=24 --addrqual=ignore --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"
	@echo ${OBJECTDIR}/bluetooth_modul.p1: > ${OBJECTDIR}/bluetooth_modul.p1.d
	@cat ${OBJECTDIR}/bluetooth_modul.dep >> ${OBJECTDIR}/bluetooth_modul.p1.d
	@${FIXDEPS} "${OBJECTDIR}/bluetooth_modul.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/engine_modul.p1: engine_modul.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	${MP_CC} --pass1 engine_modul.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}" -N31 --warn=0 --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+stackwarn,+clib --summary=default,-psect,-class,+mem,-hex --opt=default,+asm,-asmfile,9 -D__DEBUG --debugger=pickit3  --double=24 --float=24 --addrqual=ignore --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"
	@${MP_CC} --scandep  engine_modul.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}" -N31 --warn=0 --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+stackwarn,+clib --opt=default,+asm,-asmfile,9 -D__DEBUG --debugger=pickit3  --double=24 --float=24 --addrqual=ignore --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"
	@echo ${OBJECTDIR}/engine_modul.p1: > ${OBJECTDIR}/engine_modul.p1.d
	@cat ${OBJECTDIR}/engine_modul.dep >> ${OBJECTDIR}/engine_modul.p1.d
	@${FIXDEPS} "${OBJECTDIR}/engine_modul.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/analog_modul.p1: analog_modul.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	${MP_CC} --pass1 analog_modul.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}" -N31 --warn=0 --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+stackwarn,+clib --summary=default,-psect,-class,+mem,-hex --opt=default,+asm,-asmfile,9 -D__DEBUG --debugger=pickit3  --double=24 --float=24 --addrqual=ignore --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"
	@${MP_CC} --scandep  analog_modul.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}" -N31 --warn=0 --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+stackwarn,+clib --opt=default,+asm,-asmfile,9 -D__DEBUG --debugger=pickit3  --double=24 --float=24 --addrqual=ignore --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"
	@echo ${OBJECTDIR}/analog_modul.p1: > ${OBJECTDIR}/analog_modul.p1.d
	@cat ${OBJECTDIR}/analog_modul.dep >> ${OBJECTDIR}/analog_modul.p1.d
	@${FIXDEPS} "${OBJECTDIR}/analog_modul.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main.p1: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	${MP_CC} --pass1 main.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}" -N31 --warn=0 --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+stackwarn,+clib --summary=default,-psect,-class,+mem,-hex --opt=default,+asm,-asmfile,9 -D__DEBUG --debugger=pickit3  --double=24 --float=24 --addrqual=ignore --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"
	@${MP_CC} --scandep  main.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}" -N31 --warn=0 --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+stackwarn,+clib --opt=default,+asm,-asmfile,9 -D__DEBUG --debugger=pickit3  --double=24 --float=24 --addrqual=ignore --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"
	@echo ${OBJECTDIR}/main.p1: > ${OBJECTDIR}/main.p1.d
	@cat ${OBJECTDIR}/main.dep >> ${OBJECTDIR}/main.p1.d
	@${FIXDEPS} "${OBJECTDIR}/main.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/routines.p1: routines.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	${MP_CC} --pass1 routines.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}" -N31 --warn=0 --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+stackwarn,+clib --summary=default,-psect,-class,+mem,-hex --opt=default,+asm,-asmfile,9 -D__DEBUG --debugger=pickit3  --double=24 --float=24 --addrqual=ignore --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"
	@${MP_CC} --scandep  routines.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}" -N31 --warn=0 --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+stackwarn,+clib --opt=default,+asm,-asmfile,9 -D__DEBUG --debugger=pickit3  --double=24 --float=24 --addrqual=ignore --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"
	@echo ${OBJECTDIR}/routines.p1: > ${OBJECTDIR}/routines.p1.d
	@cat ${OBJECTDIR}/routines.dep >> ${OBJECTDIR}/routines.p1.d
	@${FIXDEPS} "${OBJECTDIR}/routines.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/delay.p1: delay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	${MP_CC} --pass1 delay.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}" -N31 --warn=0 --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+stackwarn,+clib --summary=default,-psect,-class,+mem,-hex --opt=default,+asm,-asmfile,9  --double=24 --float=24 --addrqual=ignore --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"
	@${MP_CC} --scandep  delay.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}" -N31 --warn=0 --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+stackwarn,+clib --opt=default,+asm,-asmfile,9  --double=24 --float=24 --addrqual=ignore --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"
	@echo ${OBJECTDIR}/delay.p1: > ${OBJECTDIR}/delay.p1.d
	@cat ${OBJECTDIR}/delay.dep >> ${OBJECTDIR}/delay.p1.d
	@${FIXDEPS} "${OBJECTDIR}/delay.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/sonar_modul.p1: sonar_modul.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	${MP_CC} --pass1 sonar_modul.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}" -N31 --warn=0 --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+stackwarn,+clib --summary=default,-psect,-class,+mem,-hex --opt=default,+asm,-asmfile,9  --double=24 --float=24 --addrqual=ignore --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"
	@${MP_CC} --scandep  sonar_modul.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}" -N31 --warn=0 --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+stackwarn,+clib --opt=default,+asm,-asmfile,9  --double=24 --float=24 --addrqual=ignore --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"
	@echo ${OBJECTDIR}/sonar_modul.p1: > ${OBJECTDIR}/sonar_modul.p1.d
	@cat ${OBJECTDIR}/sonar_modul.dep >> ${OBJECTDIR}/sonar_modul.p1.d
	@${FIXDEPS} "${OBJECTDIR}/sonar_modul.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/bluetooth_modul.p1: bluetooth_modul.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	${MP_CC} --pass1 bluetooth_modul.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}" -N31 --warn=0 --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+stackwarn,+clib --summary=default,-psect,-class,+mem,-hex --opt=default,+asm,-asmfile,9  --double=24 --float=24 --addrqual=ignore --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"
	@${MP_CC} --scandep  bluetooth_modul.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}" -N31 --warn=0 --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+stackwarn,+clib --opt=default,+asm,-asmfile,9  --double=24 --float=24 --addrqual=ignore --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"
	@echo ${OBJECTDIR}/bluetooth_modul.p1: > ${OBJECTDIR}/bluetooth_modul.p1.d
	@cat ${OBJECTDIR}/bluetooth_modul.dep >> ${OBJECTDIR}/bluetooth_modul.p1.d
	@${FIXDEPS} "${OBJECTDIR}/bluetooth_modul.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/engine_modul.p1: engine_modul.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	${MP_CC} --pass1 engine_modul.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}" -N31 --warn=0 --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+stackwarn,+clib --summary=default,-psect,-class,+mem,-hex --opt=default,+asm,-asmfile,9  --double=24 --float=24 --addrqual=ignore --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"
	@${MP_CC} --scandep  engine_modul.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}" -N31 --warn=0 --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+stackwarn,+clib --opt=default,+asm,-asmfile,9  --double=24 --float=24 --addrqual=ignore --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"
	@echo ${OBJECTDIR}/engine_modul.p1: > ${OBJECTDIR}/engine_modul.p1.d
	@cat ${OBJECTDIR}/engine_modul.dep >> ${OBJECTDIR}/engine_modul.p1.d
	@${FIXDEPS} "${OBJECTDIR}/engine_modul.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/analog_modul.p1: analog_modul.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	${MP_CC} --pass1 analog_modul.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}" -N31 --warn=0 --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+stackwarn,+clib --summary=default,-psect,-class,+mem,-hex --opt=default,+asm,-asmfile,9  --double=24 --float=24 --addrqual=ignore --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"
	@${MP_CC} --scandep  analog_modul.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}" -N31 --warn=0 --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+stackwarn,+clib --opt=default,+asm,-asmfile,9  --double=24 --float=24 --addrqual=ignore --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"
	@echo ${OBJECTDIR}/analog_modul.p1: > ${OBJECTDIR}/analog_modul.p1.d
	@cat ${OBJECTDIR}/analog_modul.dep >> ${OBJECTDIR}/analog_modul.p1.d
	@${FIXDEPS} "${OBJECTDIR}/analog_modul.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main.p1: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	${MP_CC} --pass1 main.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}" -N31 --warn=0 --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+stackwarn,+clib --summary=default,-psect,-class,+mem,-hex --opt=default,+asm,-asmfile,9  --double=24 --float=24 --addrqual=ignore --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"
	@${MP_CC} --scandep  main.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}" -N31 --warn=0 --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+stackwarn,+clib --opt=default,+asm,-asmfile,9  --double=24 --float=24 --addrqual=ignore --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"
	@echo ${OBJECTDIR}/main.p1: > ${OBJECTDIR}/main.p1.d
	@cat ${OBJECTDIR}/main.dep >> ${OBJECTDIR}/main.p1.d
	@${FIXDEPS} "${OBJECTDIR}/main.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/routines.p1: routines.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	${MP_CC} --pass1 routines.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}" -N31 --warn=0 --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+stackwarn,+clib --summary=default,-psect,-class,+mem,-hex --opt=default,+asm,-asmfile,9  --double=24 --float=24 --addrqual=ignore --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"
	@${MP_CC} --scandep  routines.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}" -N31 --warn=0 --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+stackwarn,+clib --opt=default,+asm,-asmfile,9  --double=24 --float=24 --addrqual=ignore --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"
	@echo ${OBJECTDIR}/routines.p1: > ${OBJECTDIR}/routines.p1.d
	@cat ${OBJECTDIR}/routines.dep >> ${OBJECTDIR}/routines.p1.d
	@${FIXDEPS} "${OBJECTDIR}/routines.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Robimik_Firmware_2_0.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE) -odist/${CND_CONF}/${IMAGE_TYPE}/Robimik_Firmware_2_0.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  -mdist/${CND_CONF}/${IMAGE_TYPE}/Robimik_Firmware_2_0.X.${IMAGE_TYPE}.map --summary=default,-psect,-class,+mem,-hex --chip=$(MP_PROCESSOR_OPTION) -P --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+stackwarn,+clib --summary=default,-psect,-class,+mem,-hex --opt=default,+asm,-asmfile,9 -D__DEBUG --debugger=pickit3 -N31 --warn=0  --double=24 --float=24 --addrqual=ignore --mode=lite --output=default,-inhx032 -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s" ${OBJECTFILES_QUOTED_IF_SPACED}  
	@${RM} dist/${CND_CONF}/${IMAGE_TYPE}/Robimik_Firmware_2_0.X.${IMAGE_TYPE}.hex
else
dist/${CND_CONF}/${IMAGE_TYPE}/Robimik_Firmware_2_0.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE) -odist/${CND_CONF}/${IMAGE_TYPE}/Robimik_Firmware_2_0.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  -mdist/${CND_CONF}/${IMAGE_TYPE}/Robimik_Firmware_2_0.X.${IMAGE_TYPE}.map --summary=default,-psect,-class,+mem,-hex --chip=$(MP_PROCESSOR_OPTION) -P --runtime=default,+clear,+init,-keep,+osccal,-resetbits,-download,-stackcall,+stackwarn,+clib --summary=default,-psect,-class,+mem,-hex --opt=default,+asm,-asmfile,9 -N31 --warn=0  --double=24 --float=24 --addrqual=ignore --mode=lite --output=default,-inhx032 -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s" ${OBJECTFILES_QUOTED_IF_SPACED}  
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
