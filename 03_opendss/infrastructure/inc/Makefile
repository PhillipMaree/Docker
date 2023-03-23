UNAME_S        := $(shell uname)
ARCH_S         := $(shell uname -m)

SOURCE_PATH     = src/
LIBRARY_PATH    = lib/
INCLUDE_PATH    = inc/

OPENDSS_DIR     = $(SOURCE_PATH)OpenDSS/
OPENDSS_URL     = https://svn.code.sf.net/p/electricdss/code/trunk/Version8/Source

KLUSOLVE_DIR    = $(SOURCE_PATH)KLUSolve/
KLUSOLVE_URL    = https://svn.code.sf.net/p/klusolve/code/

.PHONY: all
all:
	
	make KLUSolve
	make OpenDSS

# OpenDSS
.PHONY: OpenDSS 
OpenDSS:
	svn checkout $(OPENDSS_URL) $(OPENDSS_DIR); \
    mkdir -p $(OPENDSS_DIR)CMD/units; \
    && cd $(OPENDSS_DIR)CMD && bash build.sh	

# KLUSolve 
.PHONY: KLUSolve
KLUSolve:
	svn checkout $(KLUSOLVE_URL) $(KLUSOLVE_DIR); \
    mkdir -p $(KLUSOLVE_DIR)/build \
    && cd $(KLUSOLVE_DIR)/build \
    && cmake -DCMAKE_BUILD_TYPE=Release .. \
    && make \
    && make install \

.PHONY: test-KLUSolve

test-KLUSolve: $(KLUSOLVE_DIR)
	cd $(KLUSOLVE_DIR)/Test \
    && unzip -o kundert_test_matrices.zip \
    && bash run_concat.sh \
    && cat summary.out \
    && rm -rf *.mat
		

	