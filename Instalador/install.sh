#!/bin/bash
# INSTALADO --- ACTULIZADO EL 12-01-2023 --By @Kalix1
texto=( "CHUKK-SCRIPT" )
declare -A url=( [sshd_config]="https://raw.githubusercontent.com/NetVPS/Multi-Script/main/Otros/sshd_config" [version]="https://raw.githubusercontent.com/NetVPS/Multi-Script/main/Vercion" )
clear && clear
colores="$(pwd)/colores"
rm -rf ${colores}
wget -O ${colores} "https://raw.githubusercontent.com/NetVPS/Multi-Script/main/Otros/colores" &>/dev/null
[[ ! -e ${colores} ]] && exit
chmod +x ${colores} &>/dev/null
source ${colores}
rm $(pwd)/$0 &>/dev/null
#-- VERIFICAR ROOT
if [ $(whoami) != 'root' ]; then
  echo ""
  echo -e "\e[1;31m NECESITAS SER USER ROOT PARA EJECUTAR EL SCRIPT \n\n\e[97m                DIGITE: \e[1;32m sudo su\n"
  exit
fi
os_system() {
  system=$(cat -n /etc/issue | grep 1 | cut -d ' ' -f6,7,8 | sed 's/1//' | sed 's/      //')
  distro=$(echo "$system" | awk '{print $1}')

  case $distro in
  Debian) vercion=$(echo $system | awk '{print $3}' | cut -d '.' -f1) ;;
  Ubuntu) vercion=$(echo $system | awk '{print $2}' | cut -d '.' -f1,2) ;;
  esac
}
repo() {
  link="https://raw.githubusercontent.com/NetVPS/Multi-Script/main/Source-List/$1.list"
  case $1 in
  8 | 9 | 10 | 11 | 16.04 | 18.04 | 20.04 | 20.10 | 21.04 | 21.10 | 22.04) wget -O /etc/apt/sources.list ${link} &>/dev/null ;;
  esac
}
## PRIMER PASO DE INSTALACION
install_inicial() {
  clear && clear
  #--VERIFICAR IP MANUAL
  tu_ip() {
    echo ""
    echo -ne "\e[1;96m #Digite tu IP Publica (IPV4): \e[32m" && read IP
    val_ip() {
      local ip=$IP
      local stat=1
      if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        OIFS=$IFS
        IFS='.'
        ip=($ip)
        IFS=$OIFS
        [[ ${ip[0]} -le 255 && ${ip[1]} -le 255 && ${ip[2]} -le 255 && ${ip[3]} -le 255 ]]
        stat=$?
      fi
      return $stat
    }
    if val_ip $IP; then
      echo "$IP" >/root/.ssh/authrized_key.reg
    else
      echo ""
      echo -e "\e[31mLa IP Digitada no es valida, Verifiquela"
      echo ""
      sleep 5s
      fun_ip
    fi
  }
  #CONFIGURAR SSH-ROOT PRINCIPAL AMAZON, GOOGLE
  pass_root() {
    wget -O /etc/ssh/sshd_config "${url[sshd_config]}" >/dev/null 2>&1
    chmod +rwx /etc/ssh/sshd_config
    service ssh restart
    msgi -bar
    echo -ne "\e[1;97m DIGITE NUEVA CONTRASEÑA:  \e[1;31m" && read pass
    (
      echo $pass
      echo $pass
    ) | passwd root 2>/dev/null
    sleep 1s
    msgi -bar
    echo -e "\e[1;94m     CONTRASEÑA AGREGADA O EDITADA CORECTAMENTE"
    echo -e "\e[1;97m TU CONTRASEÑA ROOT AHORA ES: \e[41m $pass \e[0;37m"

  }
  #-- VERIFICAR VERSION
  v1=$(curl -sSL "${url[version]}")
  echo "$v1" >/etc/version_instalacion
  v22=$(cat /etc/version_instalacion)
  vesaoSCT="\e[1;31m [ \e[1;32m( $v22 )\e[1;97m\e[1;31m ]"
  #-- CONFIGURACION BASICA
  os_system
  repo "${vercion}"
  msgi -bar2
  echo -e " \e[5m\e[1;100m   =====>> ►►     ${texto[0]}     ◄◄ <<=====    \e[1;37m"
  msgi -bar2
  #-- VERIFICAR VERSION
  msgi -ama "   PREPARANDO INSTALACION | VERSION: $vesaoSCT"
  ## PAQUETES-UBUNTU PRINCIPALES
  echo ""
  echo -e "\e[1;97m         🔎 IDENTIFICANDO SISTEMA OPERATIVO"
  echo -e "\e[1;32m                 | $distro $vercion |"
  echo ""
  echo -e "\e[1;97m        ◽️ DESACTIVANDO PASS ALFANUMERICO "
  [[ $(dpkg --get-selections | grep -w "libpam-cracklib" | head -1) ]] || barra_intallb "apt-get install libpam-cracklib -y &>/dev/null"
  echo -e '# Modulo Pass Simple
password [success=1 default=ignore] pam_unix.so obscure sha512
password requisite pam_deny.so
password required pam_permit.so' >/etc/pam.d/common-password && chmod +x /etc/pam.d/common-password
  [[ $(dpkg --get-selections | grep -w "libpam-cracklib" | head -1) ]] && barra_intallb "date"
  service ssh restart >/dev/null 2>&1
  echo ""
  msgi -bar2
  fun_ip() {
    TUIP=$(wget -qO- ifconfig.me)
    echo "$TUIP" >/root/.ssh/authrized_key.reg
    echo -e "\e[1;97m ESTA ES TU IP PUBLICA? \e[32m$TUIP"
    msgi -bar2
    echo -ne "\e[1;97m Seleccione  \e[1;31m[\e[1;93m S \e[1;31m/\e[1;93m N \e[1;31m]\e[1;97m: \e[1;93m" && read tu_ip
    #read -p " Seleccione [ S / N ]: " tu_ip
    [[ "$tu_ip" = "n" || "$tu_ip" = "N" ]] && tu_ip
  }
  fun_ip
  msgi -bar2
  echo -e "\e[1;93m             AGREGAR Y EDITAR PASS ROOT\e[1;97m"
  msgi -bar
  echo -e "\e[1;97m CAMBIAR PASS ROOT? \e[32m"
  msgi -bar2
  echo -ne "\e[1;97m Seleccione  \e[1;31m[\e[1;93m S \e[1;31m/\e[1;93m N \e[1;31m]\e[1;97m: \e[1;93m" && read pass_root
  #read -p " Seleccione [ S / N ]: " tu_ip
  [[ "$pass_root" = "s" || "$pass_root" = "S" ]] && pass_root
  msgi -bar2
  echo -e "\e[1;93m\a\a\a      SE PROCEDERA A INSTALAR LAS ACTULIZACIONES\n PERTINENTES DEL SISTEMA, ESTE PROCESO PUEDE TARDAR\n VARIOS MINUTOS Y PUEDE PEDIR ALGUNAS CONFIRMACIONES \e[0;37m"
  msgi -bar
  read -t 120 -n 1 -rsp $'\e[1;97m           Preciona Enter Para continuar\n'
  clear && clear
  apt update
  apt upgrade -y
}
dependencias() {
  rm -rf /root/paknoinstall.log >/dev/null 2>&1
  rm -rf /root/packinstall.log >/dev/null 2>&1
  dpkg --configure -a >/dev/null 2>&1
  apt -f install -y >/dev/null 2>&1
  soft="sudo bsdmainutils zip screen unzip ufw curl python python3 python3-pip openssl cron iptables lsof pv boxes at mlocate gawk bc jq curl npm nodejs socat netcat netcat-traditional net-tools cowsay figlet lolcat apache2"
  for i in $soft; do
    paquete="$i"
    echo -e "\e[1;97m        INSTALANDO PAQUETE \e[93m ------ \e[36m $i"
    barra_intall "apt-get install $i -y"
  done
  rm -rf /root/paknoinstall.log >/dev/null 2>&1
  rm -rf /root/packinstall.log >/dev/null 2>&1
}

