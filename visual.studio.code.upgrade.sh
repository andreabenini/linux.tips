#!/bin/bash
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#
# @description  Visual Studio Code upgrade procedure
# @author       Andrea Benini  (andreabenini at google gmail dOt com)
# @date         2018/06
#
# @license      GPLv3
# @see          History
#               v1.0 (2018/06)
#                   Visual Studio Code gets upgraded every 2/3 weeks so I'm really getting
#                       tired of upgrading it manually, that's the reason of the script.
#                   rsync and cp to upgrade a generic vscode-stable*64.tar.gz on a generic distro.
#                   Folks using rpm and debs are probably doing it with their specific upgrade flag
#
FILENAME=$1
if [ "$FILENAME" == "" ]; then
    echo -e "\nUsage:\n    $0 <vscode.filename.tar.gz>\n"
    echo "Possible values:"
    ls -a code-stable* |xargs -I % echo "    %"
    echo ""
    exit 1
fi
if [ ! -f code ]; then
    echo -e "\nYou must execute the upgrade procedure from within Visual Studio Code root directory\n"
    exit 1
fi

echo -e "\nThis script will upgrade this Visual Studio Code installation"
echo -e "with: $FILENAME\n"
echo -en "Do you want to proceed [y|N] ? "
read -n 1 CONFIRM
if [ "$CONFIRM" != "y" ]; then
    exit 0
fi
echo -e "\nplease wait..."
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

echo -e "Installation Completed\n"
