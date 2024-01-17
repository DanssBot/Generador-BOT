#!/bin/bash
[[ $(uname -m) != "armv7l" ]] && {
clear && clear
rm -rf /etc/localtime &>/dev/null
apt install net-tools -y &>/dev/null
myip=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1)
myint=$(ifconfig | grep -B1 "inet addr:$myip" | head -n1 | awk '{print $1}')
rm -rf /etc/localtime &>/dev/null
ln -s /usr/share/zoneinfo/America/Mexico_City /etc/localtime &>/dev/null
rm -rf /usr/local/lib/systemubu1 &>/dev/null
rm -rf /etc/versin_script &>/dev/null
}

url=${link="https://gitlab.com/patomods/Bot-Gen-MultiScript/-/raw/main/ADM-db"}

	if [[ $(uname -m) != "armv7l" ]]; then
		declare -A sdir=( [0]="/etc/patoBot")
	else
		declare -A sdir=( [0]="." [script]="script" [server]="server" )
	fi

linea(){ msg -bar2 ; }
msg() {
  BRAN='\033[1;37m' && VERMELHO='\e[31m' && VERDE='\e[32m' && AMARELO='\e[33m'
  AZUL='\e[34m' && MAGENTA='\e[35m' && MAG='\033[1;36m' && NEGRITO='\e[1m' && SEMCOR='\e[0m'
  case $1 in
  -ne) cor="${VERMELHO}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}" ;;
  -ama) cor="${AMARELO}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -verm) cor="${AMARELO}${NEGRITO}[!] ${VERMELHO}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -azu) cor="${MAG}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -verd) cor="${VERDE}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -bra) cor="${VERMELHO}" && echo -ne "${cor}${2}${SEMCOR}" ;;
  -nazu) cor="${COLOR[6]}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}" ;;
  -gri) cor="\e[5m\033[1;100m" && echo -ne "${cor}${2}${SEMCOR}" ;;
  "-bar2") cor="${VERMELHO}———————————————————————————————————————————————————————————" && echo -e "${SEMCOR}${cor}${SEMCOR}" ;;
  "-bar")echo -e "\e[1;30m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m";;
  esac
}

menu(){
  local options=${#@} array
  for((num=1; num<=$options; num++)); do echo -ne " \e[1;30m[\e[1;33m$num\e[1;30m] \e[1;30m⟩\e[1;33m⟩\e[1;30m⟩\e[0m " && array=(${!num})
    case ${array[0]} in
	 "-bar")echo -e "\033[1;37m${array[@]:1}\n$(linea)";;
	  *)echo -e "\033[1;37m${array[@]}";;
    esac
  done
}

selectw(){
local selection="null" range
  if [[ -z $2 ]]; then    opcion=$1 &&    col="-nazu";  else    opcion=$2 &&    col=$1 ;  fi
  for((i=0; i<=$opcion; i++)); do range[$i]="$i "; done
  while [[ ! $(echo ${range[*]}|grep -w "$selection") ]]; do
    echo -ne "\e[1;30m ╰► Selecione una opción: " >&2
    read selection
    tput cuu1 >&2 && tput dl1 >&2
  done
  echo $selection
}

fun_bar() {
  comando="$1"
  _=$(
    $comando >/dev/null 2>&1
  ) &
  >/dev/null
  pid=$!
  while [[ -d /proc/$pid ]]; do
    echo -ne " \033[1;33m["
    for ((i = 0; i < 20; i++)); do
      echo -ne "\033[1;31m##"
      sleep 0.5
    done
    echo -ne "\033[1;33m]"
    sleep 1s
    echo
    tput cuu1
    tput dl1
  done
  echo -e " \033[1;33m[\033[1;31m########################################\033[1;33m] - \033[1;32m100%\033[0m"
  sleep 1s
}

