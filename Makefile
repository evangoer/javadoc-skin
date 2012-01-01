preview: skin.html
	@echo Copying assets to webserver... 
	cp js/javadoc-skin.js /Library/WebServer/Documents/javadoc/js
	cp assets/javadoc-skin.css /Library/WebServer/Documents/javadoc/assets
	cp -R java/java6 /Library/WebServer/Documents/javadoc
	cp -R skin.html /Library/WebServer/Documents/javadoc/java6

.PHONY: preview
