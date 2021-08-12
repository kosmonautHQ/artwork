SOURCES=$(wildcard logos/src/*.svg)
TARGETS=$(patsubst logos/src/%.svg,logos/svg/%.svg,$(SOURCES)) \
	$(patsubst logos/src/%.svg,logos/png/%_512.png,$(SOURCES)) \
	$(patsubst logos/src/%.svg,logos/png/%_256.png,$(SOURCES)) \
	$(patsubst logos/src/%.svg,logos/png/%_128.png,$(SOURCES)) \
	$(patsubst logos/src/%.svg,logos/png/%_64.png,$(SOURCES)) \
	$(patsubst logos/src/%.svg,logos/png/%_32.png,$(SOURCES)) \
	$(patsubst logos/src/%.svg,logos/png/%_16.png,$(SOURCES)) \

all: $(TARGETS)

logos/svg/%.svg : logos/src/%.svg
	inkscape $< --vacuum-defs --export-plain-svg=$@

logos/png/%_512.png : logos/src/%.svg
	inkscape $< --export-type="png" --export-width 512 --export-filename=$@

logos/png/%_256.png : logos/src/%.svg
	inkscape $< --export-type="png" --export-width 256 --export-filename=$@

logos/png/%_128.png : logos/src/%.svg
	inkscape $< --export-type="png" --export-width 128 --export-filename=$@

logos/png/%_64.png : logos/src/%.svg
	inkscape $< --export-type="png" --export-width 64 --export-filename=$@

logos/png/%_32.png : logos/src/%.svg
	inkscape $< --export-type="png" --export-width 32 --export-filename=$@

logos/png/%_16.png : logos/src/%.svg
	inkscape $< --export-type="png" --export-width 16 --export-filename=$@
