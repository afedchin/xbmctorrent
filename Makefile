NAME = plugin.video.xbmctorrent
GIT = git
GIT_VERSION = $(shell $(GIT) describe --tags --always)
VERSION = $(patsubst v%,%,$(GIT_VERSION))
ARCHS = \
	android_arm \
	android_x64 \
	android_x86 \
	darwin_x64 \
	linux_arm \
	linux_armv7 \
	linux_arm64 \
	linux_x64 \
	linux_x86 \
	windows_x64 \
	windows_x86

ZIP_SUFFIX = zip
ZIP_FILE = $(NAME)-$(VERSION).$(ZIP_SUFFIX)

all: clean zipfiles zip

.PHONY: $(ARCHS)

$(ARCHS):
	$(MAKE) clean_arch ZIP_SUFFIX=$@.zip
	$(MAKE) zip ARCHS=$@ ZIP_SUFFIX=$@.zip

bootstraper:
	mkdir -p $(NAME)
	sed s/\$$VERSION/0.0.1/g < addon.xml.tpl > $(NAME)/addon.xml
	cp fanart.jpg $(NAME)
	cp icon.png $(NAME)
	zip -9 -r $(NAME).zip $(NAME)
	rm -rf $(NAME)

addon.xml:
	sed s/\$$VERSION/$(VERSION)/g < addon.xml.tpl > $@

$(ZIP_FILE): addon.xml
	git archive --format zip --prefix $(NAME)/ --output $(ZIP_FILE) $(GIT_VERSION)
	mkdir -p $(NAME)/resources/bin
	ln -s -f `pwd`/addon.xml $(NAME)
	zip -9 -r -g $(ZIP_FILE) $(NAME)/addon.xml
	for arch in $(ARCHS); do \
		ln -s `pwd`/resources/bin/$$arch $(NAME)/resources/bin/$$arch; \
		zip -9 -r -g $(ZIP_FILE) $(NAME)/resources/bin/$$arch; \
	done
	rm -rf $(NAME)

zip: $(ZIP_FILE)

zipfiles: addon.xml
	for arch in $(ARCHS); do \
		$(MAKE) $$arch; \
	done

clean_arch:
	rm -f $(ZIP_FILE)

clean:
	for arch in $(ARCHS); do \
		$(MAKE) clean_arch ZIP_SUFFIX=$$arch.zip; \
	done
	rm -f $(ZIP_FILE)
	rm -rf $(NAME)
