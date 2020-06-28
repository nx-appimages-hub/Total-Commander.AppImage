SOURCE="https://www.playonlinux.com/wine/binaries/linux-amd64/PlayOnLinux-wine-3.4-linux-amd64.pol"
DESTINATION="wine.tar.bz2"
OUTPUT="Total-Commander.AppImage"


all:
	wget --output-document=${DESTINATION} --continue ${SOURCE}
	tar xfvj ${DESTINATION}
	cp -r wineversion/3.4 AppDir/wine
	
	
	chmod +x AppDir/AppRun
	export ARCH=x86_64 && ./bin/appimagetool.AppImage AppDir $(OUTPUT)
	chmod +x $(OUTPUT)
	
	rm -rf ./${DESTINATION}
	rm -rf ./wineversion
	rm -rf ./AppDir/wine
	rm -rf ./playonlinux
	rm -rf ./files
