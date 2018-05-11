#!/bin/bash
#
# Visual Studio Code upgrade procedure
#
FILENAME=$1
if [ "$FILENAME" == "" ]; then
    echo -e "\nUsage: $0 <vscode.filename.tar.gz>\n"
    exit 1
fi
if [ ! -f code ]; then
    echo -e "\nYou must execute the upgrade procedure from within Visual Studio Code root directory\n"
    exit 1
fi

echo -e "\nThis script will upgrade this Visual Studio Code installation"
echo -e "with this new upgrade: $FILENAME\n"
echo -en "Do you want to proceed [y|N] ? "
read -n 1 CONFIRM
if [ "$CONFIRM" != "y" ]; then
    exit 0
fi

mkdir tmp
cp $1 tmp/
cd tmp/
tar -zxvf $FILENAME   >/dev/null 2>&1
cd VSCode-linux-x64/
mv * ../../           2>/dev/null
rsync -a bin/ ../../bin/
rsync -a locales/ ../../locales/
rsync -a resources/ ../../resources/
cd ../..
rm -r tmp/

echo -e "\nInstallation Completed\n"
