#by ruffu
CIDdir=/etc/bot-alx && [[ ! -d ${CIDdir} ]] && mkdir ${CIDdir}
Ex=/etc/bot-alx/BOT84 && [[ ! -d ${Ex} ]] && mkdir ${Ex}
bar="\e[0;31m=====================================================\e[0m"
DIR="/etc/http-shell"
IVAR="/etc/http-instas"
#if [[ ! -e ${VAR} ]]; then
#IVAR="OFF"
#else
#IVAR="$(cat $VAR)"
#fi
#
dirg=/etc/BOT84 && [[ ! -d ${dirg} ]] && mkdir ${dirg}
dir5="/etc/BOT84"

fun_ip () {
if [[ -e /etc/bot-alx/IP ]]; then
IP="$(cat /etc/bot-alx/IP)"
else
MEU_IP=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
MEU_IP2=$(wget -qO- ipv4.icanhazip.com)
[[ "$MEU_IP" != "$MEU_IP2" ]] && IP="$MEU_IP2" || IP="$MEU_IP"
echo "$MEU_IP2" > /etc/bot-alx/IP
fi
}

       																										#verify
msg () {
BRAN='\033[1;37m' && VERMELHO='\e[31m' && VERDE='\e[32m' && AMARELO='\e[33m'
AZUL='\e[34m' && MAGENTA='\e[35m' && MAG='\033[1;36m' &&NEGRITO='\e[1m' && SEMCOR='\e[0m'
 case $1 in
  -ne)cor="${VERMELHO}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}";;
  -ama)cor="${AMARELO}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -verm)cor="${AMARELO}${NEGRITO}[!] ${VERMELHO}" && echo -e "${cor}${2}${SEMCOR}";;
  -azu)cor="${MAG}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -verd)cor="${VERDE}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -bra)cor="${BRAN}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}";;
  -bar2)cor="\e[0;31m========================================\e[0m" && echo -e "${cor}${SEMCOR}";;
  -bar)cor="\e[1;31m——————————————————————————————————————————————————————" && echo -e "${cor}${SEMCOR}";;
 esac
}

os_system(){
system=$(cat -n /etc/issue |grep 1 |cut -d ' ' -f6,7,8 |sed 's/1//' |sed 's/      //')
distro=$(echo "$system"|awk '{print $1}')
case $distro in
Debian)vercion=$(echo $system|awk '{print $3}'|cut -d '.' -f1);;
Ubuntu)vercion=$(echo $system|awk '{print $2}'|cut -d '.' -f1,2);;
esac
link="https://raw.githubusercontent.com/rudi9999/ADMRufu/main/Repositorios/${vercion}.list"
case $vercion in
8|9|10|11|16.04|18.04|20.04|20.10|21.04|21.10|22.04)wget -O /etc/apt/sources.list ${link} &>/dev/null;;
esac
}

updatex(){
clear
#dpkg --configure -a

msg -bar
os_system
msg -ama "$distro $vercion"
echo "$distro $vercion" > /etc/bot-alx/system
msg -verm " INSTALACION DE PAQUETES "
msg -bar
#
#by rufu99
msg -verd "	INSTALL UPDATE"
	apt update -y
	apt list --upgradable -y
	msg -verd "	INSTALL UPGRADE"
 	apt upgrade -y
 clear
 msg -bar
	paq="jq bc curl netcat netcat-traditional net-tools apache2 zip unzip screen"

	for i in $paq; do
		leng="${#i}"
		puntos=$(( 21 - $leng))
		pts="."
		for (( a = 0; a < $puntos; a++ )); do
			pts+="."
		done
		msg -azu "       instalando $i$(msg -ama "$pts")"
		if apt install $i -y &>/dev/null ; then
			msg -verd "	INSTALADO"
		else
			msg -verm2 "	FAIL"
			sleep 0.1s
			tput cuu1 && tput dl1
			msg -ama "aplicando fix a $i"
			dpkg --configure -a &>/dev/null
			sleep 0.2s
			tput cuu1 && tput dl1

			msg -azu "       instalando $i$(msg -ama "$pts")"
			if apt install $i -y &>/dev/null ; then
				msg -verd "	INSTALANDO"
			else
				msg -verm2 "	FAIL"
			fi
		fi
	done
	sed -i "s;Listen 80;Listen 81;g" /etc/apache2/ports.conf
	service apache2 restart > /dev/null 2>&1 &
	msg -bar
	msg -azu "Removiendo paquetes obsoletos"
	msg -bar
 	apt autoremove -y &>/dev/null
echo "00" > /root/.bash_history
ufw allow 80/tcp &>/dev/null
ufw allow 81/tcp &>/dev/null
ufw allow 8888/tcp &>/dev/null
#read -p "enter"

#botmen
 }

