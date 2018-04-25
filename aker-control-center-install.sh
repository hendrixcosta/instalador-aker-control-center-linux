#!/bin/bash

defineColors() {
    red=$'\e[1;31m'
    green=$'\e[1;32m'
    yellow=$'\e[1;33m'
    blue=$'\e[1;34m'
    end=$'\e[0m'
}

downloadAker() {
    wget -q --show-progress  http://download.aker.com.br/prod/current/interface%20grafica/linux/acc32/akercontrolcenter-2.0.32-xx.tar.gz;
}

extractAker() {
    mkdir akercontrolcenter
    tar -xvzf akercontrolcenter-2.0.32-xx.tar.gz -C akercontrolcenter/ >/dev/null
}

installAkerControlCenter() {
    sudo chmod +x akercontrolcenter/AkerControlCenter-2.0.32-xx-linux-005.bin
    sudo chmod +x akercontrolcenter/AkerControlCenter-2.0.32-xx-linux-AkerFirewall_6.8.7-002.bin 

    sudo ./akercontrolcenter/AkerControlCenter-2.0.32-xx-linux-005.bin
    sudo ./akercontrolcenter/AkerControlCenter-2.0.32-xx-linux-AkerFirewall_6.8.7-002.bin 
}

installDependencies() {
    sudo dpkg --add-architecture i386
    sudo apt-get update
    sudo apt-get install -y libc6:i386 libstdc++6:i386 zlib1g:i386 libxml2:i386 libstdc++6:i386 libglib2.0-0:i386 libfreetype6:i386 libsm6:i386 libxi6:i386 libxrender1:i386 libxrandr2:i386 libxfixes3:i386 libxcursor1:i386 libxinerama1:i386 libfontconfig1:i386 libxslt1.1:i386 gstreamer1.0-x:i386 libsqlite3-0:i386 libgl1-mesa-glx:i386 libgssapi-krb5-2:i386 libqt4-xmlpatterns:i386   
    sudo cp /usr/local/aker/control_center2/lib/* /usr/lib >/dev/null 2>&1
}

defineColors

printf "${green}Downloading Aker control Center ${end}\n";
downloadAker

printf "\n${green}Criando pasta e extraindo arquivos${end}\n"
extractAker

printf "\n${green}Instalando AkerFirewall, por favor siga as instruções em tela${end}\n"
installAkerControlCenter

printf "\n${green}Instalando todas as dependencias para rodar o aker control center corretamente${end}\n"
installDependencies

printf "\n${green}Instalação finalizada com sucesso!!${end}"

