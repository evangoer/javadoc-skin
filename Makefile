web=/Library/WebServer/Documents
javadoc=$(web)/javadoc
build=$(web)/build/javadoc-skin
sam=assets/skins/sam

js=js/javadoc-skin.js
css-core=assets/core.css 
css-sam=$(sam)/skin.css
css=$(css-core) $(css-sam)

build: $(js) $(css) 

$(css-core): $(build)/$(sam) 
	cat assets/core.css > $(build)/$(sam)/javadoc-skin.css

$(css-sam): $(build)/$(sam)
	cat $(sam)/skin.css >> $(build)/$(sam)/javadoc-skin.css

$(js): $(build)/js
	cp $(js) $(build)/$(js)

preview: build-skin
	cp -R java/java6 $(javadoc)
	cp -R skin.html $(javadoc)/java6

clean:
	rm -rf $(build)/*

$(build)/$(sam):
	mkdir -p $(build)/$(sam)

$(build)/js:
	mkdir -p $(build)/js

.PHONY: preview build-skin clean