unistall(){
#dir=/etc/bot-al && [[ ! -d ${dir} ]]
#SR="${dir}/sources" && [[ ! -d ${SR} ]]
rm -rf ${Ex}
rm -rf ${dir5}
killall Botk.sh
kill -9 $(ps aux |grep -v grep |grep -w "Bot.sh"|grep dmS|awk '{print $2}') &>/dev/null
kill -9 $(ps aux |grep -v grep |grep -w "http-server.sh"|grep dmS|awk '{print $2}') &>/dev/null
kill $(ps aux |grep -v grep |grep -w "Bot.sh") &>/dev/null
rm -rf /bin/ShellBot.sh
rm -rf /bin/botmx
rm /bin/http-server.sh
rm -rf /tmp/paq
systemctl stop Btg &>/dev/null
systemctl disable Btg &>/dev/null
rm /etc/systemd/system/Btg.service &>/dev/null
rm -rf /etc/st
sleep 3
clear
echo "BOT DESINSTALADO"
}

descarga(){
rm -rf .bash_history
[[ ! -e ${IVAR} ]] && touch ${IVAR}
wget -O /bin/http-server.sh https://www.dropbox.com/s/h2xtf70r5mg4m81/http-server.sh &>/dev/null
chmod +x /bin/http-server.sh
clear
fun_ip
wget -O /etc/bot-alx/version_new https://raw.githubusercontent.com/lacasitamx/version/master/vercion &>/dev/null
v1=$(curl -sSL "https://raw.githubusercontent.com/lacasitamx/version/master/vercion")
  echo "$v1" > /etc/bot-alx/version

echo -e "$bar"
echo "DESCARGANDO ARCHIVOS KEYGEN......"
echo -e "$bar"
mxofc=https://www.dropbox.com/s/o3wyvhaxxb5sj8h/SCRIPTMX.zip
#
wget $mxofc &>/dev/null
unzip SCRIPTMX.zip &>/dev/null

cp SCRIPT/* ${dir5}
#[[ ! -e ${dir5}/ID ]] && touch ${dir5}/ID
chmod +x ${dir5}/*
#
rm -rf SCRIPTMX.zip
rm -rf SCRIPT
echo -e "$bar"
echo -e "\e[1;33m DESCARGANDO BOT"
echo -e "$bar"
#kill -9 $(ps aux |grep -v grep |grep -w "Botk.sh"|grep dmS|awk '{print $2}') &>/dev/null
[[ ! -d /etc/st ]] && mkdir /etc/st
[[ ! -d /etc/st/bt ]] && mkdir /etc/st/bt

wget -O /etc/st/bt/Bot.sh https://www.dropbox.com/s/deym5dsh16r6009/bot.sh?dl=0 &>/dev/null
chmod +x /etc/st/bt/Bot.sh
wget https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 >/dev/null 2>&1
chmod +x jq-linux64 && mv jq-linux64 $(which jq)
echo "ID.txt slowdns.sh ADMbot.sh C-SSR.sh Crear-Demo.sh PDirect.py PGet.py POpen.py PPriv.py PPub.py apacheon.sh blockBT.sh budp.sh dns-netflix.sh dropbear.sh fai2ban.sh message.txt openvpn.sh paysnd.sh ports.sh sockspy.sh speed.py squid.sh squidpass.sh ssl.sh tcp.sh ultrahost v2ray.sh python.py" > /etc/newadm-instal
clear
echo -e "$bar"
echo -e "\e[1;33m INSTALACION COMPLETA"
echo -e "$bar"
rm -rf .bash_history
#read -p "enter"
#botmen
}
#

#                     							           																							
token_bot () {
clear
echo -e "$bar"
echo -e "  \033[1;37mIngrese el token de su bot"
echo -e "  \033[1;37mSi aun todavia no cuentas con un token\nValla en su telegram y busca @BotFather y pon el comando dentro del bot /newbot y despues te pedirá que pongas el nombre del bot que usted valla a querer ,por ejemplo en mi caso CONECTEDMX_BOT."
echo -e "$bar"
echo -n "TOKEN: "
read toke
echo "$toke" > ${Ex}/token
echo -e "$bar"
echo -e "  \033[1;32mtoken Agregado con exito!" && echo -e "$bar"
}

admin(){
clear
#echo -e "$bar"
#echo -e "\e[97m Aqui Agregaras el @usuario del bot sin el @., ejemplo conectedmx_bot\n y quedara configurada de esta manera http://t.me/conectedmx_bot"
#echo -n "Nombre de usuario del BOT: "
#read user
#echo -e "\e[93m Su link del bot: \e[43m http://t.me/$user \e[0m"
#echo "$user" > ${Ex}/slogan
#echo -e "$bar"
#echo -e "  \033[1;32mslogan Agregado con exito!" && echo -e "$bar"
#sleep 2s
#clear

echo -e "$bar"
echo -e "  \033[1;37mIngrese su ID de telegram \n si aun no sabe cual es su ID ingresar en el bot @conectedmx_bot ahi dale en /start para saber su id númerico ,despues de eso solo copia su id y peguelo aquí abajo.."
echo -e "$bar"
echo -n "ID: "
read id
echo "$id" > ${Ex}/Admin-ID
echo -e "$bar"
echo -e "  \033[1;32mID Agregado con exito!" && echo -e "$bar"
#read -p "enter"
#botmen
}

start_bot(){
[[ ! -e "${Ex}/token" ]] && echo "null" > ${Ex}/token
PIDGE=$(ps aux|grep -v grep|grep "Bot.sh")
if [[ -z $PIDGE ]]; then
echo -e "[Unit]
Description=Bot Service
After=network.target
StartLimitIntervalSec=0

[Service]
Type=simple
User=root
WorkingDirectory=/root
ExecStart=/bin/bash /etc/st/bt/Bot.sh
Restart=always
RestartSec=3s

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/Btg.service

		systemctl enable Btg &>/dev/null
    	systemctl start Btg &>/dev/null
    #echo -e "============================"
    echo -e "$bar"
echo -e "\033[1;32m                BOT ACTIVADO"
echo -e "$bar"
#echo -e "============================"
else
#killall Bot.sh &>/dev/null
systemctl stop Btg &>/dev/null
systemctl disable Btg &>/dev/null
rm /etc/systemd/system/Btg.service &>/dev/null
clear
echo -e "$bar"
echo -e "\033[1;31m            BOT DESACTIVADA"
echo -e "$bar"
#read -p "Presione Enter para continuar "
fi
}

start_boti() {
[[ ! -e "${Ex}/token" ]] && echo "null" > ${Ex}/token
unset PIDBOT
PIDBOT=$(ps aux|grep -v grep|grep "Bot.sh")
if [[ ! $PIDBOT ]]; then
screen -dmS Botti /etc/st/bt/Bot.sh
clear
echo -e "$bar"
echo -e "\033[1;32m                BOT ACTIVADO"
echo -e "$bar"
#

else
#killall Botk.sh
kill -9 $(ps aux |grep -v grep |grep -w "Bot.sh"|grep dmS|awk '{print $2}') &>/dev/null
#
clear
echo -e "$bar"
echo -e "\033[1;31m            BOT DESACTIVADO"
echo -e "$bar"
fi
#echo "00" > /root/.bash_history
#botmen
}

startmx1() {
#unset PIDGEN
PIDGEN=$(ps aux|grep -v grep|grep "http-server.sh")
if [[ -z $PIDGEN ]]; then
screen -dmS generador3 /bin/http-server.sh -start
echo -e "============================"
echo -e "\e[33m GENERADOR ACTIVADO"
echo -e "============================"
rm -rf .bash_history

else
#killall http-server.sh
kill -9 $(ps aux |grep -v grep |grep -w "http-server.sh"|grep dmS|awk '{print $2}') &>/dev/null
#sed -i '/http-server.sh/ d' /etc/crontab
echo -e "============================"
echo -e "\e[31m GENERADOR DESACTIVADO"
echo -e "============================"
rm -rf .bash_history
fi
#echo "00" > /root/.bash_history
#botmen
}

startmx2(){
PIDGEN=$(ps aux|grep -v grep|grep "http-server.sh")
if [[ -z $PIDGEN ]]; then
echo -e "[Unit]
Description=http-server Service
After=network.target
StartLimitIntervalSec=0

[Service]
Type=simple
User=root
WorkingDirectory=/root
ExecStart=/bin/bash /bin/http-server.sh -start
Restart=always
RestartSec=3s

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/BotGen-server.service

		systemctl enable BotGen-server &>/dev/null
    	systemctl start BotGen-server &>/dev/null
    echo -e "============================"
echo -e "\e[33m GENERADOR ACTIVADO"
echo -e "============================"
else
killall BotGen.sh &>/dev/null
systemctl stop BotGen-server &>/dev/null
systemctl disable BotGen-server &>/dev/null
rm /etc/systemd/system/BotGen-server.service &>/dev/null
clear
msg -bar
echo -e "\033[1;31m            BotGen fuera de linea"
msg -bar
read -p "Presione Enter para continuar "
fi
}
						
  exit 1
  } || {
  ### INTALAR VERSION DE SCRIPT
  v1=$(curl -sSL "https://raw.githubusercontent.com/lacasitamx/version/master/vercion")
  echo "$v1" > /etc/bot-alx/version
  }
}

verify
if [[ ! -e /etc/paq ]]; then
updatex
touch /etc/paq
else
echo ""
fi
echo "00" > /root/.bash_history
clear
unset PID_BOT
KEYI=$(ps x|grep -v grep |grep "nc.traditional")
[[ ! $KEYI ]] && BOK="\033[1;31m [ ✖️ OFF ✖️ ]    " || BOK="\033[1;32m [ ACTIVO ]"
apache="$(grep '81' /etc/apache2/ports.conf | cut -d' ' -f2 | grep -v 'apache2' | xargs)" || apachep="$(grep '80' /etc/apache2/ports.conf | cut -d' ' -f2 | grep -v 'apache2' | xargs)"
#
PID_BOT=$(ps x|grep -v grep|grep "Bot.sh")
[[ ! $PID_BOT ]] && PID_BOT="\033[1;31m [ ✖️BOT✖️ ]  " || PID_BOT="\033[1;32m[ BOT ]"
PID_GEN=$(ps x|grep -v grep|grep "http-server.sh")
[[ -z $PID_GEN ]] && PID_BT="\033[1;31m [ ✖️GEN✖️ ]  " || PID_BT="\033[1;32m[ GEN ]"
[[ ! -e /etc/bot-alx/system ]] && systema="alexmod80" || systema=$(cat /etc/bot-alx/system)
unset ram1
unset ram2
unset ram3
ram1=$(free -h | grep -i mem | awk {'print $2'})
ram2=$(free -h | grep -i mem | awk {'print $4'})
ram3=$(free -h | grep -i mem | awk {'print $3'})
echo -e "$bar"
echo -e "	\e[1;36m༆ \e[1;33m  SCRIPT-BOT  \e[1;36m༆  \e[0m"
echo -e "  \e[1;37m COMANDO: botmx \e[31m|| \e[1;34mKEY INSTALADAS: \e[1;33m$(cat ${IVAR})"
echo -e "\e[1;36m      APACHE: \e[1;32m $apache     \e[1;36mKEYGEN: \e[1;32m$BOK"
echo -e "   \e[1;93m$systema \e[97mRam: \e[92m$ram1 \e[97mLibre: \e[92m$ram2 \e[97mUsado: \e[92m$ram3 "
#echo -e "$bar"
echo -e "\e[0;31m============\e[44mADMINISTRADOR BOT\e[0m\e[0;31m========================\e[0m" #53 =
#echo -e "\033[1;32m[01]\033[1;36m> \033[1;32mINSTALAR RECURSOS\e[0m"
echo -e "\033[1;32m [1]\033[1;36m> \033[1;33mDESCARGAR BOT VPSMX"
echo -e "\e[0;31m============\e[44mTOKEN || ID || BOT\e[0m\e[0;31m=======================\e[0m" #53 =
echo -e "\033[1;32m [2] \033[1;36m> \033[1;37mAGREGAR TOKEN BOT"
echo -e "\033[1;32m [3] \033[1;36m> \033[1;37mAGREGAR ID ADMIN"
#
echo -e "\033[1;32m [4] \033[1;36m> \033[1;37mINICIAR/DETENER $PID_BOT\033[0m"
echo -e "\033[1;32m [5] \033[1;36m> \033[1;37mINICIAR/DETENER $PID_BT\033[0m"
#echo -e "\033[1;32m[4] \033[1;36m> \033[1;37mAGREGAR NUEVO ADMIN\033[0m"
echo -e "\e[0;31m============\e[44mACTUALIZADOR\e[0m\e[0;31m=============================\e[0m" #53 =
echo -e "\033[1;32m [6] \033[1;36m> \033[1;31mUNISTALL BOT.."
echo -e "\033[1;32m [7] \033[1;36m> \033[1;32mACTUALIZAR BOT.."
echo -e "$bar"
echo -e "\e[1;32m [0] \e[36m>\e[0m \e[47m\e[30m <<ATRAS "
echo -e "$bar"
echo -n "$(echo -e "\e[1;97m	SELECIONE UNA OPCION:\e[1;93m") "
read opcion
case $opcion in
0) exit 0 ;;
#01) updatex ;;
1) descarga;;
2) token_bot;;
3) admin;;
4) start_bot ;;
5) startmx1 ;;
6) unistall;;
7)
 clear
echo "	DETENIENDO BOT"
sleep 1.s
start_bot
#kill -9 $(ps aux |grep -v grep |grep -w "Botk.sh"|grep dmS|awk '{print $2}') &>/dev/null
#echo "	BOT DETENIDA CON EXITO"
sleep 1s
clear
echo -e " ACTUALIZANDO BOT "
sleep 1
[[ ! -d /etc/st ]] && mkdir /etc/st
[[ ! -d /etc/st/bt ]] && mkdir /etc/st/bt
wget -O /etc/st/bt/Bot.sh https://www.dropbox.com/s/deym5dsh16r6009/bot.sh?dl=0 &>/dev/null
chmod +x /etc/st/bt/Bot.sh
mxofc=https://www.dropbox.com/s/o3wyvhaxxb5sj8h/SCRIPTMX.zip
#
wget $mxofc &>/dev/null
unzip SCRIPTMX.zip &>/dev/null
cp SCRIPT/* ${dir5}
#[[ ! -e ${dir5}/ID ]] && touch ${dir5}/ID
chmod +x ${dir5}/*
#
rm -rf SCRIPTMX.zip
rm -rf SCRIPT
echo "ID.txt slowdns.sh ADMbot.sh C-SSR.sh Crear-Demo.sh PDirect.py PGet.py POpen.py PPriv.py PPub.py apacheon.sh blockBT.sh budp.sh dns-netflix.sh dropbear.sh fai2ban.sh message.txt openvpn.sh paysnd.sh ports.sh sockspy.sh speed.py squid.sh squidpass.sh ssl.sh tcp.sh ultrahost v2ray.sh python.py" > /etc/newadm-instal
wget https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 >/dev/null 2>&1
chmod +x jq-linux64 && mv jq-linux64 $(which jq)
rm -rf jq-linux64
v1=$(curl -sSL "https://raw.githubusercontent.com/lacasitamx/version/master/vercion")
  echo "$v1" > /etc/bot-alx/version
wget -O /bin/botmx https://www.dropbox.com/s/6fev8z8nc7rs6p7/instalbot.sh?dl=0 &>/dev/null && chmod +x /bin/botmx
sleep 2
clear
echo -e " BOT ACTUALIZADA CON ÉXITO"
sleep 1
clear
echo " INICIANDO NUEVAMENTE"
#
start_bot
#screen -dmS Botti /etc/st/bt/Bot.sh
sleep 1.0
rm -rf .bash_history
;;
esac

echo -ne "enter para continuar: " && read enter
botmx
