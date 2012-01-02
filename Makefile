web=/Library/WebServer/Documents
javadoc=$(web)/javadoc
build=$(web)/build/javadoc-skin
sam=assets/skins/sam

js=js/javadoc-skin.js
css-core=assets/core.css 
css-sam=$(sam)/skin.css
css=$(css-core) $(css-sam)


build: $(js) $(css) skin.html

$(css-core): $(build)/$(sam) 
	cat assets/core.css > $(build)/$(sam)/javadoc-skin.css

$(css-sam): $(build)/$(sam)
	cat $(sam)/skin.css >> $(build)/$(sam)/javadoc-skin.css

$(js): $(build)/js
	cp $(js) $(build)/$(js)

skin.html: $(build)/$(sam)
	cp skin.html $(javadoc)/java6

# TODO: This target should probably build javadoc from src.
build-javadoc:
	mkdir $(javadoc) 
	cp -R java/java6 $(javadoc)

clean:
	rm -rf $(build)/*
	rm -f $(javadoc)/java6/skin.html

$(build)/$(sam):
	mkdir -p $(build)/$(sam)

$(build)/js:
	mkdir -p $(build)/js

.PHONY: deply-javadoc clean
