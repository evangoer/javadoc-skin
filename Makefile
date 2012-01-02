web=/Library/WebServer/Documents
javadoc=$(web)/javadoc
build=$(web)/build/javadoc-skin
sam=assets/skins/sam

js=$(build)/js/javadoc-skin.js
css=$(build)/$(sam)/javadoc-skin.css
skin=$(javadoc)/java6/skin.html

build: $(css) $(js) $(skin)

clean:
	rm -rf $(build)/*
	rm -f $(javadoc)/java6/skin.html

$(css): assets/core.css $(sam)/skin.css
	mkdir -p $(build)/$(sam)
	cat assets/core.css > $(build)/$(sam)/javadoc-skin.css
	cat $(sam)/skin.css >> $(build)/$(sam)/javadoc-skin.css

$(js): js/javadoc-skin.js
	mkdir -p $(build)/js
	cp js/javadoc-skin.js $(build)/js

$(skin): skin.html
	cp skin.html $(javadoc)/java6
	
# TODO: This target should probably build javadoc from src.
build-javadoc:
	mkdir $(javadoc) 
	cp -R java/java6 $(javadoc)

.PHONY: build-javadoc clean build
