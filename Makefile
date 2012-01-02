web=/Library/WebServer/Documents
javadoc=$(web)/javadoc
build=$(web)/build/javadoc-skin
sam-skin=assets/skins/sam

js=js/javadoc-skin.js

build: $(js) assets/core.css $(sam-skin)/skin.css $(build)/$(sam-skin)
	@echo [Concatenating and copying CSS skin...]
	cat assets/core.css > $(build)/$(sam-skin)/javadoc-skin.css
	cat $(sam-skin)/skin.css >> $(build)/$(sam-skin)/javadoc-skin.css

$(js): $(build)/js
	@echo [Copying JavaScript...]
	cp $(js) $(build)/$(js)

preview: build-skin
	@echo [Copying assets to webserver...] 
	cp -R java/java6 $(javadoc)
	cp -R skin.html $(javadoc)/java6

clean:
	rm -rf $(build)/*

$(build)/$(sam-skin):
	@echo [Creating empty CSS skin subdir...]
	mkdir -p $(build)/$(sam-skin)

$(build)/js:
	@echo [Creating empty JavaScript subdir...]
	mkdir -p $(build)/js

.PHONY: preview build-skin clean
