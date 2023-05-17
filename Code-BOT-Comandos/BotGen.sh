#!/bin/bash
# -*- ENCODING: UTF-8 -*-

meu_ip_fun () {
MIP=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
MIP2=$(wget -qO- ipv4.icanhazip.com)
[[ "$MIP" != "$MIP2" ]] && IP="$MIP2" || IP="$MIP"
}
meu_ip_func () {
MIP=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
MIP2=$(wget -qO- ipv4.icanhazip.com)
[[ "$MIP" != "$MIP2" ]] && IP="$MIP2" || IP="$MIP"
}

rm -rf /etc/localtime &>/dev/null
ln -s /usr/share/zoneinfo/America/Chihuahua /etc/localtime &>/dev/null
rm -rf /usr/local/lib/systemubu1 &> /dev/null

#check_ip
#function_verify
  [[ -e /etc/newadm-instal ]] && BASICINST="$(cat /etc/newadm-instal)" || BASICINST="menu.sh LATAMbot.sh PDirect.py PGet.py POpen.py PPriv.py PPub.py message.txt"
[[ -e /etc/newadm-install ]] && BASICINSTC="$(cat /etc/newadm-install)" || BASICINSTC="ID.txt slowdns.sh ADMbot.sh C-SSR.sh Crear-Demo.sh PDirect.py PGet.py POpen.py PPriv.py PPub.py apacheon.sh blockBT.sh budp.sh dns-netflix.sh dropbear.sh fai2ban.sh message.txt openvpn.sh paysnd.sh ports.sh sockspy.sh speed.py squid.sh squidpass.sh ssl.sh tcp.sh ultrahost v2ray.sh python.py"


SCPT_DIR="/etc/cat/script"
SCPT_DIRC="/etc/cat/casita"

#
[[ ! -e ${SCPT_DIR} ]] && mkdir ${SCPT_DIR}
[[ ! -e ${SCPT_DIRC} ]] && mkdir ${SCPT_DIRC}

mkdir /etc/bot/creditos
DIR="/etc/http-shell"
LIST="lista-arq"
CIDdir=/etc/CAT-BOT && [[ ! -d ${CIDdir} ]] && mkdir ${CIDdir}
SRC="${CIDdir}/sources" && [[ ! -d ${SRC} ]] && mkdir ${SRC}
CID="${CIDdir}/User-ID" && [[ ! -e ${CID} ]] && touch ${CID}
keytxt="${CIDdir}/keys" && [[ ! -d ${keytxt} ]] && mkdir ${keytxt}
[[ ! -d /etc/CAT-BOT/Creditos ]] && mkdir /etc/CAT-BOT/Creditos
USRdatabase2="/etc/CAT-BOT/Creditos"
[[ $(dpkg --get-selections|grep -w "jq"|head -1) ]] || apt-get install jq -y &>/dev/null
[[ ! -e "/bin/ShellBot.sh" ]] && wget -O /bin/ShellBot.sh https://www.dropbox.com/s/gfwlkfq4f2kplze/ShellBot.sh &> /dev/null
[[ -e /etc/texto-bot ]] && rm /etc/texto-bot
LINE="━━━━━━━━━━━━━━━━━━"

# Importando API 
source ShellBot.sh


# Token del bot
bot_token="$(cat ${CIDdir}/token)"

# Inicializando el bot
ShellBot.init --token "$bot_token" --monitor --flush --return map
ShellBot.username

ShellBot.setMyCommands --commands '[{"command":"menu","description":"muestra el menu principal"},{"command":"id","description":"muestra tu id de telegram"}]'

