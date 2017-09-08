ROOT_DIR = ../..

SUBDIRS += \
	tests \

LOCAL_INCLUDES += \
	$(CONFIGURATION_DIR) \

LINK_FLAGS += \

LOCAL_LIBRARIES += \

SOURCES += \
	GlobalConfiguration.cpp \
	\
	Errno.cpp \
	Error.cpp \
	FloatUtils.cpp \
	MString.cpp \
	\
	BasisFactorization.cpp\
	Equation.cpp\
	EtaMatrix.cpp\
	FreshVariables.cpp \
	InputQuery.cpp\
	LPElement.cpp\
	MaxConstraint.cpp \
	PiecewiseLinearCaseSplit.cpp \
	PiecewiseLinearConstraint.cpp \
	Preprocessor.cpp \
	ReluConstraint.cpp \
	Statistics.cpp \
	TimeUtils.cpp \
	main.cpp \

TARGET = run_reluplex.elf

include $(ROOT_DIR)/Rules.mk

vpath %.cpp $(CONFIGURATION_DIR)
vpath %.cpp $(COMMON_DIR)
vpath %.cpp $(COMMON_REAL_DIR)

#
# Local Variables:
# compile-command: "make -C ../.. "
# tags-file-name: "../../TAGS"
# c-basic-offset: 4
# End:
#