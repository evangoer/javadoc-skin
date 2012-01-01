web=/Library/WebServer/Documents
javadoc=$(web)/javadoc
build=$(web)/build/javadoc-skin
sam-skin=assets/skins/sam

preview: build-skin
	@echo [Copying assets to webserver...] 
	cp -R java/java6 $(javadoc)
	cp -R skin.html $(javadoc)/java6

build-skin: assets/core.css assets/skins/sam/skin.css
	@echo [Concatenating CSS skin...]
	cp js/javadoc-skin.js $(build)/js
	cat assets/core.css > $(build)/$(sam-skin)/javadoc-skin.css
	cat $(sam-skin)/skin.css >> $(build)/$(sam-skin)/javadoc-skin.css

.PHONY: preview build-skin