reply () {
	[[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}

		 	 ShellBot.sendMessage	--chat_id  $var \
									--text "$comando" \
									--parse_mode html \
									--reply_markup "$(ShellBot.ForceReply)"
	[[ "${callback_query_data}" = /del || "${message_text}" = /del ]] && listID_src
}



# verificacion primarias

gerar_keys () {
meu_ip_fun
[[ -z ${callback_query_from_first_name} ]] && firsnme="${message_from_first_name}" || firsnme="${callback_query_from_first_name}"
[[ -z ${callback_query_from_last_name} ]] && lastnme="${message_from_last_name}" || lastnme="${callback_query_from_last_name}"
unset newresell
newresell="${USRdatabase2}/Mensaje_$chatuser.txt"
if [[ ! -e ${newresell} ]]; then
echo "${firsnme} ${lastnme}" > ${SCPT_DIR}/message.txt
else
echo "$(cat ${newresell})" > ${SCPT_DIR}/message.txt
fi

[[ ! $newresell ]] && credill="By $(cat ${USRdatabase2}/Mensaje_$chatuser.txt)" || credill="By $(cat ${SCPT_DIR}/message.txt)"

[[ ! ${keytxt}/key_$chatuser.txt ]] && kg="0" || kg=$(cat ${keytxt}/key_$chatuser.txt | wc -l)

unset usrLOP nombrevalue nBot nBotSS

unset nombrevalue
[[ -z ${nombrevalue} ]] && nombrevalue="${message_from_id}" 
[[ -z ${nombrevalue} ]] && nombrevalue="${callback_query_from_id}"
numkey_gen=$(grep -o -i $nombrevalue /etc/CAT-BOT/num-key.cont | wc -l)
limcont=$(cat /etc/CAT-BOT/limit) 
[[ "$limcont" -ge "998" ]] && limted="♾️" || limted=$(cat /etc/CAT-BOT/limit)
[[ "$(( $limcont - $numkey_gen ))" -ge "900" ]] && credres="♾️" || credres=$(( $limcont - $numkey_gen))
[[ -z $nBot ]] && nBot=$(ShellBot.username)
valuekey="$(date | md5sum | head -c10)"
valuekey+="$(echo $(($RANDOM*10))|head -c 5)"
fun_list "$valuekey"
keyfinal=$(ofus "$IP:8888/$valuekey/$LIST")
ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
--text "🗝️GENERANDO KEY LATAM"
local bot_retorno="• 💥 ─━─ 𝗞𝗘𝗬 - 𝗟𝗔𝗧𝗔𝗠 𝘃𝟮.𝟬 ━─━💥 • \n"
bot_retorno+="\n"
#[[ -z ${usrLOP} ]] && bot_retorno+="☢️ SU ID NO CUENTA CON UN NOMBRE DE USUARIO ☢️\n"
#bot_retorno+="🔑 KEY GENERADA V9X🔑 \n"
[[ -z ${callback_query_from_first_name} ]] && firsnme="${message_from_first_name}" || firsnme="${callback_query_from_first_name}"
[[ -z ${callback_query_from_last_name} ]] && lastnme="${message_from_last_name}" || lastnme="${callback_query_from_last_name}"
[[ -z ${message_chat_tittle} ]] && grupCHAT="" || grupCHAT="ChatID : ${chatuser} "
#bot_retorno+="👤 ●⸺ [ ${firsnme} ${lastnme} ] \n"
[[ -z ${usrLOP} ]] && bot_retorno+="🆔 ●⸺ [ <tg-spoiler>${nombrevalue}</tg-spoiler> $grupCHAT ] \n"
bot_retorno+="\n"
#bot_retorno+="\n"
bot_retorno+="👤 SLOGAN: : $credill\n"
bot_retorno+="$(cat < /etc/CAT-BOT/resel)\n"
#bot_retorno+="❗️ Actuliza tu Sistema Primero ❗️\n"
#bot_retorno+="\n"
#bot_retorno+="<code>apt update; apt upgrade -y;</code>\n"
bot_retorno+="\n"
bot_retorno+="💾 Instalador:\n"
bot_retorno+="\n"
bot_retorno+="<code>wget https://raw.githubusercontent.com/ModVPS/LATAM-OFICIAL/main/LATAM; chmod 777 LATAM; ./LATAM --start</code>\n\n"
bot_retorno+="\n"
bot_retorno+="🔑 Key: (Valida por solo 30 min) \n"
bot_retorno+="\n"
bot_retorno+="<code>${keyfinal}</code>\n"
bot_retorno+="$LINE\n"
bot_retorno+="KEY GENERADAS EN 24hrs: [ $credres/$limted ]\n"
bot_retorno+="$LINE\n"
echo "$keyfinal" >> ${keytxt}/key_${chatuser}.txt
bot_retorno+="KEY UASADAS [ $numkey_used ] \n"
bot_retorno+="KEY GENERADAS [ $numkey_gen ]\n"
#bot_retorno+="$LINE\n"
bot_retorno+="📀 𝙐𝙗𝙪𝙣𝙩𝙪: 𝟭𝟴, 𝟮𝟬.𝟬𝟰 𝙇𝙏𝙎 ¡𝙍𝙚𝙘𝙤𝙢𝙚𝙣𝙙𝙖𝙙𝙤\n"
bot_retorno+="$LINE\n"
#bot_retorno+="🚦 𝗔𝗱𝗾𝘂𝗶𝗲𝗿𝗲 𝗧𝘂 𝗮𝗰𝗰𝗲𝘀𝗼 𝗘𝗻 @LATMXDANBOT\n"
#msj_del ${message_message_id}

comand_boton "keymen"

msj_del ${message_message_id}

#msj_fun

#upfile_fun ${keytxt}/key_${chatuser}.txt
#rm ${keytxt}/key_${chatuser}.txt
}

generar(){
		if [[ $(echo $permited|grep "${chatuser}") = "" ]]; then
	echo ""
		 if [[ $(cat ${CID}|grep "${chatuser}") = "" ]]; then
		
		ShellBot.sendMessage --chat_id $chatuser \
                        --text "$(echo -e "⚠️═ 𝗖𝗢𝗠𝗔𝗡𝗗𝗢 𝗕𝗟𝗢𝗤𝗨𝗘𝗔𝗗𝗢 ═ ⚠️\n▫️ > Sin Acceso VIP \n ❌- KEY CANCELADA -❌ \n")"
		else
VPSsec=$(date +%s)
			dia="$(cat ${CID}|grep -w "$chatuser"|cut -d'|' -f2)"
			#
             DataSec=$(date +%s --date="$dia")
             
            [[ "$VPSsec" -gt "$DataSec" ]] && {
      local us="❯ ══━━━━⎊⎊━━━━══ ❮ ️\nUSUARIO ID: <code>$chatuser</code> EXPIRADO \n"
				
					ShellBot.sendMessage --chat_id ${permited[$id]} \
							--text "$(echo -e "$us")" \
							--parse_mode html 
				EXPTIME="EXPIRADO"
				 
			   rm -rf ${USRdatabase2}/Mensaje_$chatuser.txt &>/dev/null
  	    	rm ${keytxt}/key_${chatuser}.txt &>/dev/null
      		
                    sed -i "/$chatuser/d" ${CID}
            [[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}         
	      ShellBot.sendMessage --chat_id $var \
							--text "$(echo -e USUARIO EXPIRADO)" \
							--parse_mode html 
            return 0 
} || {
EXPTIME="[$(($(($DataSec - $VPSsec)) / 86400))] DIAS"
gerar_keys
}
fi
else
gerar_keys
fi

}

fun_list () {
rm ${SCPT_DIR}/*.x.c &> /dev/null
unset KEY
KEY="$1"
#CRIA DIR
[[ ! -e ${DIR} ]] && mkdir ${DIR}
#ENVIA ARQS
i=0
VALUE+="gerar.sh instgerador.sh http-server.py lista-arq $BASICINST"
for arqx in `ls ${SCPT_DIR}`; do
[[ $(echo $VALUE|grep -w "${arqx}") ]] && continue 
echo -e "[$i] -> ${arqx}"
arq_list[$i]="${arqx}"
let i++
done
#CRIA KEY
[[ ! -e ${DIR}/${KEY} ]] && mkdir ${DIR}/${KEY}
#PASSA ARQS
unset nombrevalue
[[ -z ${nombrevalue} ]] && nombrevalue="${message_from_id}" 
[[ -z ${nombrevalue} ]] && nombrevalue="${callback_query_from_id}"
[[ "$(grep -o -i $nombrevalue /etc/CAT-BOT/num-key.cont | wc -l)" -ge "$(cat < /etc/CAT-BOT/limit)" ]] && 
{
local bot_retorno="$LINE\n"

#bot_retorno+="$LINE\n"
[[ -z ${callback_query_from_first_name} ]] && firsnme="${message_from_first_name}" || firsnme="${callback_query_from_first_name}"
[[ -z ${callback_query_from_last_name} ]] && lastnme="${message_from_last_name}" || lastnme="${callback_query_from_last_name}"
bot_retorno+="👤 ●⸺ Hola  ${firsnme} ${lastnme}\n"
bot_retorno+="Su 🆔 alcanzó el Límite de KEYS permitidos\n"
#bot_retorno+="▫️ Límite Actual Vencido \n"
bot_retorno+="▫️ Limite Permitido Vencido: $(cat < /etc/CAT-BOT/limit) \n"
#bot_retorno+=" 🧬 Soporte : Ubuntu 14.04 - 16.04 - 18.04 - 20.04\n         𝙍𝙚𝙘𝙤𝙢𝙚𝙣𝙙𝙖𝙙𝙤 𝙐𝙗𝙪𝙣𝙩𝙪 18.04 \n  🪦 Solicita Creditos de tu KEY 🛡️⚔️\n"
#bot_retorno+=" 🔐 『 $(grep -o -i $nombrevalue /etc/gerar-sh-log | wc -l) 』KEY USADAS 🔓,\n"
bot_retorno+="🔴 Generaste 『 $(grep -o -i $nombrevalue /etc/CAT-BOT/num-key.cont | wc -l) 』Keys en el BOT \n"
bot_retorno+="Espera 12 horas a que se libere o contacta al ADM lo haga\n"
bot_retorno+="$LINE\n"
msj_fun
exit
} ||
echo "$nombrevalue" >> /etc/CAT-BOT/num-key.cont
numkey_used=$(grep -o -i $nombrevalue /etc/gerar-sh-log | wc -l)
numkey_gen=$(grep -o -i $nombrevalue /etc/CAT-BOT/num-key.cont | wc -l)
#ADM BASIC
arqslist="$BASICINST"
for arqx in `echo "${arqslist}"`; do
[[ -e ${DIR}/${KEY}/$arqx ]] && continue #ANULA ARQUIVO CASO EXISTA
cp ${SCPT_DIR}/$arqx ${DIR}/${KEY}/
echo "$arqx" >> ${DIR}/${KEY}/${LIST}
done
rm ${SCPT_DIR}/*.x.c &> /dev/null
echo "$nombrevalue" > ${DIR}/${KEY}.name
[[ ! -z $IPFIX ]] && echo "$IPFIX" > ${DIR}/${KEY}/keyfixa
at now +1 hours <<< "rm -rf ${DIR}/${KEY} && rm -rf ${DIR}/${KEY}.name"
}

ofus() {
    unset server
    server=$(echo ${txt_ofuscatw} | cut -d':' -f1)
    unset txtofus
    number=$(expr length $1)
    for ((i = 1; i < $number + 1; i++)); do
      txt[$i]=$(echo "$1" | cut -b $i)
      case ${txt[$i]} in
      ".") txt[$i]="v" ;;
      "v") txt[$i]="." ;;
      "1") txt[$i]="@" ;;
      "@") txt[$i]="1" ;;
      "2") txt[$i]="?" ;;
      "?") txt[$i]="2" ;;
      "4") txt[$i]="p" ;;
      "p") txt[$i]="4" ;;
      "-") txt[$i]="L" ;;
      "L") txt[$i]="-" ;;
      esac
      txtofus+="${txt[$i]}"
    done
    echo "$txtofus" | rev
  }
  
  gerar_keyc () {
meu_ip_func
[[ -z ${callback_query_from_first_name} ]] && firsnme="${message_from_first_name}" || firsnme="${callback_query_from_first_name}"
[[ -z ${callback_query_from_last_name} ]] && lastnme="${message_from_last_name}" || lastnme="${callback_query_from_last_name}"
unset newresell
newresell="${USRdatabase2}/Mensaje_$chatuser.txt"
if [[ ! -e ${newresell} ]]; then
echo "${firsnme} ${lastnme}" > ${SCPT_DIRC}/message.txt
else
echo "$(cat ${newresell})" > ${SCPT_DIRC}/message.txt
fi

[[ ! $newresell ]] && credill="By $(cat ${USRdatabase2}/Mensaje_$chatuser.txt)" || credill="By $(cat ${SCPT_DIRC}/message.txt)"

[[ ! ${keytxt}/key_$chatuser.txt ]] && kg="0" || kg=$(cat ${keytxt}/key_$chatuser.txt | wc -l)

unset usrLOP nombrevalue nBot nBotSS

unset nombrevalue
[[ -z ${nombrevalue} ]] && nombrevalue="${message_from_id}" 
[[ -z ${nombrevalue} ]] && nombrevalue="${callback_query_from_id}"
numkey_gen=$(grep -o -i $nombrevalue /etc/CAT-BOT/num-key.cont | wc -l)
limcont=$(cat /etc/CAT-BOT/limit) 
[[ "$limcont" -ge "998" ]] && limted="♾️" || limted=$(cat /etc/CAT-BOT/limit)
[[ "$(( $limcont - $numkey_gen ))" -ge "900" ]] && credres="♾️" || credres=$(( $limcont - $numkey_gen))
[[ -z $nBot ]] && nBot=$(ShellBot.username)
valuekey="$(date | md5sum | head -c10)"
valuekey+="$(echo $(($RANDOM*10))|head -c 5)"
fun_listc "$valuekey"
keyfinal=$(ofusc "$IP:8888/$valuekey/$LIST")
ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
--text "🔑 GENERANDO KEY V9X"
local bot_retorno="┅┅┅⋙💥❯❯ ❯❯❲ BOT GEN ❳❮❮ ❮❮💥⋘┅┅┅ \n"
bot_retorno+="\n"
#[[ -z ${usrLOP} ]] && bot_retorno+="☢️ SU ID NO CUENTA CON UN NOMBRE DE USUARIO ☢️\n"
#bot_retorno+="🔑 KEY GENERADA V9X🔑 \n"
[[ -z ${callback_query_from_first_name} ]] && firsnme="${message_from_first_name}" || firsnme="${callback_query_from_first_name}"
[[ -z ${callback_query_from_last_name} ]] && lastnme="${message_from_last_name}" || lastnme="${callback_query_from_last_name}"
[[ -z ${message_chat_tittle} ]] && grupCHAT="" || grupCHAT="ChatID : ${chatuser} "
#bot_retorno+="👤 ●⸺ [ ${firsnme} ${lastnme} ] \n"
#[[ -z ${usrLOP} ]] && bot_retorno+="🆔 ●⸺ [ <tg-spoiler>${nombrevalue}</tg-spoiler> $grupCHAT ] \n"
bot_retorno+="🔑 KEY GENERADA V9X🔑 \n"
bot_retorno+="\n"
bot_retorno+="👤 SLOGAN: : $credill\n"
bot_retorno+="$(cat < /etc/CAT-BOT/resel)\n"
#bot_retorno+="❗️ Actuliza tu Sistema Primero ❗️\n"
#bot_retorno+="\n"
#bot_retorno+="<code>apt update; apt upgrade -y;</code>\n"
bot_retorno+="\n"
bot_retorno+="◈ TOCA EL INSTALADOR ◈:\n"
bot_retorno+="\n"
bot_retorno+="<code>apt update -y; apt upgrade -y; wget https://raw.githubusercontent.com/lacasitamx/INSTALADOR-X/master/LACASITA/LACASITA.sh; chmod 777 LACASITA.sh; ./LACASITA.sh</code>\n\n"
bot_retorno+="\n"
bot_retorno+="◈ TOCA PARA COPIAR LA KEY ◈\n"
bot_retorno+="\n"
bot_retorno+="<code>${keyfinal}</code>\n"
bot_retorno+="\n"
#bot_retorno+="KEY GENERADAS EN 24hrs: [ $credres/$limted ]\n"
bot_retorno+="$LINE\n"
echo "$keyfinal" >> ${keytxt}/key_${chatuser}.txt
#bot_retorno+="KEY UASADAS [ $numkey_used ] \n"
bot_retorno+="🔰 KEY GENERADAS [ $numkey_gen ]\n"
#bot_retorno+="$LINE\n"
bot_retorno+="📀 𝙐𝙗𝙪𝙣𝙩𝙪: 𝟭𝟴, 𝟮𝟬.𝟬𝟰 𝙇𝙏𝙎 ¡𝙍𝙚𝙘𝙤𝙢𝙚𝙣𝙙𝙖𝙙𝙤\n"
bot_retorno+="$LINE\n"
#bot_retorno+="🚦 𝗔𝗱𝗾𝘂𝗶𝗲𝗿𝗲 𝗧𝘂 𝗮𝗰𝗰𝗲𝘀𝗼 𝗘𝗻 @LATMXDANBOT\n"

comand_boton "keymens"
msj_del ${message_message_id}

#msj_fun

#upfile_fun ${keytxt}/key_${chatuser}.txt
#rm ${keytxt}/key_${chatuser}.txt
}
  
  
  fun_listc () {
rm ${SCPT_DIRC}/*.x.c &> /dev/null
unset KEY
KEY="$1"
#CRIA DIR
[[ ! -e ${DIR} ]] && mkdir ${DIR}
#ENVIA ARQS
i=0
VALUE+="gerar.sh instgerador.sh http-server.py lista-arq $BASICINSTC"
for arqx in `ls ${SCPT_DIRC}`; do
[[ $(echo $VALUE|grep -w "${arqx}") ]] && continue 
echo -e "[$i] -> ${arqx}"
arq_list[$i]="${arqx}"
let i++
done
#CRIA KEY
[[ ! -e ${DIR}/${KEY} ]] && mkdir ${DIR}/${KEY}
#PASSA ARQS
unset nombrevalue
[[ -z ${nombrevalue} ]] && nombrevalue="${message_from_id}" 
[[ -z ${nombrevalue} ]] && nombrevalue="${callback_query_from_id}"
[[ "$(grep -o -i $nombrevalue /etc/CAT-BOT/num-key.cont | wc -l)" -ge "$(cat < /etc/CAT-BOT/limit)" ]] && 
{
local bot_retorno="$LINE\n"

#bot_retorno+="$LINE\n"
[[ -z ${callback_query_from_first_name} ]] && firsnme="${message_from_first_name}" || firsnme="${callback_query_from_first_name}"
[[ -z ${callback_query_from_last_name} ]] && lastnme="${message_from_last_name}" || lastnme="${callback_query_from_last_name}"
bot_retorno+="👤 ●⸺ Hola  ${firsnme} ${lastnme}\n"
bot_retorno+="Su 🆔 alcanzó el Límite de KEYS permitidos\n"
#bot_retorno+="▫️ Límite Actual Vencido \n"
bot_retorno+="▫️ Limite Permitido Vencido: $(cat < /etc/CAT-BOT/limit) \n"
#bot_retorno+=" 🧬 Soporte : Ubuntu 14.04 - 16.04 - 18.04 - 20.04\n         𝙍𝙚𝙘𝙤𝙢𝙚𝙣𝙙𝙖𝙙𝙤 𝙐𝙗𝙪𝙣𝙩𝙪 18.04 \n  🪦 Solicita Creditos de tu KEY 🛡️⚔️\n"
#bot_retorno+=" 🔐 『 $(grep -o -i $nombrevalue /etc/gerar-sh-log | wc -l) 』KEY USADAS 🔓,\n"
bot_retorno+="🔴 Generaste 『 $(grep -o -i $nombrevalue /etc/CAT-BOT/num-key.cont | wc -l) 』Keys en el BOT \n"
bot_retorno+="Espera 12 horas a que se libere o contacta al ADM lo haga\n"
bot_retorno+="$LINE\n"
msj_fun
exit
} ||
echo "$nombrevalue" >> /etc/CAT-BOT/num-key.cont
numkey_used=$(grep -o -i $nombrevalue /etc/gerar-sh-log | wc -l)
numkey_gen=$(grep -o -i $nombrevalue /etc/CAT-BOT/num-key.cont | wc -l)
#ADM BASIC
arqslist="$BASICINSTC"
for arqx in `echo "${arqslist}"`; do
[[ -e ${DIR}/${KEY}/$arqx ]] && continue #ANULA ARQUIVO CASO EXISTA
cp ${SCPT_DIRC}/$arqx ${DIR}/${KEY}/
echo "$arqx" >> ${DIR}/${KEY}/${LIST}
done
rm ${SCPT_DIRC}/*.x.c &> /dev/null
echo "$nombrevalue" > ${DIR}/${KEY}.name
[[ ! -z $IPFIX ]] && echo "$IPFIX" > ${DIR}/${KEY}/keyfixa
at now +1 hours <<< "rm -rf ${DIR}/${KEY} && rm -rf ${DIR}/${KEY}.name"
}

ofusc() {
      unset server
      server=$(echo ${txt_ofuscatw} | cut -d':' -f1)
      unset txtofus
      number=$(expr length $1)
      for ((i = 1; i < $number + 1; i++)); do
        txt[$i]=$(echo "$1" | cut -b $i)
        case ${txt[$i]} in
        ".")txt[$i]="C";;
"C")txt[$i]=".";;
"3")txt[$i]="@";;
"@")txt[$i]="3";;
"4")txt[$i]="9";;
"9")txt[$i]="4";;
"6")txt[$i]="P";;
"P")txt[$i]="6";;
"L")txt[$i]="K";;
"K")txt[$i]="L";;
esac
        txtofus+="${txt[$i]}"
      done
      echo "$txtofus" | rev
}




gerar_key () {
meu_ip_fun
[[ -z ${callback_query_from_first_name} ]] && firsnme="${message_from_first_name}" || firsnme="${callback_query_from_first_name}"
[[ -z ${callback_query_from_last_name} ]] && lastnme="${message_from_last_name}" || lastnme="${callback_query_from_last_name}"
unset newresell
newresell="${USRdatabase2}/Mensaje_$chatuser.txt"
if [[ ! -e ${newresell} ]]; then
echo "KEY FREE LATAM MX" > ${SCPT_DIR}/message.txt
else
echo "$(cat ${newresell})" > ${SCPT_DIR}/message.txt
fi

[[ ! $newresell ]] && credill="By $(cat ${USRdatabase2}/Mensaje_$chatuser.txt)" || credill="By $(cat ${SCPT_DIR}/message.txt)"

[[ ! ${keytxt}/key_$chatuser.txt ]] && kg="0" || kg=$(cat ${keytxt}/key_$chatuser.txt | wc -l)

unset usrLOP nombrevalue nBot nBotSS

unset nombrevalue
[[ -z ${nombrevalue} ]] && nombrevalue="${message_from_id}" 
[[ -z ${nombrevalue} ]] && nombrevalue="${callback_query_from_id}"
numkey_gena=$(grep -o -i $nombrevalue /etc/CAT-BOT/num-keys.cont | wc -l)
limconta=$(cat /etc/CAT-BOT/limita) 
[[ "$limconta" -ge "998" ]] && limteda="♾️" || limteda=$(cat /etc/CAT-BOT/limita)
[[ "$(( $limconta - $numkey_gena ))" -ge "900" ]] && credress="♾️" || credress=$(( $limconta - $numkey_gena))
[[ -z $nBot ]] && nBot=$(ShellBot.username)
valuekey="$(date | md5sum | head -c10)"
valuekey+="$(echo $(($RANDOM*10))|head -c 5)"
fun_lista "$valuekey"
keyfinal=$(ofus "$IP:8888/$valuekey/$LIST")
ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
--text "🗝️GENERANDO KEY LATAM"
local bot_retorno="• 💥 ─━─ 𝗞𝗘𝗬 - 𝗟𝗔𝗧𝗔𝗠 𝘃𝟮.𝟬 ━─━💥 • \n"
bot_retorno+="\n"
#[[ -z ${usrLOP} ]] && bot_retorno+="☢️ SU ID NO CUENTA CON UN NOMBRE DE USUARIO ☢️\n"
#bot_retorno+="🔑 KEY GENERADA V9X🔑 \n"
[[ -z ${callback_query_from_first_name} ]] && firsnme="${message_from_first_name}" || firsnme="${callback_query_from_first_name}"
[[ -z ${callback_query_from_last_name} ]] && lastnme="${message_from_last_name}" || lastnme="${callback_query_from_last_name}"
[[ -z ${message_chat_tittle} ]] && grupCHAT="" || grupCHAT="ChatID : ${chatuser} "
#bot_retorno+="👤 ●⸺ [ ${firsnme} ${lastnme} ] \n"
[[ -z ${usrLOP} ]] && bot_retorno+="🆔 ●⸺ [ <tg-spoiler>${nombrevalue}</tg-spoiler> $grupCHAT ] \n"
bot_retorno+="\n"
#bot_retorno+="\n"
bot_retorno+="👤 SLOGAN: : $credill\n"
bot_retorno+="$(cat < /etc/CAT-BOT/reselkey)\n"
#bot_retorno+="❗️ Actuliza tu Sistema Primero ❗️\n"
#bot_retorno+="\n"
#bot_retorno+="<code>apt update; apt upgrade -y;</code>\n"
bot_retorno+="\n"
bot_retorno+="💾 Instalador:\n"
bot_retorno+="\n"
bot_retorno+="<code>wget https://raw.githubusercontent.com/ModVPS/LATAM-OFICIAL/main/LATAM; chmod 777 LATAM; ./LATAM --start</code>\n\n"
bot_retorno+="\n"
bot_retorno+="🔑 Key: (Valida por solo 30 min) \n"
bot_retorno+="\n"
bot_retorno+="<code>${keyfinal}</code>\n"
bot_retorno+="$LINE\n"
bot_retorno+="KEY GENERADAS EN 24hrs: [ $credress/$limteda ]\n"
bot_retorno+="$LINE\n"
echo "$keyfinal" >> ${keytxt}/key_${chatuser}.txt
#bot_retorno+="KEY UASADAS [ $numkey_used ] \n"
#bot_retorno+="KEY GENERADAS [ $numkey_gen ]\n"
#bot_retorno+="$LINE\n"
bot_retorno+="📀 𝙐𝙗𝙪𝙣𝙩𝙪: 𝟭𝟴, 𝟮𝟬.𝟬𝟰 𝙇𝙏𝙎 ¡𝙍𝙚𝙘𝙤𝙢𝙚𝙣𝙙𝙖𝙙𝙤\n"
bot_retorno+="$LINE\n"
#bot_retorno+="🚦 𝗔𝗱𝗾𝘂𝗶𝗲𝗿𝗲 𝗧𝘂 𝗮𝗰𝗰𝗲𝘀𝗼 𝗘𝗻 @LATMXDANBOT\n"

comand_boton "keylat"

msj_del ${message_message_id}

#msj_fun

#upfile_fun ${keytxt}/key_${chatuser}.txt
#rm ${keytxt}/key_${chatuser}.txt
}

fun_lista () {
rm ${SCPT_DIR}/*.x.c &> /dev/null
unset KEY
KEY="$1"
#CRIA DIR
[[ ! -e ${DIR} ]] && mkdir ${DIR}
#ENVIA ARQS
i=0
VALUE+="gerar.sh instgerador.sh http-server.py lista-arq $BASICINST"
for arqx in `ls ${SCPT_DIR}`; do
[[ $(echo $VALUE|grep -w "${arqx}") ]] && continue 
echo -e "[$i] -> ${arqx}"
arq_list[$i]="${arqx}"
let i++
done
#CRIA KEY
[[ ! -e ${DIR}/${KEY} ]] && mkdir ${DIR}/${KEY}
#PASSA ARQS
unset nombrevalue
[[ -z ${nombrevalue} ]] && nombrevalue="${message_from_id}" 
[[ -z ${nombrevalue} ]] && nombrevalue="${callback_query_from_id}"
[[ "$(grep -o -i $nombrevalue /etc/CAT-BOT/num-keys.cont | wc -l)" -ge "$(cat < /etc/CAT-BOT/limita)" ]] && 
{
local bot_retorno="$LINE\n"
#bot_retorno+="$LINE\n"
[[ -z ${callback_query_from_first_name} ]] && firsnme="${message_from_first_name}" || firsnme="${callback_query_from_first_name}"
[[ -z ${callback_query_from_last_name} ]] && lastnme="${message_from_last_name}" || lastnme="${callback_query_from_last_name}"
bot_retorno+="👤 ●⸺ Hola  ${firsnme} ${lastnme}\n"
bot_retorno+="Su 🆔 alcanzó el Límite de KEYS permitidos\n"
#bot_retorno+="▫️ Límite Actual Vencido \n"
bot_retorno+="▫️ Limite Permitido Vencido: $(cat < /etc/CAT-BOT/limita) \n"
#bot_retorno+=" 🧬 Soporte : Ubuntu 14.04 - 16.04 - 18.04 - 20.04\n         𝙍𝙚𝙘𝙤𝙢𝙚𝙣𝙙𝙖𝙙𝙤 𝙐𝙗𝙪𝙣𝙩𝙪 18.04 \n  🪦 Solicita Creditos de tu KEY 🛡️⚔️\n"
#bot_retorno+=" 🔐 『 $(grep -o -i $nombrevalue /etc/gerar-sh-log | wc -l) 』KEY USADAS 🔓,\n"
bot_retorno+="🔴 Generaste 『 $(grep -o -i $nombrevalue /etc/CAT-BOT/num-keys.cont | wc -l) 』Keys en el BOT \n"
bot_retorno+="Espera 12 horas a que se libere o contacta al ADM lo haga\n"
bot_retorno+="$LINE\n"
msj_fun
exit
} ||
echo "$nombrevalue" >> /etc/CAT-BOT/num-keys.cont
numkey_used=$(grep -o -i $nombrevalue /etc/gerar-sh-log | wc -l)
numkey_gen=$(grep -o -i $nombrevalue /etc/CAT-BOT/num-keys.cont | wc -l)
#ADM BASIC
arqslist="$BASICINST"
for arqx in `echo "${arqslist}"`; do
[[ -e ${DIR}/${KEY}/$arqx ]] && continue #ANULA ARQUIVO CASO EXISTA
cp ${SCPT_DIR}/$arqx ${DIR}/${KEY}/
echo "$arqx" >> ${DIR}/${KEY}/${LIST}
done
rm ${SCPT_DIR}/*.x.c &> /dev/null
echo "$nombrevalue" > ${DIR}/${KEY}.name
[[ ! -z $IPFIX ]] && echo "$IPFIX" > ${DIR}/${KEY}/keyfixa
at now +1 hours <<< "rm -rf ${DIR}/${KEY} && rm -rf ${DIR}/${KEY}.name"
}

comand_boton(){
	if [[ ${comando[1]} = "edit" ]]; then
		edit_msj_boton "botao_$1"
	else
		menu_print "botao_$1"
	fi
}

menu_print () {
[[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}

				ShellBot.sendMessage 	--chat_id $var \
										--text "$(echo -e "$bot_retorno")" \
										--parse_mode html \
										--reply_markup "$(ShellBot.InlineKeyboardMarkup -b "$1")"
										return 0
}


edit_msj_boton(){
	[[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}
	[[ ! -z ${callback_query_message_message_id[id]} ]] && message=${callback_query_message_message_id[id]} || message=${return[message_id]}

		ShellBot.editMessageText --chat_id $var \
								 --text "$(echo -e "$bot_retorno")" \
								 --message_id "${message}" \
								 --parse_mode html \
								 --reply_markup "$(ShellBot.InlineKeyboardMarkup -b "$1")"
	return 0
}

download_file () {
# shellbot.sh editado linea 3986
user=User-ID
[[ -e ${CID} ]] && rm ${CID}
local file_id
          ShellBot.getFile --file_id ${message_document_file_id[$id]}
          ShellBot.downloadFile --file_path "${return[file_path]}" --dir "${CIDdir}"
          echo "$(cat ${return[file_path]})" >${CID}
          
local bot_retorno="ID RESTABLECIDO\n"
		bot_retorno+="$LINE\n"
		bot_retorno+="Se restauro con exito!!\nVolver: /menu\n"
		#bot_retorno+="$LINE\n"
		#bot_retorno+="${return[file_path]}\n"
		bot_retorno+="$LINE"
			ShellBot.sendMessage	--chat_id "${message_chat_id[$id]}" \
									--reply_to_message_id "${message_message_id[$id]}" \
									--text "<i>$(echo -e "$bot_retorno")</i>" \
									--parse_mode html
									
return 0
rm ${CIDdir}/${return[file_path]}
}

msj_add () {
	      ShellBot.sendMessage --chat_id ${1} \
							--text "$(echo -e "$bot_retor")" \
							--parse_mode html
}

upfile_fun () {
	[[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}
          ShellBot.sendDocument --chat_id $var  \
                             --document @${1}
}

#invalido_fun () {
	#[[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}
#local bot_retorno="━━━━━━━━━━━━━━━━━━━━\n"
         #bot_retorno+="        LO SIENTO 😞 PUSISTE ALGO INCORRECTO \n"
         #bot_retorno+="         TE AYUDO 👇\n"
         #bot_retorno+="       Quizas debes usar este /keygen\n"
         #bot_retorno+=" ━━━━━━━━━━━━━━━━━━━━\n"
	     #ShellBot.sendMessage --chat_id $var \
							#--text "<i>$(echo -e $bot_retorno)</i>" \
							#--parse_mode html
	#return 0	
#}

msj_fun () {
	[[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}
	      ShellBot.sendMessage --chat_id $var \
							--text "$(echo -e "$bot_retorno")" \
							--parse_mode html
	return 0
}

msj_del () {
	[[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}
		      ShellBot.deleteMessage --chat_id $var --message_id $1 			  
	return 0
}

upfile_src () {
cp ${CID} $HOME/
upfile_fun $HOME/User-ID
rm $HOME/User-ID
}

start_gen () {
unset PIDGEN
PIDGEN=$(ps aux|grep -v grep|grep "http-server.sh")
if [[ ! $PIDGEN ]]; then
screen -dmS generador /bin/http-server.sh -start
local bot_retorno="$LINE\n"
          bot_retorno+="Generador: <u>EN LINEA</u> ✅\n"
	  bot_retorno+="$LINE\n"
msj_fun
else
killall http-server.sh
local bot_retorno="$LINE\n"
          bot_retorno+="Generador: <u>APAGADA</u> ❌\n"
	  bot_retorno+="$LINE\n"
msj_fun
fi
}

infosys_src () {

#HORA Y FECHA
unset _hora
unset _fecha
_hora=$(printf '%(%H:%M:%S)T') 
_fecha=$(printf '%(%D)T') 

#PROCESSADOR
unset _core
unset _usop
_core=$(printf '%-1s' "$(grep -c cpu[0-9] /proc/stat)")
_usop=$(printf '%-1s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")

#MEMORIA RAM
unset ram1
unset ram2
unset ram3
ram1=$(free -h | grep -i mem | awk {'print $2'})
ram2=$(free -h | grep -i mem | awk {'print $4'})
ram3=$(free -h | grep -i mem | awk {'print $3'})

unset _ram
unset _usor
_ram=$(printf ' %-9s' "$(free -h | grep -i mem | awk {'print $2'})")
_usor=$(printf '%-8s' "$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')")

unset os_sys
os_sys=$(echo $(cat -n /etc/issue |grep 1 |cut -d' ' -f6,7,8 |sed 's/1//' |sed 's/      //')) && echo $system|awk '{print $1, $2}'
meu_ip=$(wget -qO- ifconfig.me)
bot_retorno="$LINE\n"
          bot_retorno+="USTED ES MIEMBRO VIP\n"
          bot_retorno+="GRACIAS POR USAR EL BOT\n"
          bot_retorno+="PODRAS GENERAR KEYS ILIMITADOS\n"
          bot_retorno+="S.O: $os_sys\n"
	  bot_retorno+="POR SEGURIDAD NO PUEDO MOSTRAR LA IP DEL ADM\n"
	  #bot_retorno+="$LINE\n"
	  #bot_retorno+="Ram: $ram1 || En Uso: $_usor\n"
	  #bot_retorno+="USADA: $ram3 || LIBRE: $ram2\n"
	  #bot_retorno+="$LINE\n"
	  #bot_retorno+="CPU: $_core || En Uso: $_usop\n"
	  bot_retorno+="$LINE\n"
	  bot_retorno+="FECHA: $_fecha\n"
	  bot_retorno+="HORA: $_hora\n"
          bot_retorno+="$LINE\n"
msj_fun
}


cache_src () {

#MEMORIA RAM
unset ram1
unset ram2
unset ram3
unset _usor
_usor=$(printf '%-8s' "$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')")
ram1=$(free -h | grep -i mem | awk {'print $2'})
ram2=$(free -h | grep -i mem | awk {'print $4'})
ram3=$(free -h | grep -i mem | awk {'print $3'})
	  bot_retorno="==========Antes==========\n"
	  bot_retorno+="Ram: $ram1 || EN Uso: $_usor\n"
	  bot_retorno+="USADA: $ram3 || LIBRE: $ram2\n"
	  bot_retorno+="=========================\n"
msj_fun

sleep 2

sudo sync
sudo sysctl -w vm.drop_caches=3 > /dev/null 2>&1

unset ram1
unset ram2
unset ram3
unset _usor
_usor=$(printf '%-8s' "$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')")
ram1=$(free -h | grep -i mem | awk {'print $2'})
ram2=$(free -h | grep -i mem | awk {'print $4'})
ram3=$(free -h | grep -i mem | awk {'print $3'})
	  bot_retorno="==========Ahora==========\n"
	  bot_retorno+="Ram: $ram1 || EN Uso: $_usor\n"
	  bot_retorno+="USADA: $ram3 || LIBRE: $ram2\n"
	  bot_retorno+="=========================\n"
msj_fun
}

myid_src () {
MSG_id=$((${message_message_id} + 1 ))
[[ -z ${callback_query_from_username} ]] && nUSER=${message_from_username} || nUSER=${callback_query_from_username}
[[ ! -z $(cat /etc/CAT-BOT/Admin-ID|grep "${chatuser}" ) ]] && { #ENTRA A VERIFICAR ADM
bot_retorno="  $LINE\n"
bot_retorno+="▫️ Hola @${nUSER} \n"
bot_retorno+="▫️ Bienvenido ADMIN\n"
bot_retorno+="\n"
bot_retorno+=" 𝗜𝗗 𝗖𝗔𝗡𝗖𝗘𝗟𝗔𝗗𝗢 ❌\n"
bot_retorno+="\n"
bot_retorno+="        No es necesario\n"
bot_retorno+="        Mostrarte tu ID\n"
bot_retorno+="$LINE\n"
#bot_retorno+="<b>bold</b>, <strong> bold</strong> \n
#<i>italic</i>, <em>italic</em>\n"
bot_retorno+=" <pre>BOT ELIMINANDO MESAJE ${message_message_id} </pre>\n"
bot_retorno+=" <code>BORRAREMOS ESTE CODE ${MSG_id} </code>\n"
msj_fun
#sleep 5s
#msj_del ${message_message_id}
#msj_del ${MSG_id}
} || { # SINO ES ADM - CAMBIA A USUARIOS AUTORIZADOS
	[[ $(cat ${CID}|grep "${chatuser}" ) = "" ]] && { # ENTRA A VERIFCAR USUARIOS QUE NO EXISTEN
		bot_retorno="$LINE\n"
		#bot_retorno+=" ❗️ 𝗦𝗜𝗡 𝗔𝗖𝗖𝗘𝗦𝗢 𝗩𝗜𝗣 ❗️ \n"
               ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
               --text "⌛ VERIFICANDO ACCESO VIP"
		[[ -z ${nUSER} ]] && bot_retorno+=" ⚠️ USUARIO SIN ALIAS ⚠️ SIN AUTORIZACION\n" || bot_retorno+="Hola【 @${nUSER} 】, Aviso ❗️ \n"
                bot_retorno+="\n"
		bot_retorno+="🔘 No cuentas con Acceso VIP, adquiere uno . \n"
		bot_retorno+="\n"
        bot_retorno+="❗️ 𝗦𝗜𝗡 𝗖𝗥𝗘𝗗𝗜𝗧𝗢𝗦 𝗗𝗜𝗦𝗣𝗢𝗡𝗜𝗕𝗟𝗘𝗦 ❗️ \n"
        bot_retorno+="🆔 ●⸺【 <code>${chatuser}</code> 】\n"
        #bot_retorno+="\n"
        bot_retorno+="Usa el comando /menu \n"
        bot_retorno+="$LINE\n"
        comand_boton "atras"
	#msj_fun
		#sleep 5s
		#msj_del ${message_message_id}
		#msj_del ${MSG_id}
	} || { # ENTRA A  IDS YA REGISTRADOS
			bot_retorno="  $LINE\n"
                         data_user=$(cat ${CID}|grep "${chatuser}" | awk -F "|" '{print $2}')
			data_sec=$(date +%s)
			data_user_sec=$(date +%s --date="$data_user")
			variavel_soma=$(($data_user_sec - $data_sec))
			dias_use=$(($variavel_soma / 86400))
			[[ "$dias_use" -le 0 ]] && dias_use=0 || dias_use=$(($dias_use + 1))
			 [[ -z ${callback_query_from_first_name} ]] && firsnme="${message_from_first_name}" || firsnme="${callback_query_from_first_name}"
			 [[ -z ${callback_query_from_last_name} ]] && lastnme="${message_from_last_name}" || lastnme="${callback_query_from_last_name}"
                         ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
                         --text "🟢 ACCESO VIP VERIFICADO"
                         bot_retorno+="👤 ●⸺ [ ${firsnme} ${lastnme} ] \n"
                         bot_retorno+="🆔 ●⸺ [ <code>${chatuser}</code> ] \n"
                         bot_retorno+="\n"
                        bot_retorno+="Actualmente tu acceso está activo ✅ \n"
                        bot_retorno+="Tu fecha límite de membresía en el BOT es \n"
                        datexp=$(date "+%F" -d " + $DIAS days") && valid=$(date '+%C%y-%m-%d' -d " + $DIAS days")
			bot_retorno+="El día $data_user | $(date +%R)\n"
			bot_retorno+="\n"
			#bot_retorno+="$LINE\n"
			#bot_retorno+="🏧 𝗧𝘂𝘀 𝗖𝗿𝗲𝗱𝗶𝘁𝗼𝘀 𝗦𝗼𝗻 ♾️\n"
                        bot_retorno+="Para volver al menú pulsa el boton\n"
			
                        comand_boton "atras2"
			#msj_fun
			
		
		}
						} # FIN VERIFICAR ADM
}

deleteID_src () {
          bot_retorno="/del"
      reply
      listID_src
}

deleteIDS_reply () {
ids=$(echo ${message_text[$id]} | awk '{print $1}' | sed -e 's/[^a-z0-9 -]//ig')
idc=$(echo ${message_text[$id]} | awk '{print $3}' | sed -e 's/[^a-z0-9 -]//ig')
sed -i "/${message_text[$id]}/d" /root/RegBOT/banID
sed -i "/${message_text[$id]}/d" /root/RegBOT/U_check.txt
bot_retorno="$LINE\n"
          bot_retorno+=" ID ELIMINADO EXITOSAMENTE!\n"
          bot_retorno+=" ID Eliminado: ${ids}\n"
          bot_retorno+="$LINE\n"
		
	  
          bot_retor=" 🟢 𝗧𝗨 𝗜𝗗 𝗙𝗨𝗘 𝗗𝗘𝗦𝗕𝗟𝗢𝗤𝗨𝗘𝗔𝗗𝗔 🟢 \n"
          #bot_retor+=" 👤『 $message_from_first_name $message_from_last_name 』\n"
          #bot_retor+="Desafortunadamente su acceso ha finalizado\n"
          bot_retor+="⚠️ Advertencia ⚠️ [ NO-SPAMEAR ] \n"
          bot_retor+="Ahora puedes volver a usar el menu  \n"
          bot_retor+="Si tienes Dudas, Contacta con el ADM\n"
          #bot_retor+="$LINE\n"
          bot_retor+="xD \n"
          #bot_retor+="Para la reactivacion recuerda enviar tu ID\n"
          bot_retor+="$LINE\n"
      comand_boton "atras"
      msj_fun
      msj_add ${ids}
      upfile_src

}

addIDS_reply () {
ids=$(echo ${message_text[$id]} | awk '{print $1}' | sed -e 's/[^a-z0-9 -]//ig')
idc=$(echo ${message_text[$id]} | awk '{print $3}' | sed -e 's/[^a-z0-9 -]//ig')
echo "${message_text[$id]}" >> /root/RegBOT/banID
bot_retorno="$LINE\n"
bot_retorno+=" ID BLOQUEADO EXITOSAMENTE!\n"
bot_retorno+=" ID Bloqueado: ${ids}\n"
bot_retorno+="$LINE\n"
bot_retor="dev \n"
#bot_retor+=" 👤『 $message_from_first_name $message_from_last_name 』\n"
#bot_retor+="Desafortunadamente su acceso ha finalizado\n"
#bot_retor+="⚠️ Advertencia ⚠️ [ NO-SPAMEAR ] \n"
#bot_retor+="Su ID ha sido bloqueado\n"
#bot_retor+="Si tienes Dudas, Contacta con el ADM\n"
#bot_retor+="$LINE\n"
#bot_retor+="xD \n"
#bot_retor+="Para la reactivacion recuerda enviar tu ID\n"
bot_retor+="$LINE\n"
comand_boton "atras"
msj_fun
msj_add ${ids}
upfile_src
}


list_IP () {
unset lsid
unset idchek
[[ -z ${idchek} ]] && idchek="${message_from_id}" 
[[ -z ${idchek} ]] && idchek="${callback_query_from_id}"
[[ -z "$(cat /etc/CAT-BOT/User-ID | grep ${idchek} )" ]] && {
	[[ "$(cat /etc/CAT-BOT/Admin-ID)" == "${idchek}" ]] && {
	cat /var/www/html/dani/checkIP.log > /tmp/ips
	echo -e " $(cat /tmp/ips | awk '{print $3}' | uniq)" > /tmp/ipchek
	lsid=$(cat -n /tmp/ipchek)
	local bot_retorno=" $LINE\n"
          bot_retorno+='  - ULTIMOS IP´S UNICOS CAPTURADOS  \n'
          bot_retorno+="  -  TIENES $(cat /var/www/html/dani/checkIP.log | wc -l) IP´s CAPTURADAS \n"
          bot_retorno+="$LINE\n"
          bot_retorno+=" ${lsid}\n"
          bot_retorno+="$LINE\n"
			}

} || {
cat /var/www/html/dani/checkIP.log | grep "${idchek}" > /tmp/ips
echo -e " $(cat /tmp/ips | awk '{print $3}' | uniq)" > /tmp/ipchek
lsid=$(cat -n /tmp/ipchek)
local bot_retorno=" $LINE\n"
          bot_retorno+='  - ULTIMOS IP´S UNICOS CAPTURADOS  \n'
          bot_retorno+="  -  TIENES $(cat /var/www/html/dani/checkIP.log | grep ${idchek} | wc -l) IP´s CAPTURADAS DE TUS GENERADAS \n"
          bot_retorno+="$LINE\n"
          bot_retorno+=" ${lsid}\n"
          bot_retorno+="$LINE\n"
}
msj_fun
}

addID_src () {
          bot_retorno="/add"
      reply
}





# Declarar un diccionario para almacenar los datos de conexión de cada ID de usuario
#declare -A user_connections

# Declarar un diccionario para almacenar los datos de conexión de cada ID de usuario
#declare -A user_connections

addIPss_reply() {
    local ip=$(echo "${message_text[$id]}" | awk -F '|' '{print $1}' | awk '{print $1}')
    local chat_id="${message_chat_id[$id]}"
    
    local bot_retorno="Datos de la IP: $ip\n\n"
    
    # Obtener información de la IP utilizando ipinfo.io
    local info_ip=$(curl -s "https://ipinfo.io/$ip/json")

    if [[ -n $info_ip ]]; then
        # Analizar y formatear la respuesta JSON
        local ciudad=$(echo "$info_ip" | jq -r '.city')
        local pais=$(echo "$info_ip" | jq -r '.country')
        local proveedor=$(echo "$info_ip" | jq -r '.org')

        bot_retorno+="Ciudad: $ciudad\n"
        bot_retorno+="País: $pais\n"
        bot_retorno+="Proveedor: $proveedor\n"
    else
        bot_retorno+="❌ Error: No se pudo obtener información de la IP. ❌\n"
    fi
    
    ShellBot.sendMessage --chat_id "$chat_id" --text "$bot_retorno"
}

addIP_reply () {

if sed -i "/${message_text[$id]}/d" /var/www/html/ChumoGH/checkIP.log; then
bot_retorno="$LINE\n"
bot_retorno+="  IP ELIMINADA DE REGISTRO EXITOSAMENTE!\n"
bot_retorno+="  IP : ${message_text[$id]} \n"
bot_retorno+="$LINE\n"
else
bot_retorno="$LINE\n"
bot_retorno+="  ERROR AL ELIMINAR IP DE REGISTROS \n"
bot_retorno+="  POSIBLEMENTE ${message_text[$id]} NO EXISTA \n"
bot_retorno+="$LINE\n"
fi
msj_fun
}






link_src () {
	bot_retorno="$LINE\n"
	bot_retorno+="SCRIPT LATMX x.9\n"
	bot_retorno+="$LINE\n"
	bot_retorno+="<code>wget https://raw.githubusercontent.com/mo.sh; chmod 777 didi.sh; ./sh</code>\n"
	bot_retorno+="$LINE\n"

msj_fun
}

listID_GEN () {
unset bot_lin
n=1
for i in $(cat /root/RegBOT/banID | awk '{print $1}' | sed -e 's/[^a-z0-9 -]//ig'); do 
idlog=$(cat /root/RegBOT/banID | grep "$i" | awk '{print $3}')
#idGEN=$(grep -o -i $idlog /etc/CAT-BOT/num-key.cont | wc -l)
#[[ -e /etc/CAT-BOT/num-key.cont ]] && idGEN=$(cat /etc/CAT-BOT/num-key.cont | grep $i | wc -l) || idGEN=0
bot_lin+="  $n] > <tg-spoiler>${i}</tg-spoiler> | $idlog | ${idGEN}\n"
#lsid=$(cat -n ${CID})
let n++
done
local bot_retorno="$LINE\n"
          bot_retorno+='𝗜𝗗´𝗦 𝗕𝗟𝗢𝗤𝗨𝗘𝗔𝗗𝗢𝗦 𝗣𝗢𝗥 𝗦𝗣𝗔𝗠 \n'
          bot_retorno+="$LINE\n"
          bot_retorno+=" $(echo -e ${bot_lin}) "  #|column -t -s '-')"
          bot_retorno+="$LINE\n"
comand_boton "atras"
return 0
#msj_fun
}

searchID_reply () {
searchID=$(cat -n /root/RegBOT/banID | grep "${message_text[$id]}")
ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
--text "🔍 BUSCANDO ID BLOQUEADO"
bot_retorno="$LINE\n"
        bot_retorno+="𝗠𝗢𝗦𝗧𝗥𝗔𝗡𝗗𝗢 𝗥𝗘𝗦𝗨𝗟𝗧𝗔𝗗𝗢𝗦 𝗗𝗘 𝗕𝗨𝗦𝗤𝗨𝗘𝗗𝗔!\n"
		bot_retorno+=" $LINE\n"
		[[ ! -z ${searchID} ]] && bot_retorno+=" N°${searchID} 🔴 BLOQUEADO \n" || bot_retorno+=" ID NO ENCONTRADO \n"
      comand_boton "atras2"
      return 0
      #msj_fun
}

listID_src () {
lsid=$(cat -n ${CID})
ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
--text "👤 BUSCANDO ID REGISTRADOS"
local bot_retorno="$LINE\n"
          bot_retorno+="𝗥𝗘𝗦𝗨𝗟𝗧𝗔𝗗𝗢𝗦 𝗗𝗘 🆔 𝗥𝗘𝗚𝗜𝗦𝗧𝗥𝗔𝗗𝗢𝗦 \n"
          bot_retorno+="▫️ 𝗟𝗶𝘀𝘁𝗮 𝗱𝗲 𝗜𝗗 𝗔𝗰𝘁𝗶𝘃𝗼𝘀\n"
          bot_retorno+="$LINE\n"
          bot_retorno+="${lsid}\n"
          bot_retorno+="$LINE\n"

comand_boton "atras2"
return 0
#msj_fun
}

listkey_src () {
  # Leer el archivo de logs y extraer el ID y la key usada
  log=$(cat /etc/gerar-sh-log | awk '{print $1, $2}')

  # Contar cuántas veces se ha usado cada key para cada id
  count=$(echo "$log" | sort | uniq -c)

  # Concatenar la información del ID y el número de veces que se ha usado cada key separados por el carácter |
  count=$(echo "$count" | awk '{printf "%-11s | %2s\n", $1, $2}')

  ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
    --text "👤 BUSCANDO KEY USADAS POR ID"

  local bot_retorno="$LINE\n"
  bot_retorno+="𝗥𝗘𝗦𝗨𝗟𝗧𝗔𝗗𝗢𝗦 𝗗𝗘 𝗞𝗘𝗬 𝗨𝗦𝗔𝗗𝗢𝗦 𝗟𝗔𝗧𝗔𝗠 \n"
  bot_retorno+="🔑Key  ——-------— 🆔\n"
  bot_retorno+="$LINE\n"
  bot_retorno+="$count\n"
  bot_retorno+="$LINE\n"

  comand_boton "atras2"
  return 0
  #msj_fun
}


ayuda_id(){
ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
--text "💰 LISTA DE PRECIOS DISPONIBLES"
bot_retorno="$LINE\n"
bot_retorno+="ɪɴғᴏʀᴍᴀᴄɪᴏɴ sᴏʙʀᴇ ʟᴏs ᴘʀᴇᴄɪᴏs \n"
bot_retorno+="► PRECIO PAYPAL  ► PRECIO MEXICANO\n"
bot_retorno+="► 7 DIAS💰1.5 USD     ► 💰30 MXN\n"
bot_retorno+="► 13 DIAS💰2.3 USD   ► 💰40.06 MXN\n"
bot_retorno+="► 35 DIAS💰3.98 USD ► 💰79 MXN\n"
bot_retorno+="► 90 DIAS💰7 USD       ► 💰160 MXN\n"
bot_retorno+="TRANSFERENCIA\n"
bot_retorno+="<code>646180192100197089</code>\n"

			 bot_retorno+="$LINE\n"
                        comand_boton "atras"
			return 0
			}

prices_on () {
[[ -z ${callback_query_from_first_name} ]] && firsnme="${message_from_first_name}" || firsnme="${callback_query_from_first_name}"
[[ -z ${callback_query_from_last_name} ]] && lastnme="${message_from_last_name}" || lastnme="${callback_query_from_last_name}"
local msg
                  msg=' •••••••••••••••••••••••••••••••••••••••••••••••••\n'
		  msg+=" Hola, 『 ${firsnme} ${lastnme} 』 \n"
		  msg+=' •••••••••••••••••••••••••••••••••••••••••••••••••\n' 
                  msg+=' $0.70 USD - Acceso ilimitado al BOT 4 dias \n'   
		  msg+=' $1.00 USD - Acceso ilimitado al BOT 7 dias \n'   
                  msg+=' $1.50 USD - Acceso ilimitado al BOT 15 dias \n'   
                  msg+=' $2.00 USD - Acceso ilimitado al BOT 30 dias \n'   
		  msg+=' $3.00 USD - Acceso ilimitado al BOT 60 dias\n' 
		  msg+=' $4.00 USD - Acceso ilimitado al BOT 90 dias\n' 
		  msg+=' $5.00 USD - Acceso ilimitado al BOT 180 dias\n' 
		  msg+=' $9.00 USD - Acceso ilimitado al BOT 365 dias\n' 
		  msg+='•••••••••••••••••••••••••••••••••••••••••••••••••\n' 
		  msg+=" BOT PREMIUM CON ACCESO Ilimitado \n Incluyendo tu reseller en la Key! \n Soporte, Actualizaciones y MAS!!)\n"
		  msg+='•••••••••••••••••••••••••••••••••••••••••••••••••\n'  
		  msg+=" VISITA NUESTRO CATALOGO EN https://shoppy.gg/ \n"
		  msg+='•••••••••••••••••••••••••••••••••••••••••••••••••\n' 
          
          ShellBot.sendMessage	--chat_id "${message_chat_id[$id]}" \
							--reply_to_message_id "${message_message_id[$id]}" \
							--text "<i>$(echo -e $msg)</i>" \
							--parse_mode html
return 0
}

menu_src () {
bot_retorno="━━━━◢ 𝗠𝗘𝗡𝗨 𝗜𝗡𝗜𝗖𝗜𝗢 ◣━━━━\n"
         [[ -z ${callback_query_from_username} ]] && nUSER=${message_from_username} || nUSER=${callback_query_from_username}
	 unset nombrevalue
[[ -z ${nombrevalue} ]] && nombrevalue="${message_from_id}" 
[[ -z ${nombrevalue} ]] && nombrevalue="${callback_query_from_id}"
numkey_used=$(grep -o -i $nombrevalue /etc/gerar-sh-log | wc -l)
numkey_gena=$(grep -o -i $nombrevalue /etc/CAT-BOT/num-keys.cont | wc -l)
limconta=$(cat /etc/CAT-BOT/limita) 
[[ "$limconta" -ge "998" ]] && limteda="♾️" || limteda=$(cat /etc/CAT-BOT/limita)
[[ "$(( $limconta - $numkey_gena ))" -ge "900" ]] && credress="♾️" || credress=$(( $limconta - $numkey_gena))
         ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
                 --text "⬅️ REGRESANDO AL MENU INICIO"
	 if [[ $(echo $permited|grep "${chatuser}") = "" ]]; then
		 if [[ $(cat ${CID}|grep "${chatuser}") = "" ]]; then
		 [[ -e /root/RegBOT/banID ]] && idBAN=$(cat /root/RegBOT/banID) || idBAN=""
		 [[ -z "$(echo $idBAN | grep "${chatuser}")" ]] && {
                         bot_retorno+="\n"
			 bot_retorno+="🔴 ●⸺ 𝗦𝗜𝗡 𝗔𝗖𝗖𝗘𝗦𝗢 𝗩𝗜𝗣 \n"
                         bot_retorno+="\n"
			 [[ -z ${callback_query_from_first_name} ]] && firsnme="${message_from_first_name}" || firsnme="${callback_query_from_first_name}"
			 [[ -z ${callback_query_from_last_name} ]] && lastnme="${message_from_last_name}" || lastnme="${callback_query_from_last_name}"
                         bot_retorno+="👤 ●⸺ [ ${firsnme} ${lastnme} ] \n"
                         bot_retorno+="🆔 ●⸺ [ <code>${chatuser}</code> ] \n"
                         bot_retorno+="\n"
                         bot_retorno+="🗓️ TOTAL DIAS DE ACCESO\n"
                         bot_retorno+="[ ❌ 𝗦𝗶𝗻 𝗮𝗰𝗰𝗲𝘀𝗼 𝗩𝗜𝗣 ❌ ]\n"
                         bot_retorno+="📅 VIGENCIA DEL ACCESO\n"
                         bot_retorno+="[ ❌ 𝗦𝗶𝗻 𝗮𝗰𝗰𝗲𝘀𝗼 𝗩𝗜𝗣 ❌ ]\n"
                         bot_retorno+="\n"
			 bot_retorno+="HORARIO: $(printf '%(%D⏰%H:%M:%S)T')\n"
			bot_retorno+="Hola :${firsnme} ${lastnme} \n"
			#bot_retorno+="Hola :@${message_from_username[$id]} \n"
			bot_retorno+="Todavia no cuentas con una membresia activa\n"
			#bot_retorno+="️┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅\n"
			#bot_retorno+="┅┅┅┅┅┅\n"
			bot_retorno+="🔑Total Instalado:『 $numkey_used 』\n"
			bot_retorno+="⚠️Limite Actual (24hrs): [ $credress/$limteda ]\n"
			 bot_retorno+="🔘 Recuerda No hacer 𝗦𝗣𝗔𝗠 \n"
			 #bot_retorno+="➜/acceso (Pedir Autorizacion)\n"
			#bot_retorno+="➜/ayuda (modo de uso)\n"
			 #bot_retorno="$LINE\n"
                         comand_boton "user1"
                         msj_del ${message_message_id}
                         return 0
		         #msj_del ${message_message_id}
			 } || {
			 bot_retorno="$LINE\n"
			 bot_retorno+="     ⚠️ 𝗦𝗨 𝗜𝗗 𝗙𝗨𝗘 𝗕𝗔𝗡𝗘𝗔𝗗𝗢 ⚠️ \n"
                         bot_retorno+="\n"
                         [[ -z ${callback_query_from_first_name} ]] && firsnme="${message_from_first_name}" || firsnme="${callback_query_from_first_name}"
		         [[ -z ${callback_query_from_last_name} ]] && lastnme="${message_from_last_name}" || lastnme="${callback_query_from_last_name}"
                         bot_retorno+="👤 ●⸺ [ ${firsnme} ${lastnme} ] \n"
                         bot_retorno+="🆔 ●⸺ [ <code>${chatuser}</code> ] \n"
                         bot_retorno+="\n"
                         bot_retorno+="❗️ [ SPAM-BOT ] Detected ❗️ \n"
			 #bot_retorno+="\n"
			 bot_retorno+="$LINE\n"
			 msj_del ${message_message_id}
			 comand_boton "dex"
			 }

			 
			 
		 else
		VPSsec=$(date +%s)
			dia="$(cat ${CID}|grep -w "$chatuser"|cut -d'|' -f2)"
			#
             DataSec=$(date +%s --date="$dia")
             
            [[ "$VPSsec" -gt "$DataSec" ]] && {
      local us="❯ ══━━━━⎊⎊━━━━══ ❮ ️\nUSUARIO 🆔: <code>$chatuser</code> EXPIRADO\n"
				
					ShellBot.sendMessage --chat_id ${permited[$id]} \
							--text "$(echo -e "$us")" \
							--parse_mode html 
				EXPTIME="EXPIRADO"
				 
			   rm -rf ${USRdatabase2}/Mensaje_$chatuser.txt &>/dev/null
  	    	rm ${keytxt}/key_${chatuser}.txt &>/dev/null
      		
                    sed -i "/$chatuser/d" ${CID}
            [[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}         
	      ShellBot.sendMessage --chat_id $var \
							--text "$(echo -e USUARIO EXPIRADO)" \
							--parse_mode html 
            return 0 
} || {
EXPTIME="[$(($(($DataSec - $VPSsec)) / 86400))] DIAS"
		#creditos agregados
	        
                [[ -z ${callback_query_from_first_name} ]] && firsnme="${message_from_first_name}" || firsnme="${callback_query_from_first_name}"
                [[ -z ${callback_query_from_last_name} ]] && lastnme="${message_from_last_name}" || lastnme="${callback_query_from_last_name}"
		unset creditos
		creditos="$(cat /etc/CAT-BOT/Creditos/Mensaje_$chatuser.txt)"
		  [[ ! $creditos ]] && credi="Defaul: ${firsnme} ${lastnme}" || credi="Personal: $creditos"

		#menú User
		unset PID_GEN
		 PID_GEN=$(ps x|grep -v grep|grep "http-server.sh")
		 [[ ! $PID_GEN ]] && PID_GEN='(APAGADA) ❌' || PID_GEN='(EN LINEA) ✅'
                # data_user=$(cat ${CID}|grep "${chatuser}" | awk -F "|" '{print $2}')
		data_user=$(cat ${CID}|grep "${chatuser}" | awk -F "|" '{print $2}')
			data_sec=$(date +%s)
			data_user_sec=$(date +%s --date="$data_user")
			variavel_soma=$(($data_user_sec - $data_sec))
			dias_use=$(($variavel_soma / 86400))
			[[ "$dias_use" -le 0 ]] && dias_use=0 || dias_use=$(($dias_use + 1))
	
                        unset usadas
		 usadas="$(cat /etc/http-instas)"
		 [[ ! $usadas ]] && k_used="0" || k_used="$usadas"
                 numkey_used=$(grep -o -i $nombrevalue /etc/gerar-sh-log | wc -l)
		 numkey_gen=$(grep -o -i $message_chat_id /etc/CAT-BOT/num-key.cont | wc -l)
                 unset nombrevalue
                 [[ -z ${nombrevalue} ]] && nombrevalue="${message_from_id}" 
                 [[ -z ${nombrevalue} ]] && nombrevalue="${callback_query_from_id}"
                 numkey_gen=$(grep -o -i $nombrevalue /etc/CAT-BOT/num-key.cont | wc -l)
                 limcont=$(cat /etc/CAT-BOT/limit) 
                 [[ "$limcont" -ge "998" ]] && limted="♾️" || limted=$(cat /etc/CAT-BOT/limit)
                 [[ "$(( $limcont - $numkey_gen ))" -ge "900" ]] && credres="🎊 Usted tiene keys Ilimitados" || credres="⚠️Keys Restantes a Generar: $(( $limcont - $numkey_gen))"
                 [[ ! ${keytxt}/key_$chatuser.txt ]] && kg="0" || kg=$(cat ${keytxt}/key_$chatuser.txt | wc -l)
                 ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
                 --text "⬅️ VOLVIENDO AL MENU INICIO"
			#bot_retorno+="$LINE\n"
                         bot_retorno+="\n"
			 bot_retorno+="🟢 ●⸺ 𝗖𝗢𝗡 𝗔𝗖𝗖𝗘𝗦𝗢 𝗩𝗜𝗣 \n"
                         bot_retorno+="\n"
			 [[ -z ${callback_query_from_first_name} ]] && firsnme="${message_from_first_name}" || firsnme="${callback_query_from_first_name}"
			 [[ -z ${callback_query_from_last_name} ]] && lastnme="${message_from_last_name}" || lastnme="${callback_query_from_last_name}"
                         bot_retorno+="👤 ●⸺ [ ${firsnme} ${lastnme} ] \n"
                         bot_retorno+="🆔 ●⸺ [ <code>${chatuser}</code> ] \n"
                         bot_retorno+="\n"
                         bot_retorno+="🗓 𝗧𝗢𝗧𝗔𝗟 𝗗𝗜𝗔𝗦 𝗗𝗘 𝗔𝗖𝗖𝗘𝗦𝗢\n"
                     #datexp=$(date "+%F" -d " + $DIAS days") && valid=$(date '+%C%y-%m-%d' -d " + $DIAS days")
                         bot_retorno+="🔘 ●⸺ Días Restantes $EXPTIME \n"
			 bot_retorno+="📅 𝗘𝗟 𝗔𝗖𝗖𝗘𝗦𝗢 𝗙𝗜𝗡𝗔𝗟𝗜𝗭𝗔 \n"
                         bot_retorno+="🔘 ●⸺ El dia [ $data_user ] \n"
			 bot_retorno+="\n"
		    bot_retorno+="📳 𝗡𝗢𝗧𝗜𝗙𝗜𝗖𝗔𝗖𝗜𝗢𝗡𝗘𝗦 𝗗𝗘𝗟 𝗕𝗢𝗧 \n"
                bot_retorno+="$(cat < /etc/CAT-BOT/resell)\n"
                bot_retorno+="\n"
		bot_retorno+="▫️ ●⸺ Hola : @${nUSER}  \n"
		bot_retorno+="▫️Actualmente Su ID está Activo ✔️\n"
		bot_retorno+="📡 ●⸺ BOT Status [ $PID_GEN ]\n"
		bot_retorno+="🧑‍💻 Reseller $credi\n"
		bot_retorno+="🔐 ●⸺ Total Key Usadas:『 $numkey_used 』\n"
                bot_retorno+="🔑 ●⸺ Total Key Generadas: [ $kg ]\n"
                bot_retorno+="🔑|- Keys Generadas en 24hrs [ $numkey_gen ]\n"
                bot_retorno+="🔰 $credres \n"
	        bot_retorno+="📍 Version V.5.8 \n"
		#bot_retorno+="Gen User $numkey_gen\n"
		#bot_retorno+="️┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅\n"
		#bot_retorno+="┅┅┅┅┅┅\n"
		#msj_del ${message_message_id}
		comand_boton "user"
		msj_del ${message_message_id}
         
			}
		 fi
		 
	 else
	vv=$(ps x|grep -v grep|grep "veri")
[[ ! $vv ]] && ve="[ DESACTIVADO ]" || ve="[ ACTIVADO ]"
		 unset PID_GEN
		 PID_GEN=$(ps x|grep -v grep|grep "http-server.sh")
		[[ ! -z ${message_from_username[$id]} ]] && ad="@${message_from_username[$id]}" || ad="${message_from_first_name[$id]}"
		echo "${ad}" >/etc/botuser
		 [[ ! $PID_GEN ]] && PID_GEN='(APAGADA) ❌' || PID_GEN='(EN LINEA) ✅'
		 [[ -z ${callback_query_from_first_name} ]] && firsnme="${message_from_first_name}" || firsnme="${callback_query_from_first_name}"
                [[ -z ${callback_query_from_last_name} ]] && lastnme="${message_from_last_name}" || lastnme="${callback_query_from_last_name}"
		unset creditos
		creditos="$(cat /etc/CAT-BOT/Creditos/Mensaje_$chatuser.txt)"
		  [[ ! $creditos ]] && credi="Defaul: ${firsnme} ${lastnme}" || credi="Personal: $creditos"

                  $(cat /etc/CAT-BOT/User-ID| wc -l)
		 unset usadas
		 usadas="$(cat /etc/http-instas)"
		 [[ ! $usadas ]] && k_used="0" || k_used="$usadas"
                 [[ ! ${keytxt}/key_$chatuser.txt ]] && kg="0" || kg=$(cat ${keytxt}/key_$chatuser.txt | wc -l)
                ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
                --text "⬅️ RETORNANDO AL MENU INICIO"
		 #bot_retorno="$LINE\n"
		 bot_retorno+=" HOLA BIENVENIDO ADM AL BOTGEN\n"
		bot_retorno+="🔘 ●⸺ 𝗣𝗮𝗻𝗲𝗹 𝗱𝗲 𝗰𝗼𝗻𝘁𝗿𝗼𝗹 | SCRIPT \n"
                 bot_retorno+="\n"
                 bot_retorno+="🆔 ●⸺ USUARIOS 𝗩𝗜𝗣 ACTIVOS: $(cat /etc/CAT-BOT/User-ID| wc -l)\n"
		 bot_retorno+="🟢 ●⸺ BOT STATUS:  $PID_GEN \n"
		bot_retorno+="📵 ●⸺ AUTO-DEL:  $ve \n"
                bot_retorno+="🔔NOTY BOT USUARIOS \n"
                bot_retorno+="$(cat < /etc/CAT-BOT/resell)\n"
                bot_retorno+="🔐 ●⸺ Key Activas Sin Usar 『 $(ls /etc/http-shell/ | grep name | wc -l) 』 🗝️ \n"
                bot_retorno+="🌐 ●⸺ Inst. Totales del SCRIPT [ $k_used ] \n"
                bot_retorno+="🔑 ●⸺ Keys Generadas del ADM [ $kg ] \n"
		bot_retorno+="👤 ●⸺ Reseller $credi\n"
		 #bot_retorno+="$LINE\n"
		 [[ -z ${callback_query_from_first_name} ]] && firsnme="${message_from_first_name}" || firsnme="${callback_query_from_first_name}"
		 [[ -z ${callback_query_from_last_name} ]] && lastnme="${message_from_last_name}" || lastnme="${callback_query_from_last_name}"
		 bot_retorno+="🔰 ●⸺ ADMIN: ${firsnme} ${lastnme} \n"
		 bot_retorno+="$LINE\n"
		 comand_boton "conf"
	 fi	
}

mensajecre(){
  error_fun () {
local bot_retorno="$LINE\n"
		  bot_retorno+="USAR EL COMANDO DE ESTA MANERA\n"
		  bot_retorno+="$LINE\n"
          bot_retorno+="Ejemplo: /resell  @d\n"
          bot_retorno+="$LINE\n"
	      ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
							--text "<i>$(echo -e "$bot_retorno")</i>" \
							--parse_mode html
return 0
}

[[ -z $1 ]] && error_fun && return 0

echo "$1" > ${USRdatabase2}/Mensaje_$chatuser.txt
          bot_retorno="$LINE\n"
          bot_retorno+="✅Creditos Cambiado ✅\n"
          bot_retorno+="$LINE\n"
          bot_retorno+="Nuevo Reseller: $1\nPARA REGRESAR /menu\n"
          bot_retorno+="$LINE"
      
          [[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}
	     ShellBot.sendMessage --chat_id $var \
							--text "<i>$(echo -e "$bot_retorno")</i>" \
							--parse_mode html
							
	return 0
                    }

[[ -d /root/RegBOT ]] || mkdir /root/RegBOT                  
 autori() {
MSG_id=$((${message_message_id} + 1 ))
[[ -z ${callback_query_from_first_name} ]] && firsnme="${message_from_first_name}" || firsnme="${callback_query_from_first_name}"
[[ -z ${callback_query_from_last_name} ]] && lastnme="${message_from_last_name}" || lastnme="${callback_query_from_last_name}"
[[ -z ${callback_query_from_username} ]] && nUSER=${message_from_username} || nUSER=${callback_query_from_username}
[[ -e /root/RegBOT/U_check.txt ]] && n_soli=$(cat /root/RegBOT/U_check.txt | grep ${chatuser} | wc -l) || n_soli=1
[[ $n_soli < 2 ]] && {
echo "${chatuser}" >> /root/RegBOT/U_check.txt
          bot_retor="$LINE\n"
          bot_retor+=" Cliente 『 ${firsnme} ${lastnme} 』Solicita Autorización\n"
		  [[ -z ${nUSER} ]] && bot_retor+=" ⚠️ USUARIO SIN ALIAS ⚠️\n" || bot_retor+=" <u> ALIAS</u>: @${nUSER} CON $n_soli INTENTO\n"
		  bot_retor+="$LINE\n"
		  bot_retor+=" EJEMPLO $MSG_id <tg-spoiler>${chatuser}</tg-spoiler> | <u>DIAS</u> \n"
          bot_retor+=" O SOLO DA CLICK AQUI 👉 /add , LUEGO COPIA ALGUNO DE ABJO\n"
          #ot_retor+=" 4 DIAS COPIA 👉 <code>${chatuser} | 4</code> \n"
          #bot_retor+=" 7 DIAS COPIA 👉 <code>${chatuser} | 7</code> \n"
          #bot_retor+=" 15 DIAS COPIA 👉 <code>${chatuser} | 15</code> \n"
          #bot_retor+=" 30 DIAS COPIA👉 <code>${chatuser} | 30</code> \n"
          #bot_retor+=" 60 DIAS COPIA 👉 <code>${chatuser} | 60</code> \n"
          #bot_retor+=" 90 DIAS COPIA👉 <code>${chatuser} | 90</code> \n"
          #bot_retor+=" 180 DIAS COPIA👉 <code>${chatuser} | 179</code> \n"
          #bot_retor+=" 1 AÑO COPIA 👉 <code>${chatuser} | 364</code> \n"
		  bot_retor+=" COPIA EL ID 👉 ♨️ <code>${chatuser}</code> ♨️\n"
          bot_retor+="$LINE\n"
          bot_retor+=" ANTES DE LA AUTORIZACION VERIFICAR PAGO\n"
          bot_retor+="$LINE\n"
		  msj_add "$(cat < ${CIDdir}/Admin-ID)"
    	bot_retorno="$LINE\n"
        bot_retorno+="🆔 ●⸺ 【 <code>${chatuser}</code> 】\n"
        bot_retorno+="\n"
        [[ -z ${nUSER} ]] && bot_retorno+=" ❌ Añada un Alias Para no Banearte ❌ \n" || bot_retorno+=" 𝗦𝗼𝗹𝗰𝗶𝘁𝘂𝗱 𝗲𝗻𝘃𝗶𝗮𝗱𝗮 𝗮𝗹 𝗔𝗗𝗠 $(cat < /etc/ADM-db/resell)\n📌 Aprobación en proceso ⌛\n"
        [[ -z ${nUSER} ]] && bot_retorno+="   Imposible verificar su ID \n  Su ${n_soli} Solicitud es Invalida \n" || bot_retorno+=" Esta es su  ${n_soli} Solicitud \n"
        bot_retorno+="\n"
        [[ -z ${nUSER} ]] && bot_retorno+=" SU ID FUE ENVIADO CON ADVERTENCIA (POSIBLE BANEO DE ID) ⚠️\n" || bot_retorno+="      ✅ ID ENVIADO EXITOSAMENTE ✅\n"
        bot_retorno+="$LINE\n"
		bot_retorno+=" ENVIE SU COMPROBANTE DE PAGO\n"
		bot_retorno+="🔘 Evita hacer spam en el BOT\n"
                bot_retorno+="🔘 De lo contrario se anulará tu solicitud \n"
                bot_retorno+="$LINE\n"
                comand_boton "atras"
	
			} || {
				bot_retorno="$LINE\n"
				bot_retorno+="🆔 ●⸺ 【 <code>${chatuser}</code> 】 \n"
				#bot_retorno+="$LINE\n"
				[[ -z ${nUSER} ]] && bot_retorno+=" ⚠️ USUARIO SIN ALIAS ⚠️\n" || bot_retorno+=" <u>🆔 ●⸺ Hola </u>: @${nUSER} \n"
				[[ -z ${nUSER} ]] && bot_retorno+=" ⚠️ AÑADA UN ALIAS PARA PODER SOLICITAR DE MANERA EXITOSA ⚠️\n" || bot_retorno+="𝗜𝗻𝘁𝗲𝗻𝘁𝗼𝘀 𝗱𝗲 𝗦𝗼𝗹𝗶𝗰𝗶𝘁𝘂𝗱  ${n_soli} $(cat < /etc/ADM-db/resell)\n"
				[[ -z ${nUSER} ]] && bot_retorno+="   IMPOSIBLE VERIFICAR ID SIN ALIAS\n  SU ${n_soli} SOLITUD ES INVALIDA \n" || bot_retorno+="Su 🆔 No fue recibido por el ADM \n"
				bot_retorno+="     🔴 𝗧𝗨 𝗜𝗗 𝗙𝗨𝗘 𝗕𝗟𝗢𝗤𝗨𝗘𝗔𝗗𝗔 🔴 \n"
				bot_retorno+="$LINE\n"
				echo "${chatuser}" >> /root/RegBOT/banID
		#bot_retorno+="        ⚜ Power botgen ⚜\n"
		bot_retorno+="$LINE\n"
		msj_fun
	}
}

deleteID_reply2 () {
#
			  rm -rf ${USRdatabase2}/Mensaje_${message_text[$id]}.txt &>/dev/null
  	    	rm -rf ${keytxt}/key_${message_text[$id]}.txt &>/dev/null
			sed -i "/${message_text[$id]}/d" ${CID}
local bot_retorno="$LINE\n"
          bot_retorno+="🔴 ●⸺ 𝗜𝗗 𝗘𝗟𝗜𝗠𝗜𝗡𝗔𝗗𝗢 𝗖𝗢𝗡 𝗘𝗫𝗜𝗧𝗢\n"
          bot_retorno+="🆔 ●⸺ : ${message_text[$id]}\n"
          bot_retorno+="$LINE\n"

comand_boton "atras2"
#msj_fun
#
}

rmid(){
	[[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}
		 ShellBot.sendMessage --chat_id $var \
            --text "𝙄𝙉𝙂𝙍𝙀𝙎𝙀 𝙀𝙇 𝙄𝘿 𝘿𝙀𝙇 𝙐𝙎𝙐𝘼𝙍𝙄𝙊" \
            --reply_markup "$(ShellBot.ForceReply)"
                    
}

newid(){
	[[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}
	     ShellBot.sendMessage --chat_id $var \
            --text "𝙄𝙉𝙂𝙍𝙀𝙎𝙀 𝙀𝙇 𝙉𝙐𝙀𝙑𝙊 𝙄𝘿" \
            --reply_markup "$(ShellBot.ForceReply)"
                    
}

mensaje(){
      [[ $(cat ${SCPT_DIR}|grep "${message_text[$id]}") = "" ]]
echo "${message_text[$id]}" > ${USRdatabase2}/Mensaje_$chatuser.txt
         local bot_retorno="$LINE\n"
          bot_retorno+="🟢 ●⸺ 𝗥𝗘𝗦𝗘𝗟𝗟𝗘𝗥 𝗔𝗚𝗥𝗘𝗚𝗔𝗗𝗢 \n"
          bot_retorno+="$LINE\n"
          bot_retorno+="▫️ Nuevo Reseller: ${message_text[$id]}\nVolver: /menu\n"
          bot_retorno+="$LINE"
         
          [[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}
	     ShellBot.sendMessage --chat_id $var \
							--text "<i>$(echo -e "$bot_retorno")</i>" \
							--parse_mode html
							#  --reply_markup ${message_reply_to_message_text[$id]
	return 0
          }
newres(){
	[[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}
ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
--text "✅ AGREGANDO RESELLER"
		 ShellBot.sendMessage --chat_id $var \
            --text "☟INGRESE SU RESELLER ABAJO☟" \
            --reply_markup "$(ShellBot.ForceReply)"
                    
}
newip(){
	[[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}
ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
--text "✅ AGREGANDO RESELLER"
		 ShellBot.sendMessage --chat_id $var \
            --text "☟INGRESE SU IP☟" \
            --reply_markup "$(ShellBot.ForceReply)"
                    
}

autodel_id() {
if [[ $(echo $permited|grep "${chatuser}") = "" ]]; then
    local bot="•────•──────────•────•\n"
    bot+="            Usted no tiene permiso para usar este comando\n"
    bot+="•────•──────────•────•\n"
    [[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}
	      ShellBot.sendMessage --chat_id $var \
							--text "$bot" \
							--parse_mode html
	return 0

else
    local bot=" =             𝘼𝙐𝙏𝙊-𝘿𝙀𝙇 𝙄𝘿'𝙎=\n"
    
    #bot+="Esta Opcion auto elimina los ID'S"
    local verificar
    PIDV=$(ps aux|grep -v grep|grep "veri")
    if [[ -z $PIDV ]]; then
      echo ""
      screen -dmS verificar /etc/CAT-BOT/veri &
      verificar="𝘼𝘾𝙏𝙄𝙑𝘼𝘿𝙊  --  𝘾𝙊𝙉 𝙀𝙓𝙄𝙏𝙊\n            𝙖𝙪𝙩𝙤-𝙞𝙣𝙞𝙘𝙞𝙤 𝙘𝙖𝙙𝙖 1𝙝"
    else
        kill -9 $(ps aux |grep -v grep |grep -w "veri"|grep dmS|awk '{print $2}') &>/dev/null
        kill -9 $(ps aux |grep -v grep |grep -w "verificar"|grep dmS|awk '{print $2}') &>/dev/null
     verificar="𝘿𝙀𝙎𝘼𝘾𝙏𝙄𝙑𝘼𝘿𝙊  --  𝘾𝙊𝙉 𝙀𝙓𝙄𝙏𝙊"
    fi
    bot+="•────•──────────•────•\n"
    bot+="            $verificar\n"
    bot+="•────•──────────•────•\n"
    [[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}
	      ShellBot.sendMessage --chat_id $var \
							--text "$bot" \
							--parse_mode html
	return 0
    fi
  }

rm_resell(){
rm ${USRdatabase2}/Mensaje_$chatuser.txt
[[ -z ${USRdatabase2}/Mensaje_$chatuser.txt ]] && rs="$(cat ${USRdatabase2}/Mensaje_$chatuser.txt)" || rs="Sin-Reseller"
ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
--text "❌ ELIMINANDO RESELLER"
bot_retorno="$LINE\n"
bot_retorno+="🔴 ●⸺  𝗥𝗘𝗦𝗘𝗟𝗟𝗘𝗥 𝗘𝗟𝗜𝗠𝗜𝗡𝗔𝗗𝗢\n"
bot_retorno+="▫️ Verificador de reseller: ${rs}\nVolver Pulsa /menu\n"
bot_retorno+="$LINE\n"
[[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}
	      ShellBot.sendMessage --chat_id $var \
							--text "<i>$(echo -e "$bot_retorno")</i>" \
							--parse_mode html
	return 0
}

                    
botao_conf=''
botao_user=''
botao_atras=''
botao_atras2=''
botao_keymen=''
botao_keymens=''
botao_keylat=''
botao_dex=''
botao_user1=''
ShellBot.InlineKeyboardButton --button 'botao_user1' --line 1 --text "ID" --callback_data '/id edit'
ShellBot.InlineKeyboardButton --button 'botao_user1' --line 1 --text 'ACCESO' --callback_data '/acceso edit'
ShellBot.InlineKeyboardButton --button 'botao_user1' --line 2 --text "PRECIOS" --callback_data '/ayuda edit'
ShellBot.InlineKeyboardButton --button 'botao_user1' --line 2 --text "MENU" --callback_data '/menu'
ShellBot.InlineKeyboardButton --button 'botao_user1' --line 2 --text "ADM" --callback_data '1' --url 'https://t.me/dexmod1'
ShellBot.InlineKeyboardButton --button 'botao_user1' --line 3 --text "Generar key Free" --callback_data '/keylat edit'

ShellBot.InlineKeyboardButton --button 'botao_conf' --line 1 --text '✅ ADD' --callback_data '/add'
ShellBot.InlineKeyboardButton --button 'botao_conf' --line 1 --text '❌ DELL' --callback_data '/del'
ShellBot.InlineKeyboardButton --button 'botao_conf' --line 1 --text '👥 LIST' --callback_data '/list edit'
ShellBot.InlineKeyboardButton --button 'botao_conf' --line 5 --text '🆔 ID' --callback_data '/id'

ShellBot.InlineKeyboardButton --button 'botao_conf' --line 2 --text '❌ POWER ✅' --callback_data '/power'
ShellBot.InlineKeyboardButton --button 'botao_conf' --line 2 --text '🛠️ MENU' --callback_data '/menu'

ShellBot.InlineKeyboardButton --button 'botao_conf' --line 3 --text '🔑 KEYLATM' --callback_data '/keylatam edit'
ShellBot.InlineKeyboardButton --button 'botao_conf' --line 3 --text '🔑 KEYGEN' --callback_data '/keygen edit'
ShellBot.InlineKeyboardButton --button 'botao_conf' --line 4 --text '🔰AGREGAR RESELLER🔰' --callback_data '/reseller'
ShellBot.InlineKeyboardButton --button 'botao_conf' --line 4 --text '🗑QUITAR RESELLER🗑' --callback_data '/delresell'
ShellBot.InlineKeyboardButton --button 'botao_conf' --line 5 --text '🔍BUSCAR ID' --callback_data '/buscar'
ShellBot.InlineKeyboardButton --button 'botao_conf' --line 6 --text '📵AUTO-DEL' --callback_data '/autodel'
ShellBot.InlineKeyboardButton --button 'botao_conf' --line 6 --text '🆔BLOQDS' --callback_data '/idgen edit'
ShellBot.InlineKeyboardButton --button 'botao_conf' --line 6 --text '🆔UNLOCK' --callback_data '/delid'
ShellBot.InlineKeyboardButton --button 'botao_conf' --line 7 --text '🌐IPS REG' --callback_data '/catip edit'
ShellBot.InlineKeyboardButton --button 'botao_conf' --line 7 --text '🔑KEYID' --callback_data '/liskey edit'
ShellBot.InlineKeyboardButton --button 'botao_conf' --line 7 --text '⛔️BANID' --callback_data '/addban edit'

ShellBot.InlineKeyboardButton --button 'botao_user' --line 1 --text '🔑 KEYLATM' --callback_data '/keylatam edit'
ShellBot.InlineKeyboardButton --button 'botao_user' --line 1 --text '🔑 KEYGEN' --callback_data '/keygen edit'
ShellBot.InlineKeyboardButton --button 'botao_user' --line 1 --text 'ℹ️INFO USUARIO' --callback_data '/id edit'
ShellBot.InlineKeyboardButton --button 'botao_user' --line 2 --text '🔰AGREGAR RESELLER🔰' --callback_data '/reseller'
ShellBot.InlineKeyboardButton --button 'botao_user' --line 2 --text '🗑QUITAR RESELLER🗑' --callback_data '/delresell'
ShellBot.InlineKeyboardButton --button 'botao_user' --line 3 --text '📲ADMIN' --callback_data '1' --url 'https://t.me/dexmod1'
#ShellBot.InlineKeyboardButton --button 'botao_key' --line 1 --text 'KEYGEN' --callback_data '/keygep'
#ShellBot.InlineKeyboardButton --button 'botao_key' --line 1 --text 'MENU' --callback_data '/start'
ShellBot.InlineKeyboardButton --button 'botao_user' --line 3 --text '🤖NOTY-BOT' --callback_data '1' --url 'https://t.me/LaCasitaMx_Noty_Bot'
ShellBot.InlineKeyboardButton --button 'botao_user' --line 3 --text '📍GRUPO' --callback_data '1' --url 'https://t.me/genkeysfre'
ShellBot.InlineKeyboardButton --button 'botao_user' --line 4 --text '▶️MENU INICIO◀️' --callback_data '/menu'

ShellBot.InlineKeyboardButton --button 'botao_atras' --line 1 --text 'menu' --callback_data '/menu edit'
ShellBot.InlineKeyboardButton --button 'botao_atras2' --line 1 --text '◀️ VOLVER' --callback_data '/menu edit'
ShellBot.InlineKeyboardButton --button 'botao_keymen' --line 1 --text '🔑 New Key LATAM' --callback_data '/keylatam'
ShellBot.InlineKeyboardButton --button 'botao_keymen' --line 1 --text '↩️MENU' --callback_data '/menu edit'
ShellBot.InlineKeyboardButton --button 'botao_keymens' --line 1 --text '🔑 Key Casita' --callback_data '/keygen'
ShellBot.InlineKeyboardButton --button 'botao_keymens' --line 1 --text '↩️MENU' --callback_data '/menu edit'
ShellBot.InlineKeyboardButton --button 'botao_dex' --line 1 --text '🔘CONTACTA A DEXMOD' --callback_data '1' --url 'https://t.me/dexmod1'
ShellBot.InlineKeyboardButton --button 'botao_keylat' --line 1 --text '🔑LATAM Key' --callback_data '/keylat'
ShellBot.InlineKeyboardButton --button 'botao_keylat' --line 1 --text '↩️INICIO' --callback_data '/menu edit'






#
# Ejecutando escucha del bot
while true; do
    ShellBot.getUpdates --limit 100 --offset $(ShellBot.OffsetNext) --timeout 30
    for id in $(ShellBot.ListUpdates); do

	    chatuser="$(echo ${message_chat_id[$id]}|cut -d'-' -f2)"
	    [[ -z $chatuser ]] && chatuser="$(echo ${callback_query_from_id[$id]}|cut -d'-' -f2)"
	    echo $chatuser >&2
	    #echo "user id $chatuser"

	    if [[ ! -z ${message_text[$id]} ]]; then
	    	comando=(${message_text[$id]})
	    elif [[ ! -z ${callback_query_data[$id]} ]]; then
	    	comando=(${callback_query_data[$id]})
	    fi
	    comand

	    [[ ! -e "${CIDdir}/Admin-ID" ]] && echo "null" > ${CIDdir}/Admin-ID
	    permited=$(cat ${CIDdir}/Admin-ID)
	    
	    if [[ $(echo $permited|grep "${chatuser}") = "" ]]; then
             
		 if [[ $(cat ${CID}|grep "${chatuser}") = "" ]]; then
			 case ${comando[0]} in
				 /[Ii]d|/[Ii]D)myid_src &;;
				/[Aa]cceso|[Aa]cceso)autori &;;
				 /MI_ACCESO|/[Mm]enu|[Mm]enu|/[Ss]tart|[Ss]tart|[Cc]omensar|/[Cc]omensar)menu_src &;;
				 /[Aa]yuda|[Aa]yuda|[Hh]elp|/[Hh]elp)ayuda_id && return 0;;
                                 /[Kk]eylat|/[Gg]elat|[Gg]elat|[Kk]eylat)gerar_key &;;
                                 /[Kk]eylatam|/[Gg]elatam|[Gg]elatam|[Kk]eylatam)generar &;;
                                 /sendid)send_ID;;
                                 
				 /*|*)invalido_fun &;;
			 esac
		 else
		if [[ ${message_reply_to_message_message_id[$id]} ]]; then
				case ${message_reply_to_message_text[$id]} in
					'☟INGRESE SU RESELLER ABAJO☟')mensaje;;
					#*)invalido_fun;;
				esac
		 	elif [[ ${message_text[$id]} || ${callback_query_data[$id]} ]]; then
                        
			 case ${comando[0]} in
				 /MI_ACCESO|/[Mm]enu|[Mm]enu|/[Ss]tart|[Ss]tart|[Cc]omensar|/[Cc]omensar)menu_src &;;
				/[Rr]eseller)newres;;
				    /[Dd]elresell)rm_resell &;;
				 /[Ii]d|/[Ii]D)myid_src &;;
				 /[Ii]nstalador)link_src &;;
        /[Ii]plist)show_connected_ip&;;
        
        /[Aa]ddip)newip &;;
				/[Ii]nfosys)infosys_src &;;
        /[Kk]eygen|/[Gg]erar|[Gg]erar|[Kk]eygen)gerar_keyc &;;
				/[Kk]eylat|/[Gg]elat|[Gg]elat|[Kk]eylat)gerar_key &;;
                                /[Kk]eylatam|/[Gg]elatam|[Gg]elatam|[Kk]eylatam)generar &;;
				# /[Cc]ambiar)creditos &;;
				 /*|*)invalido_fun &;;
			 esac
			fi
			
		 fi
	    else

	    	if [[ ${message_reply_to_message_message_id[$id]} ]]; then
				case ${message_reply_to_message_text[$id]} in
					'𝙄𝙉𝙂𝙍𝙀𝙎𝙀 𝙀𝙇 𝙄𝘿 𝘿𝙀𝙇 𝙐𝙎𝙐𝘼𝙍𝙄𝙊')deleteID_reply2;;
					'𝙄𝙉𝙂𝙍𝙀𝙎𝙀 𝙀𝙇 𝙉𝙐𝙀𝙑𝙊 𝙄𝘿')
		echo "${message_text[$id]}" >/tmp/id.$chatuser
			tmp=/tmp/id.$chatuser
                ID=$(sed -n '1 p' $tmp | cut -d' ' -f1)
                ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
            --text "FECHA DE EXPIRACION👇" \
            --reply_markup "$(ShellBot.ForceReply)"
            ;;
            'FECHA DE EXPIRACION👇')
            echo "${message_text[$id]}" >>/tmp/id.$chatuser
                    DIAS=$(sed -n '2 p' $tmp | cut -d' ' -f1)
      [[ $(cat ${CID}|grep "$ID") = "" ]] && {
      
      datexp=$(date "+%F" -d " + $DIAS days") && valid=$(date '+%C%y-%m-%d' -d " + $DIAS days")
		echo -e "$ID|$datexp" >> ${CID} #|| return 1

        local bot_retorno="$LINE\n"
          bot_retorno+="$LINE\n"
          bot_retorno+="✅ * ACCESO ACTIVADO * ✅\n"
          bot_retorno+="$LINE\n"
          bot_retorno+="🆔 ●⸺: $ID\n"
          bot_retorno+="Vigencia De Expiracion : $datexp\n"
         # 
          bot_retorno+="$LINE\n"
        
      
      msj_fun
      upfile_src
      #enviar notificacion al usuario

      ShellBot.sendMessage --chat_id $ID \
							--text "$(echo -e "$LINE\n𝗛𝗢𝗟𝗔 𝗕𝗜𝗘𝗡𝗩𝗘𝗡𝗜𝗗𝗢 \n\nEl ADM: $(cat /etc/botuser) Aprobo tu acceso\n\n𝗔𝗛𝗢𝗥𝗔 𝗧𝗜𝗘𝗡𝗘𝗦 𝗔𝗖𝗖𝗘𝗦𝗢 𝗩𝗜𝗣 𝗔𝗟 𝗕𝗢𝗧\n🆔 ●⸺: $ID \n🔘 Fin: $valid\n\nIngresa al Generador: /MI_ACCESO\n[ Acceso Activado ] 📌\n$LINE")" \
							--parse_mode html
							return 0
							tmp=/tmp/id.$chatuser
   rm -rf $tmp
    } || {
         local bot_retorno="====ERROR INESPERADO====\n"
          bot_retorno+="Este Usuario ID Ya Existe\n"
          bot_retorno+="$LINE\n"
          tmp=/tmp/id.$chatuser
          rm -rf $tmp
      msj_fun
    }
;;
					'☟INGRESE SU RESELLER ABAJO☟')mensaje;;
                                         '/buscar')searchID_reply;;
                                         '/delid')deleteIDS_reply;;
                                         '/addban')addIDS_reply;;
                                        '☟INGRESE SU IP☟')addIP_reply;;
					*)invalido_fun;;
				esac

			elif [[ ${message_document_file_id[$id]} ]]; then
					 download_file

	    	elif [[ ${message_text[$id]} || ${callback_query_data[$id]} ]]; then

		 		case ${comando[0]} in
					 /MI_ACCESO|/[Mm]enu|[Mm]enu|/[Ss]tart|[Ss]tart|[Cc]omensar|/[Cc]omensar)menu_src &;;
					 /[Aa]yuda|[Aa]yuda|[Hh]elp|/[Hh]elp)ayuda_src &;;
					 /[Ii]d|/[Ii]D)myid_src &;;
					 /[Aa]dd)newid;;
					/[Dd]el)rmid;;
					 /[Pp]ower)start_gen &;;
					/[Rr]eseller)newres;;
					/[Aa]utodel|[Aa]utodel)autodel_id;;
				    /[Dd]elresell)rm_resell &;;
					 /[Kk]eylatam|/[Gg]elatam|[Gg]elatam|[Kk]eylatam)generar &;;
                                         /[Kk]eylat|/[Gg]elat|[Gg]elat|[Kk]eylat)gerar_key &;;
                                         /[Kk]eygen|/[Gg]erar|[Gg]erar|[Kk]eygen)gerar_keyc &;;
					/[Bb]uscar|[Bb]uscar)reply &;;
					# /[Cc]ambiar)creditos &;;
			 		 /[Ii]nfosys)infosys_src &;;
                                         /[Ii]dgen|[Ii]dgen)listID_GEN &;;
                                         /[Cc]atip|[Cc]atip)list_IP &;;
                                         /[Dd]elid)reply &;;
                                        /[Aa]ddban)reply &;;
                                        /[Aa]ddip)newip &;;
                                        /[Ii]plist)show_connected_ip&;;
                                        /[Rr]eip)remove_connection &;;
			 		 /[Ll]ist)listID_src &;;
          /[Ll]iskey)listkey_src &;;
			 		 /[Ii]nstalador)link_src &;;
			 		 /[Cc]ache)cache_src &;;
			 		 /*|*)invalido_fun &;;
				esac

			fi

	    fi
    done
done
