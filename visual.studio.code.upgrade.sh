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
#               v1.1 (2019/03)
#                   Visual Studio now warns about previous/older files so keeping them with an
#                   updated version doesn't seems to be nice anymore, a new "unsupported" label
#                   appears in the titlebar so I basically rewritten the whole thing.
#                   Now find+tar are the only things to do and previous rsyncing is gone
#               v1.0 (2018/06)
#                   Visual Studio Code gets upgraded every 2/3 weeks so I'm really getting
#                       tired of upgrading it manually, that's the reason of the script.
#                   rsync and cp to upgrade vscode-stable*64.tar.gz on a generic distro.
#                   rpm and deb packages are probably doing it with their specific upgrade flag
#
FILENAME=$1
if [ "$FILENAME" == "" ]; then
    echo -e "\nUsage:\n    $0 <vscode.filename.tar.gz>\n"
    echo "Possible values:"
    ls -a code-stable* 2>/dev/null |xargs -I % echo "    %"
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
echo -en "\nplease wait..."
# Remove everything except few files
find . -maxdepth 1  ! -name '.'         ! -name 'visual-*' \
                    ! -name 'visual.*'  ! -name 'code-*'   \
       -exec rm -rf {} +
# Extract new file
tar -zxf $FILENAME  >/dev/null 2>&1
mv VSCode-linux-x64/* .
rmdir VSCode-linux-x64

echo -e "\nInstallation Completed\n"
