preview: build-skin
	@echo [Copying assets to webserver...] 
	cp js/javadoc-skin.js /Library/WebServer/Documents/javadoc/js
	cp -R java/java6 /Library/WebServer/Documents/javadoc
	cp -R skin.html /Library/WebServer/Documents/javadoc/java6

build-skin: assets/core.css assets/skins/sam/skin.css
	@echo [Concatenating CSS skin...]
	cat assets/core.css > /Library/WebServer/Documents/javadoc/assets/skins/sam/javadoc-skin.css
	cat assets/skins/sam/skin.css >> /Library/WebServer/Documents/javadoc/assets/skins/sam/javadoc-skin.css

.PHONY: preview build-skin