install_paquetes() {
  clear && clear
  /bin/cp /etc/skel/.bashrc ~/
  #------- BARRA DE ESPERA
  msgi -bar2
  echo -e " \e[5m\e[1;100m   =====>> ►►     ${texto[0]}    ◄◄ <<=====    \e[1;37m"
  msgi -bar
  echo -e "   \e[1;41m    -- INSTALACION PAQUETES FALTANTES --    \e[49m"
  msgi -bar
  dependencias
  sed -i "s;Listen 80;Listen 81;g" /etc/apache2/ports.conf >/dev/null 2>&1
  service apache2 restart >/dev/null 2>&1
  [[ $(sudo lsof -i :81) ]] || ESTATUSP=$(echo -e "\e[1;91m      >>>  FALLO DE INSTALACION EN APACHE <<<") &>/dev/null
  [[ $(sudo lsof -i :81) ]] && ESTATUSP=$(echo -e "\e[1;92m          PUERTO APACHE ACTIVO CON EXITO") &>/dev/null
  echo ""
  echo -e "$ESTATUSP"
  echo ""
  echo -e "\e[1;97m        REMOVIENDO PAQUETES OBSOLETOS - \e[1;32m OK"
  apt autoremove -y &>/dev/null
  echo iptables-persistent iptables-persistent/autosave_v4 boolean true | sudo debconf-set-selections
  echo iptables-persistent iptables-persistent/autosave_v6 boolean true | sudo debconf-set-selections
  msgi -bar2
  read -t 30 -n 1 -rsp $'\e[1;97m           Preciona Enter Para continuar\n'
}
clear && clear
/bin/cp /etc/skel/.bashrc ~/
/bin/cp /etc/skel/.bashrc /etc/bash.bashrc
chukk(){
mkdir -p/etc/adm-lite /etc/adm-lite

	for x in `echo "PDirect.py PPriv.py menu_inst payloads PGet.py PPub.py ferramentas menu msg reseller POpen.py cabecalho usercodes"`; do
	wget -O /etc/adm-lite/$x https://raw.githubusercontent.com/drowkid01/ChuKK-SCRIPT/main/exec/files/$x &> /dev/null
	chmod +x /etc/adm-lite/$x
	done
read -p "slogan: " slogan
read -p "name: " nam
echo -e "$slogan" > /etc/adm-lite/menu_credito
echo -e "$name" > /etc/adm-lite/name
echo "cd /etc/adm-lite;bash menu" > /bin/menu
chmod +rwx /bin/menu
ln -s /bin/menu /bin/chukk
  echo -e "\e[1;97m        USE EL COMANDO: chukk o menu\e[1;32m OK"


}
case $1 in
--init) install_inicial;install_paquetes;chukk;;
esac