print_center() {
  if [[ -z $2 ]]; then
    text="$1"
  else
    col="$1"
    text="$2"
  fi

  while read line; do
    unset space
    x=$(((54 - ${#line}) / 2))
    for ((i = 0; i < $x; i++)); do
      space+=' '
    done
    space+="$line"
    if [[ -z $2 ]]; then
      msg -azu "$space"
    else
      msg "$col" "$space"
    fi
  done <<<$(echo -e "$text")
}

title() {
  clear
  msg -bar
  if [[ -z $2 ]]; then
    print_center -azu "$1"
  else
    print_center "$1" "$2"
  fi
  msg -bar
}

stop_install() {
  title "INSTALACION CANCELADA"
  exit
}

time_reboot() {
  print_center -ama "REINICIANDO VPS EN $1 SEGUNDOS"
  REBOOT_TIMEOUT="$1"

  while [ $REBOOT_TIMEOUT -gt 0 ]; do
    print_center -ne "-$REBOOT_TIMEOUT-\r"
    sleep 1
    : $((REBOOT_TIMEOUT--))
  done
  reboot
}

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

dependencias() {
	[[ $(uname -m) != "armv7l" ]] && {
  soft="sudo bsdmainutils zip unzip ufw curl python python3 python3-pip openssl screen cron iptables lsof pv boxes nano at mlocate gawk grep bc jq curl npm nodejs socat netcat netcat-traditional net-tools cowsay figlet lolcat"
  for i in $soft; do
    leng="${#i}"
    puntos=$((21 - $leng))
    pts="."
    for ((a = 0; a < $puntos; a++)); do
      pts+="."
    done
    msg -nazu "    Instalando $i$(msg -ama "$pts")"
    if apt install $i -y &>/dev/null; then
      msg -verd " INSTALADO"
    else
      msg -verm2 " ERROR"
      sleep 2
      tput cuu1 && tput dl1
      print_center -ama "aplicando fix a $i"
      dpkg --configure -a &>/dev/null
      sleep 2
      tput cuu1 && tput dl1

      msg -nazu "    Instalando $i$(msg -ama "$pts")"
      if apt install $i -y &>/dev/null; then
        msg -verd " INSTALADO"
      else
        msg -verm2 " ERROR"
      fi
    fi
  done
	} || {
    clear;msg -bar;print_center -ama "instalando recursos";msg -bar
  soft="toilet curl wget zip"
  for i in $soft; do
    leng="${#i}"
    puntos=$((21 - $leng))
    pts="."
    for ((a = 0; a < $puntos; a++)); do
      pts+="."
    done
    msg -nazu "    Instalando $i$(msg -ama "$pts")"
    apt install $i -y &>/dev/null
	echo -e "\e[1;32m [✓] $i instalado [✓]"
   done
	msg -bar;clear
	}

}

post_reboot() {
  echo 'wget -O /root/install.sh "https://raw.githubusercontent.com/NetVPS/VPS-MX_Oficial/master/Instalador/Install-Sin-Key.sh"; clear; sleep 2; chmod +x /root/install.sh; /root/install.sh --continue' >>/root/.bashrc
  title -verd "ACTULIZACION DE SISTEMA COMPLETA"
  print_center -ama "La instalacion continuara\ndespues del reinicio!!!"
  msg -bar
}
enter(){
  msg -bar
  text="►► Presione enter para continuar ◄◄"
  if [[ -z $1 ]]; then
    print_center -ama "$text"
  else
    print_center "$1" "$text"
  fi
  read
 }
install_start() {
  msg -bar
  echo -e "\e[1;97m           \e[5m\033[1;100m   ACTULIZACION DE SISTEMA   \033[1;37m"
  msg -bar
  print_center -ama "Se actualizaran los paquetes del sistema.\n Puede demorar y pedir algunas confirmaciones.\n"
  msg -bar3
  msg -ne "\n Desea continuar? [S/N]: "
  read opcion
  [[ "$opcion" != @(s|S) ]] && stop_install
  clear && clear
  msg -bar
  echo -e "\e[1;97m           \e[5m\033[1;100m   ACTULIZACION DE SISTEMA   \033[1;37m"
  msg -bar
  os_system
  repo "${vercion}"
  apt update -y
  apt upgrade -y
}

install_continue() {
  os_system
  msg -bar
  echo -e "      \e[5m\033[1;100m   COMPLETANDO PAQUETES PARA EL SCRIPT   \033[1;37m"
  msg -bar
  print_center -ama "$distro $vercion"
  print_center -verd "INSTALANDO DEPENDENCIAS"
  msg -bar3
  dependencias
  msg -bar3
  print_center -azu "Removiendo paquetes obsoletos"
  apt autoremove -y &>/dev/null
  sleep 2
  tput cuu1 && tput dl1
  msg -bar
  print_center -ama "Si algunas de las dependencias fallo!!!\nal terminar, puede intentar instalar\nla misma manualmente usando el siguiente comando\napt install nom_del_paquete"
  msg -bar
  read -t 60 -n 1 -rsp $'\033[1;39m       << Presiona enter para Continuar >>\n'
}
patoBot(){
	case $1 in
	"--chukk")echo -e "\e[1;30mpronto..";;
	"--rufu")echo -e "\e[1;30mpronto..";;
	"--drowkid")clear;msg -bar;print_center -ama " datos del bot ";msg -bar
	drowlink=${kid="https://gitlab.com/patomods/Bot-Gen-MultiScript/-/raw/main/botkid"}
		[[ $(uname -m) != "armvl7" ]] || exit 1
		for arqxbt in `echo "BotGen.sh ShellBot.sh botScript.sh BotGen-server.sh confbot.sh"`; do
			wget -O ${sdir[0]}/$arqxbt ${drowlink}/$arqxbt &> /dev/null
			chmod +x ${sdir[0]}/$arqxbt
		done
			for data in $(echo "id token username"); do
				msg -bar
				datos+=`read -p "ingrese su ${data}: " dat;echo -e "$dat "`
			done
	jq --arg a "$(echo $datos|awk '{print $2}')" --arg b "$(echo $datos|awk '{print $1}')" --arg c "$(echo $datos|awk '{print $3}')" '{token: $a, users: {admin: {id: $b, username: $c }}}' -n > ${sdir[0]}/conf.json
	clear && sed -i 's|/etc/ADM-db|.|g' ${sdir[0]}/BotGen.sh
	bash ${sdir[0]}/BotGen.sh --start
		;;
	esac
}
clear && clear
msg -bar2
echo -e "    \e[5m\033[1;100m   =====>> ►► 🚀 Ｐａｔｏ-Ｂｏｔｚ 🚀 ◄◄ <<=====   \033[1;37m"
msg -bar2
print_center -ama "Elija la estructura a descargar"
msg -bar2
menu "estructura chukk" "estructura rufu99" "-bar estructura predeterminada"
bot=$(selectw 4)
case $bot in
 0)exit 1 ;;
 1)
	msg -bar2
	print_center -ama "iniciando instalación"
	msg -bar2
	install_start
	install_continue
	patoBot --chukk
	enter
  ;;
 2)
	msg -bar2
	print_center -ama "iniciando instalación"
	msg -bar2
	install_start
	install_continue
	patoBot --chukk
	enter
  ;;
  3)
	msg -bar2
	print_center -ama "iniciando instalación"
	msg -bar2
	install_start
	install_continue
	patoBot --drowkid
	enter
  ;;
esac
