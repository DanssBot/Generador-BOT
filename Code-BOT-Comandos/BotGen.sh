#!/bin/bash
# -*- ENCODING: UTF-8 -*-
#https://github.com/joao-lucas/ShellBot

CIDdir=/etc/ADM-db && [[ ! -d ${CIDdir} ]] && mkdir ${CIDdir}
CIDimg=/etc/tokenIMG && [[ ! -d ${CIDimg} ]] && mkdir ${CIDimg}
SRC="${CIDdir}/sources" && [[ ! -d ${SRC} ]] && mkdir ${SRC}
CID="${CIDdir}/User-ID" && [[ ! -e ${CID} ]] && echo > ${CID}
CIDRESS="${CIDdir}/RESSELLERS" && [[ ! -e ${CIDRESS} ]] &&  mkdir ${CIDRESS}
keytxt="${CIDdir}/keys" && [[ ! -d ${keytxt} ]] && mkdir ${keytxt}
timg="${CIDimg}/img" && [[ ! -d ${timg} ]] && mkdir ${timg}
[[ $(dpkg --get-selections|grep -w "jq"|head -1) ]] || apt-get install jq -y &>/dev/null
[[ ! -e "/bin/ShellBot.sh" ]] && wget -O /bin/ShellBot.sh https://raw.githubusercontent.com/DanssBot/Generador-BOT/main/Otros/ShellBot.sh &> /dev/null
[[ -e /etc/texto-bot ]] && rm /etc/texto-bot
LINE="   ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••"

# Importando API
source ShellBot.sh
source ${SRC}/menu
source ${SRC}/ayuda
source ${SRC}/cache
#source ${SRC}/invalido
source ${SRC}/status
source ${SRC}/reinicio
source ${SRC}/myip
#source ${SRC}/id
source ${SRC}/back_ID
source ${SRC}/link
source ${SRC}/listID
source ${SRC}/gerar_key
source ${SRC}/power
source ${SRC}/comandos
source ${SRC}/update
source ${SRC}/donar
source ${SRC}/costes
#source ${SRC}/kill_drop

# Token del bot
bot_token="$(cat ${CIDdir}/token)"

# Inicializando el bot
ShellBot.init --token "$bot_token" --monitor --flush --return map
ShellBot.username

reply () {
	[[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}

		 	 ShellBot.sendMessage	--chat_id  $var \
									--text "$comando" \
									--parse_mode html \
									--reply_markup "$(ShellBot.ForceReply)"
	[[ "${callback_query_data}" = /del || "${message_text}" = /del ]] && listID_src
	#[[ "${callback_query_data}" = /img || "${message_text}" = /img ]] && listID_src
	[[ "${callback_query_data}" = '/banIP' || "${message_text}" = '/banIP' ]] && list_IP
	
}




menu_print () {
[[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}

	if [[ $(echo $permited|grep "${chatuser}") = "" ]]; then
				 #ShellBot.sendMessage 	--chat_id ${message_chat_id[$id]} \
				ShellBot.sendMessage 	--chat_id $var \
										--text "<i>$(echo -e $bot_retorno)</i>" \
										--parse_mode html \
										--reply_markup "$(ShellBot.InlineKeyboardMarkup -b 'botao_user')"
	else
				 #ShellBot.sendMessage 	--chat_id ${message_chat_id[$id]} \
				ShellBot.sendMessage 	--chat_id $var \
										--text "<i>$(echo -e $bot_retorno)</i>" \
										--parse_mode html \
										--reply_markup "$(ShellBot.InlineKeyboardMarkup -b 'botao_conf')"
	fi
}

menu_printSN () {
[[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}

	if [[ $(echo $permited|grep "${chatuser}") = "" ]]; then
				ShellBot.sendMessage 	--chat_id $var \
				--text "<i>$(echo -e $bot_retorno)</i>" \
				--parse_mode html \
				--reply_markup "$(ShellBot.InlineKeyboardMarkup -b 'botao_send_id')"
	fi
}


download_file () {
# shellbot.sh editado linea 3986
user=User-ID
[[ -e ${CID} ]] && rm ${CID}
local file_id
          ShellBot.getFile --file_id ${message_document_file_id[$id]}
          ShellBot.downloadFile --file_path "${return[file_path]}" --dir "${CIDdir}"
		  [[ -e ${return[file_path]} ]] && mv ${return[file_path]} ${CID}
local bot_retorno="ID user botgen\n"
		bot_retorno+="$LINE\n"
		bot_retorno+="Se restauro con exito!!\n"
		bot_retorno+="$LINE\n"
		bot_retorno+=" FILE ${return[file_path]} \n"
		bot_retorno+="$LINE"
			ShellBot.sendMessage	--chat_id "${message_chat_id[$id]}" \
									--reply_to_message_id "${message_message_id[$id]}" \
									--text "<i>$(echo -e $bot_retorno)</i>" \
									--parse_mode html
return 0
}


msj_add () {
	      ShellBot.sendMessage --chat_id ${1} \
							--text "<i>$(echo -e $bot_retor)</i>" \
							--parse_mode html
}

upfile_fun () {
	[[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}
          ShellBot.sendDocument --chat_id $var  \
                             --document @${1} \
                             #--caption  "$(echo -e "$bot_retorno")" \
                             #--parse_mode html \
                             #--reply_markup "$(ShellBot.ForceReply)"
							 #--reply_markup "$(ShellBot.InlineKeyboardMarkup -b "$2")"							 
}

upimg_fun () {
          ShellBot.sendDocument --chat_id $(cat ${CIDdir}/Admin-ID)  \
                             --document @${1} \
                             #--caption  "$(echo -e "$bot_retorno")" \
                             #--parse_mode html \
                             #--reply_markup "$(ShellBot.ForceReply)"
							 #--reply_markup "$(ShellBot.InlineKeyboardMarkup -b "$2")"							 
}

#invalido_fun () {
#MSG_id=$((${message_message_id} + 1 ))
	#[[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}
	#local bot_retorno="  🎊 𝙱𝚒𝚎𝚗𝚟𝚎𝚗𝚒𝚍𝚘  𝚊𝚕  𝙱𝚘𝚝𝙶𝚎𝚗  𝙰𝙳𝙼  🎊\n"
		#bot_retorno+="$LINE\n"
        #bot_retorno+=" COMANDO NO PERMITIDO !!\n Quizas debes usar este /keygen \n O Posiblemente no estas Autorizado, clic aqui /prices o \n Contacta a $(cat < /etc/ADM-db/resell) y adquiere una subscripcion \n Toca aqui para ayuda /ayuda \n"
        #bot_retorno+="$LINE\n"
	    #ShellBot.sendMessage --chat_id $var \
							#--text "<i>$(echo -e $bot_retorno)</i>" \
							#--parse_mode html
		#sleep 5s
		#msj_del ${message_message_id}
		#msj_del ${MSG_id}
							#return 0	
#}


send_admin(){

	local bot_retorno2="$LINE\n"
	bot_retorno2+="🔰 Solicitud de autorizacion 🔰\n"
	bot_retorno2+="$LINE\n"
	bot_retorno2+="<u>Nombre</u>: ${callback_query_from_first_name}\n"
	[[ ! -z ${callback_query_from_username} ]] && bot_retorno2+="<u>Alias</u>: @${callback_query_from_username}\n"
	bot_retorno2+="<u>ID</u>: <code>${callback_query_from_id}</code>\n"
	bot_retorno2+="$LINE"

	bot_retorno="$LINE\n"
	bot_retorno+="     🔰 Bot generador de key 🔰\n"
	bot_retorno+="           ⚜ by @Dan ⚜\n"
	bot_retorno+="$LINE\n"
	bot_retorno+="      ✅ ID enviado al admin ✅\n"
	bot_retorno+="$LINE"
	comand_boton "atras"

	saveID "${callback_query_from_id}"
	var=$(cat < ${CIDdir}/Admin-ID)
	ShellBot.sendMessage 	--chat_id $var \
							--text "$(echo -e "$bot_retorno2")" \
							--parse_mode html \
							--reply_markup "$(ShellBot.InlineKeyboardMarkup -b 'botao_save_id')"

	return 0
}


msj_fun () {
	[[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}
		      ShellBot.sendMessage --chat_id $var \
							--text "<i>$(echo -e "$bot_retorno")</i>" \
							--parse_mode html
	return 0
}


send_ID () {
MSG_id=$((${message_message_id} + 1 ))
[[ -z ${callback_query_from_first_name} ]] && firsnme="${message_from_first_name}" || firsnme="${callback_query_from_first_name}"
[[ -z ${callback_query_from_last_name} ]] && lastnme="${message_from_last_name}" || lastnme="${callback_query_from_last_name}"
[[ -z ${callback_query_from_username} ]] && nUSER=${message_from_username} || nUSER=${callback_query_from_username}
[[ -e /root/RegBOT/U_check.txt ]] && n_soli=$(cat /root/RegBOT/U_check.txt | grep ${chatuser} | wc -l) || n_soli=1
[[ $n_soli < 2 ]] && {
echo "${chatuser}" >> /root/RegBOT/U_check.txt
          bot_retor="$LINE\n"
          bot_retor+=" Cliente 『 ${firsnme} ${lastnme} 』\n"
		  [[ -z ${nUSER} ]] && bot_retor+=" ⚠️ USUARIO SIN ALIAS ⚠️\n" || bot_retor+=" <u> ALIAS</u>: @${nUSER} CON $n_soli INTENTOS\n"
		  bot_retor+="$LINE\n"
		  bot_retor+=" FORMATO $MSG_id <tg-spoiler>${chatuser}</tg-spoiler> | <u>DIAS</u> \n"
          bot_retor+=" PARA ACEPTAR DA CLICK AQUI 👉 /add , LUEGO\n"
          bot_retor+=" PARA 4 DIAS COPY 👉 <code>${chatuser} | 4</code> \n"
          bot_retor+=" PARA 7 DIAS COPY 👉 <code>${chatuser} | 7</code> \n"
          bot_retor+=" PARA 15 DIAS COPY 👉 <code>${chatuser} | 15</code> \n"
          bot_retor+=" PARA 30 DIAS COPY 👉 <code>${chatuser} | 30</code> \n"
          bot_retor+=" PARA 60 DIAS COPY 👉 <code>${chatuser} | 60</code> \n"
          bot_retor+=" PARA 90 DIAS COPY 👉 <code>${chatuser} | 90</code> \n"
          bot_retor+=" PARA 180 DIAS COPY 👉 <code>${chatuser} | 179</code> \n"
          bot_retor+=" PARA 1 AÑO COPY 👉 <code>${chatuser} | 364</code> \n"
		  bot_retor+=" CUSTOM COPY 👉 ♨️ <code>${chatuser} | dias</code> ♨️\n"
          bot_retor+="$LINE\n"
          bot_retor+=" VERIFIQUE SU TOKEN DE PAGO ANTES DE LA AUTORIZACION\n"
          bot_retor+="$LINE\n"
		  msj_add "$(cat < ${CIDdir}/Admin-ID)"
    	bot_retorno="$LINE\n"
        bot_retorno+=" 🔰 𝚂𝚞 𝙸𝙳 【 <code>${chatuser}</code> 】 🔰\n"
        bot_retorno+="$LINE\n"
        [[ -z ${nUSER} ]] && bot_retorno+=" ⚠️ AÑADA UN ALIAS PARA PODER SOLICITAR ⚠️\n" || bot_retorno+="UD SOLICITO AUTORIZACION A $(cat < /etc/ADM-db/resell)\n"
        [[ -z ${nUSER} ]] && bot_retorno+="   IMPOSIBLE VERIFICAR ID SIN ALIAS\n  REMARCA SU ${n_soli} SOLITUD INVALIDA \n" || bot_retorno+=" ESTA ES SU ${n_soli} SOLICITUD MEDIANTE ID DE REGISTRO\n"
        bot_retorno+="$LINE\n"
        [[ -z ${nUSER} ]] && bot_retorno+=" ⚠ ID ENVIADO CON ADVERTENCIA (POSIBLE BANEO DE ID) ⚠️\n" || bot_retorno+="      ✅ ID ENVIADO EXITOSAMENTE ✅\n"
        bot_retorno+="$LINE\n"
		bot_retorno+=" ENVIE SU COMPROBANDO O CORREO DE PAGO PARA SU AUTORIZACION\n"
		bot_retorno+="$LINE\n"
		msj_fun
			} || {
				bot_retorno="$LINE\n"
				bot_retorno+=" 🔰 𝚂𝚞 𝙸𝙳 【 <code>${chatuser}</code> 】 🔰\n"
				bot_retorno+="$LINE\n"
				[[ -z ${nUSER} ]] && bot_retorno+=" ⚠️ USUARIO SIN ALIAS ⚠️\n" || bot_retorno+=" <u> ALIAS</u>: @${nUSER} CON ID : <code>${chatuser}</code>\n"
				[[ -z ${nUSER} ]] && bot_retorno+=" ⚠️ AÑADA UN ALIAS PARA PODER SOLICITAR ⚠️\n" || bot_retorno+=" UD ENVIO ${n_soli} SOLICITUDES A $(cat < /etc/ADM-db/resell)\n"
				[[ -z ${nUSER} ]] && bot_retorno+="   IMPOSIBLE VERIFICAR ID SIN ALIAS\n  REMARCA SU ${n_soli} SOLITUD INVALIDA \n" || bot_retorno+=" SU PETICION FUE RECHAZADA POR EXCESO DE PETICIONES\n"
				bot_retorno+="     🚫🚫️ SU ID FUE BANEADO 🚫🚫 \n"
				bot_retorno+="$LINE\n"
				echo "${chatuser}" >> /root/RegBOT/banID
		bot_retorno+="        ⚜ Power by @ChumoGH ⚜\n"
		bot_retorno+="$LINE\n"
		msj_fun
	}
}

myid_src () {
MSG_id=$((${message_message_id} + 1 ))
[[ -z ${callback_query_from_username} ]] && nUSER=${message_from_username} || nUSER=${callback_query_from_username}
[[ ! -z $(cat /etc/ADM-db/Admin-ID|grep "${chatuser}" ) ]] && { #ENTRA A VERIFICAR ADM
bot_retorno="  $LINE\n"
bot_retorno+=" HOLA @${nUSER} UD ES ADM \n"
bot_retorno+="$LINE\n"
bot_retorno+=" DIJITA MENU /menu   🔰\n"
bot_retorno+="\n"
bot_retorno+="$LINE\n"
bot_retorno+="        ⚜ Power by @ChumoGH ⚜\n"
bot_retorno+="$LINE\n"
#bot_retorno+="<b>bold</b>, <strong> bold</strong> \n
#<i>italic</i>, <em>italic</em>\n"
bot_retorno+=" <pre>BORRAREMOS ESTE PRE ${message_message_id} </pre>\n"
bot_retorno+=" <code>BORRAREMOS ESTE CODE ${MSG_id} </code>\n"
msj_fun
sleep 5s
msj_del ${message_message_id}
msj_del ${MSG_id}
} || { # SINO ES ADM - CAMBIA A USUARIOS AUTORIZADOS
	[[ $(cat ${CID}|grep "${chatuser}" ) = "" ]] && { # ENTRA A VERIFCAR USUARIOS QUE NO EXISTEN
		bot_retorno="$LINE\n"
		[[ -z ${nUSER} ]] && bot_retorno+=" ⚠️ USUARIO SIN ALIAS ⚠️\n" || bot_retorno+="𝙃𝙤𝙡𝙖 【 @${nUSER} 】, SU ID NO ESTA AUTORIZADO\n"
		bot_retorno+="  ADQUIERE UNA MENBRESIA O DIJITA /prices \n"
		bot_retorno+=" VISITA LA TIENDA 🛒🛍️ PINCHANDO 👉<a href='https://shoppy.gg/@ChumoGH/'>AQUI</a>👈\n"
        bot_retorno+="$LINE\n"
        bot_retorno+="𝚂𝚞 𝙸𝙳 【 <code>${chatuser}</code> 】\n"
        bot_retorno+="$LINE\n"
        bot_retorno+="👇PINCHA 👇 EN EL BOTON PARA QUE $(cat < /etc/ADM-db/resell) TE AUTORICE!!\n"
        bot_retorno+="$LINE\n"
		menu_printSN
		sleep 5s
		msj_del ${message_message_id}
		msj_del ${MSG_id}
	} || { # ENTRA A  IDS YA REGISTRADOS
			bot_retorno="  $LINE\n"
			bot_retorno+=" HOLA @${nUSER} SU ID ESTA REGISTRADO \n"
			bot_retorno+="$LINE\n"
			bot_retorno+="    🆔 : <code>${chatuser}</code> 🔰\n"
			bot_retorno+=" FECHA DE CORTE : ⏳ $(cat /etc/ADM-db/User-ID | grep ${chatuser}| awk '{print $3}') | $(date +%R)\n"
			bot_retorno+="\n"
			bot_retorno+="$LINE\n"
			bot_retorno+="        ⚜ Power by @ChumoGH ⚜\n"
			bot_retorno+="$LINE\n"
			msj_fun
		}
						} # FIN VERIFICAR ADM
}

killIP_reply () {

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

deleteID_reply () {
ids=$(echo ${message_text[$id]} | awk '{print $1}' | sed -e 's/[^a-z0-9 -]//ig')
idc=$(echo ${message_text[$id]} | awk '{print $3}' | sed -e 's/[^a-z0-9 -]//ig')
sed -i "${message_text[$id]}/d" ${CID}
bot_retorno="$LINE\n"
          bot_retorno+=" ID ELIMINADO EXITOSAMENTE!\n"
          bot_retorno+=" ID Eliminado: ${ids}\n"
          bot_retorno+="$LINE\n"
			
          bot_retor="  🎊 𝙱𝚒𝚎𝚗𝚟𝚎𝚗𝚒𝚍𝚘  Nuevamente 𝚊𝚕  𝙱𝚘𝚝𝙶𝚎𝚗  𝙲𝚑𝚞𝚖𝚘𝙶𝙷-𝙰𝙳𝙼  🎊\n"
          #bot_retor+="𝙃𝙤𝙡𝙖 『 $message_from_first_name $message_from_last_name 』\n"
          bot_retor+="Desafortunadamente tu Membresia ha Finalizado\n"
          #bot_retor+=" ⌚⌚ Hora Actual del Bot : ⌚⌚\n"
          bot_retor+="Fecha de Corte : $(date '+%C%y-%m-%d') - $(date +%R)  \n"
          bot_retor+="Si tienes Dudas, Contacta con $(cat < /etc/ADM-db/resell)\n"
          bot_retor+="$LINE\n"
          bot_retor+="Recuerda adquirir creditos, o Realizar una Colaboracion\n $(cat < /etc/mpayu) \n"
          bot_retor+="Para mantener tu acceso al BotGen Recuerda Mostrar tu Token de Donacion o Compra\n"
          bot_retor+="$LINE\n"
      msj_fun
      msj_add ${ids}
      upfile_src
}

img_reply () {
local file_id
          ShellBot.getFile --file_id ${message_document_file_id[$id]}
          ShellBot.downloadFile --file_path "${return[file_path]}" --dir "/root/"
		  [[ -e ${return[file_path]} ]] && mv ${return[file_path]} "/root/"
local bot_retorno="ID user botgen\n"
		bot_retorno+="$LINE\n"
		bot_retorno+=" FILE ${return[file_path]} \n"
		bot_retorno+="$LINE"
ID_img=${message_photo_file_unique_id}
          bot_retorno+=" CALCULANDO ID DE MENSAJES \n"
          bot_retorno+=" ID FILE PHOTO : ${message_photo_file_id}\n"
		  bot_retorno+="$LINE\n"
          bot_retorno+=" ID UNICO FILE PHOTO : ${message_photo_file_unique_id}\n"
          bot_retorno+=" CAPTION : ${message_caption}\n"
          bot_retorno+="$LINE\n"
      msj_fun
      #upfile_src
	  msj_img "${ID_img}"
}

searchID_reply () {
searchID=$(cat -n /etc/ADM-db/User-ID | grep "${message_text[$id]}")
bot_retorno="$LINE\n"
        bot_retorno+=" MOSTRANDO RESULTADOS DE BUSQUEDA!\n"
		bot_retorno+=" $LINE\n"
		[[ ! -z ${searchID} ]] && bot_retorno+=" N°${searchID} \n" || bot_retorno+=" ID NO ENCONTRADO \n"
      msj_fun
}

addID_reply () {
      ids=$(echo ${message_text[$id]} | awk '{print $1}' | sed -e 's/[^a-z0-9 -]//ig')
        idc=$(echo ${message_text[$id]} | awk '{print $3}' | sed -e 's/[^a-z0-9 -]//ig')
        valid=$(date '+%C%y-%m-%d' -d " +$idc days")
	  [[ $(cat ${CID}|grep "$ids" ) = "" ]] && {
		[[ -e /root/RegBOT/banID ]] && sed -i "/${ids}/d" /root/RegBOT/banID
        echo "/${ids} | $valid" >> ${CID}
        echo "/${ids} | $(date '+%C%y-%m-%d') | $(date +%R)" >> ${CID}.reg
          bot_retorno="  ✉️ REGISTRO ACEPTADO  ✉️ \n"
          bot_retorno+=" 🆔 : ${ids} | ACEPTADO 🧾\n"
          bot_retorno+="$LINE\n"
          bot_retorno+=" FECHA DE REGISTRO : $(date '+%C%y-%m-%d')|$(date +%R) \n VALIDO HASTA : ${valid}|$(date +%R)\n"
          bot_retorno+="$LINE\n"
          bot_retorno+="  ✅ ID REGISTRADO EXITOSAMENTE ✅\n"
          bot_retorno+="$LINE\n"
          bot_retorno+="        ⚜ Power by @ChumoGH ⚜\n"
unset i
for i in $(cat /etc/ADM-db/User-ID | awk '{print $3}'); do 
[[ "$(date -d $(date '+%C%y-%m-%d') +%s)" -ge "$(date -d $i +%s)" ]] && {
for id in $(cat /etc/ADM-db/User-ID | grep "$i" | awk '{print $1}' | sed -e 's/[^a-z0-9 -]//ig'); do
sed -i "/${id}/d" /etc/ADM-db/User-ID
          bot_retor="  🎊 𝙱𝚒𝚎𝚗𝚟𝚎𝚗𝚒𝚍𝚘  Nuevamente 𝚊𝚕  𝙱𝚘𝚝𝙶𝚎𝚗  𝙲𝚑𝚞𝚖𝚘𝙶𝙷-𝙰𝙳𝙼  🎊\n"
          bot_retor+=" SU MEMBRESIA HA FINALIZADO POR CHECK ID\n"
          bot_retor+=" FIN DE CONTRADO : $(date '+%C%y-%m-%d') - $(date +%R) \n"
          bot_retor+=" SI DESEAS APELAR TU CONTRADO, CONTACTA CON $(cat < /etc/ADM-db/resell)\n"
          bot_retor+=" $LINE\n"
          bot_retor+=" ADQUIERE TU MEMBRESIA DESDE @$(ShellBot.username) , DIGITANDO /prices \n"
          bot_retor+=" RECUERDA MANTENER TU CAPTURA DE PAGO, PARA ALGUN RECLAMO!\n"
          bot_retor+=" $LINE\n"
msj_add ${id}
done
}
done
[[ -z ${callback_query_from_username} ]] && nUSER=${message_from_username} || nUSER=${callback_query_from_username}
[[ -z ${callback_query_from_first_name} ]] && firsnme="${message_from_first_name}" || firsnme="${callback_query_from_first_name}"
[[ -z ${callback_query_from_last_name} ]] && lastnme="${message_from_last_name}" || lastnme="${callback_query_from_last_name}"
		  bot_retor=" ✉️ ESTIMADO @${nUSER} SU REGISTRO FUE APROBADO  ✉️ \n"
		  bot_retor+=" $LINE\n"
          bot_retor+=" EL ADM $(cat < /etc/ADM-db/resell) APROBO TU SOLICITUD\n"
          bot_retor+="  ☺️GRACIAS POR CONFIAR EN NOSOTROS ☺️\n"
          bot_retor+=" FECHA DE REGISTRO : $(date '+%C%y-%m-%d')|$(date +%R) \n VALIDO HASTA : ${valid}|$(date +%R)\n"
		  bot_retor+=" 🆔 : ${ids} | 🔐 ACEPTADO 🧾\n"
		  bot_retor+="𝙃SU RESELLER : ${firsnme} ${lastnm} \n"
          bot_retor+=" $LINE\n"
          bot_retor+=" GENERAR Key's usar el comando /keygen\n"
          bot_retor+=" Para MENU Digita el comando /menu\n"
          bot_retor+=" $LINE\n"
          bot_retor+=" CONTACTA ESCRIBE AL ADM $(cat < /etc/ADM-db/resell)\n SI NO OBTIENES RESPUESTA O SOLUCION CONTACTA A @ChumoGH "
          bot_retor+=" ADQUIERE TU MEMBRESIA DESDE @$(ShellBot.username) , DIGITANDO /prices \n"
          bot_retor+=" RECUERDA MANTENER TU CAPTURA DE PAGO, PARA ALGUN RECLAMO!\n"
          bot_retor+=" $LINE\n"
      msj_fun
      msj_add ${ids}
      upfile_src
    } || {
          bot_retorno=" ✉️ ====NOTIFICACION==== ✉️ \n"
          bot_retorno+="$LINE\n"
          bot_retorno+="Este ID ya esta Registrado\n"
          bot_retorno+="  ❌ ID NO REGISTRADO ❌\n"
          bot_retorno+="$LINE\n"
          bot_retorno+="        ⚜ Power by @ChumoGH ⚜\n"
          bot_retorno+="$LINE\n"
      msj_fun
    }
}

addID_reventa () {
bot_retorno=" -----🫥 FUNCION EN ESTADO BETA 🫥 ------\n"
bot_retorno+=" $LINE\n"
bot_retorno+=" ID ${ids} VALIDO HASTA $(cat /etc/ADM-db/User-ID | grep ${ids} | awk '{print $3}')\n"
bot_retorno+=" ❌ NO REGISTRAR DUPLICADOS ❌\n"
bot_retorno+=" SE PRESENTAN REGLAS DE ESTE FORMATO \n"
bot_retorno+=" 1 ID - Podra autorizar maximo 10 IDs  \n"
bot_retorno+="  Por maximo de 6 meses de tiempo! \n"
bot_retorno+="$LINE\n"
bot_retorno+="  EL ADMIN PRINCIPAL, PODRA CONTROLAR  \n"
bot_retorno+="         ESTAS AUTORIZACIONES  \n"
bot_retorno+="$LINE\n"
bot_retorno+="        ⚜ Power by @ChumoGH ⚜\n"
bot_retorno+="$LINE\n"
msj_fun
}


addID_REV () {
      ids=$(echo ${message_text[$id]} | awk '{print $1}' | sed -e 's/[^a-z0-9 -]//ig')
      idc=$(echo ${message_text[$id]} | awk '{print $3}' | sed -e 's/[^a-z0-9 -]//ig')
      valid=$(date '+%C%y-%m-%d' -d " +$idc days")
	  [[ $(cat ${${CIDRESS}}|grep "$ids" ) = "" ]] && {
        echo "/${ids} | $valid" >> ${CID}
          bot_retorno="  🎊 𝙱𝚒𝚎𝚗𝚟𝚎𝚗𝚒𝚍𝚘  @${callback_query_from_username}  𝚊𝚕  𝙱𝚘𝚝𝙶𝚎𝚗  𝙲𝚑𝚞𝚖𝚘𝙶𝙷-𝙰𝙳𝙼  🎊\n"
          bot_retorno+="$LINE\n"
          bot_retorno+=" New ID: ${ids}\n"
		  bot_retorno+=" FECHA DE REGISTRO : $(date '+%C%y-%m-%d')|$(date +%R) \n VALIDO HASTA : ${valid}|$(date +%R)\n"
          bot_retorno+="$LINE"
          bot_retorno+="  ✅ ID REGISTRADO ✅\n"
          bot_retorno+="$LINE\n"
          bot_retorno+="        ⚜ Power by @ChumoGH ⚜\n"
unset i
for i in $(cat /etc/ADM-db/User-ID | awk '{print $3}'); do 
[[ $(date -d $i +%s) -ge $(date -d $(date '+%C%y-%m-%d') +%s) ]] || {
idlog=$(cat /etc/ADM-db/User-ID | grep "$i" | awk '{print $1}' | sed -e 's/[^a-z0-9 -]//ig')
sed -i "/${idlog}/d" /etc/ADM-db/User-ID
          bot_retor="  🎊 𝙱𝚒𝚎𝚗𝚟𝚎𝚗𝚒𝚍𝚘  Nuevamente 𝚊𝚕  𝙱𝚘𝚝𝙶𝚎𝚗  𝙲𝚑𝚞𝚖𝚘𝙶𝙷-𝙰𝙳𝙼  🎊\n"
          bot_retor+="Desafortunadamente tu Membresia ha Finalizado\n"
          bot_retor+="Fecha de Corte : $i \n"
          bot_retor+="Si tienes Dudas, Contacta con $(cat < /etc/ADM-db/resell)\n"
          bot_retor+="$LINE\n"
          bot_retor+="Recuerda adquirir creditos, o Realizar una Colaboracion\n $(cat < /etc/mpayu) \n"
          bot_retor+="Para mantener tu acceso al BotGen Recuerda Mostrar tu Token de Donacion o Compra\n"
          bot_retor+="$LINE\n"
msj_add ${idlog}
}
done
          bot_retor="  ✉️  𝙱𝚒𝚎𝚗𝚟𝚎𝚗𝚒𝚍𝚘  Nuevamente 𝚊𝚕  𝙱𝚘𝚝𝙶𝚎𝚗  𝙲𝚑𝚞𝚖𝚘𝙶𝙷-𝙰𝙳𝙼  ✉️ \n"
          bot_retor+="𝙃𝙤𝙡𝙖 『 ${callback_query_from_first_name} ${callback_query_from_last_name} 』\n"
          bot_retor+=" EL ADM $(cat < /etc/ADM-db/resell) te autorizo\n"
          bot_retor+=" AUTORIZACION EXTENDIDA HASTA EL ${valid}\n"
          bot_retor+=" GENERAR Key's usar el comando /keygen\n"
          bot_retor+=" Para MENU Digita el comando /menu\n"
          bot_retor+=" $LINE\n"
          bot_retor+=" CONTACTA ESCRIBE AL ADM $(cat < /etc/ADM-db/resell)\n SI NO OBTIENES RESPUESTA O SOLUCION CONTACTA A @ChumoGH "
          bot_retor+=" ADQUIERE TU MEMBRESIA DESDE @$(ShellBot.username) , DIGITANDO /prices \n"
          bot_retor+=" RECUERDA MANTENER TU CAPTURA DE PAGO, PARA ALGUN RECLAMO!\n"
          bot_retor+="$LINE\n"
      msj_fun
      msj_add ${ids}
      upfile_src
    } || {
          bot_retorno=" -----🫥 ID YA REGISTRADO 🫥 ------\n"
          bot_retorno+=" $LINE\n"
          bot_retorno+=" ID ${ids} VALIDO HASTA $(cat /etc/ADM-db/User-ID | grep ${ids} | awk '{print $3}')\n"
          bot_retorno+=" ❌ NO REGISTRAR DUPLICADOS ❌\n"
          bot_retorno+="$LINE\n"
          bot_retorno+="        ⚜ Power by @ChumoGH ⚜\n"
          bot_retorno+="$LINE\n"
      msj_fun
    }
}





msj_del () {
	[[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}
		      ShellBot.deleteMessage --chat_id $var --message_id $1 			  
	return 0
}

msj_img () {
${timg}/id_${usrLOP}.png
local file_id
          ShellBot.getFile --file_id "$1"
          #ShellBot.downloadFile --file_path "${return[file_path]}" --dir "${timg}/id_${usrLOP}.png"
		  #[[ -e ${return[file_path]} ]] && mv ${return[file_path]} "${timg}/id_${usrLOP}.png1"

	#[[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}
		      #ShellBot.sendPhoto --chat_id $var --photo @${timg}/id_${usrLOP}.png
			  #ShellBot.deleteMessage --chat_id $var --message_id $1
			  upimg_fun
local bot_retorno="ID user botgen\n"
		bot_retorno+="$LINE\n"
		bot_retorno+="Se restauro con exito!!\n"
		bot_retorno+="$LINE\n"
		bot_retorno+=" FILE ${return[file_path]} \n"
		bot_retorno+="$LINE"
			ShellBot.sendMessage	--chat_id "${message_chat_id[$id]}" \
									--reply_to_message_id "${message_message_id[$id]}" \
									--text "<i>$(echo -e $bot_retorno)</i>" \
									--parse_mode html	
	
	return 0
}

msj_chat () {
	[[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}
		      ShellBot.sendChatAction --chat_id $var --action typing
			  #ShellBot.deleteMessage --chat_id $var --message_id $1 
	return 0
}

msj_donar () {
	[[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}
	      ShellBot.sendMessage --chat_id $var \
							--text "<i>$(echo -e "$bot_retorno")</i>" \
							--parse_mode html \
							--reply_markup "$(ShellBot.InlineKeyboardMarkup -b 'botao_donar')"
	return 0
}


saveID(){
	unset botao_save_id
	botao_save_id=''
	ShellBot.InlineKeyboardButton 	--button 'botao_save_id' --line 1 --text "Autorizar ID" --callback_data "/saveid $1"
}


botao_conf=''
botao_user=''
botao_donar=''
unset botao_send_id
botao_send_id=''
ShellBot.InlineKeyboardButton --button 'botao_send_id' --line 1 --text "ENVIAR al DAN" --callback_data '/sendid'
ShellBot.InlineKeyboardButton --button 'botao_send_id' --line 1 --text "menu" --callback_data '/menu'

ShellBot.InlineKeyboardButton --button 'botao_conf' --line 1 --text 'new ID' --callback_data '/add'
ShellBot.InlineKeyboardButton --button 'botao_conf' --line 1 --text 'QUITAR 🗑' --callback_data '/del'
ShellBot.InlineKeyboardButton --button 'botao_conf' --line 1 --text 'LISTAR 📋' --callback_data '/list'
ShellBot.InlineKeyboardButton --button 'botao_conf' --line 1 --text ' 🔎 ID' --callback_data '/buscar'

ShellBot.InlineKeyboardButton --button 'botao_conf' --line 2 --text ' ✅ | ❌ ' --callback_data '/power'
ShellBot.InlineKeyboardButton --button 'botao_conf' --line 2 --text 'MENU' --callback_data '/menu'

ShellBot.InlineKeyboardButton --button 'botao_conf' --line 3 --text '🔑 GEN KEY 🔑' --callback_data '/keygen'
ShellBot.InlineKeyboardButton --button 'botao_user' --line 1 --text '🔑 GEN KEY 🔑' --callback_data '/keygen'
ShellBot.InlineKeyboardButton --button 'botao_user' --line 2 --text ' 🧿 Ban|IP 📲' --callback_data '/banIP' # '1' --url "https://t.me/$(cat < /etc/ADM-db/resell)"
ShellBot.InlineKeyboardButton --button 'botao_user' --line 2 --text ' 🛒 CATALOGO 📝 ' --callback_data  '1' --url "$(cat < /etc/urlCT)"
ShellBot.InlineKeyboardButton --button 'botao_user' --line 3 --text '💰 DONAR 💰' --callback_data  '1' --url "$(cat < /etc/urlDN)"
ShellBot.InlineKeyboardButton --button 'botao_user' --line 3 --text ' 🪀 WTS 📲' --callback_data  '1' --url "https://wa.me/$(cat < /etc/numctc)"
ShellBot.InlineKeyboardButton --button 'botao_user' --line 3 --text ' MENU ' --callback_data '/menu'

#ShellBot.InlineKeyboardButton --button 'botao_user' --line 2 --text ' Contacto 📲' --callback_data  '1' --url 'https://wa.me/593987072611?text=Hola!,%20ℂ𝕙𝕦𝕞𝕠𝔾ℍ%20Me%20interesa%20Conocer%20más%20sobre%20el%20ADM.'
ShellBot.InlineKeyboardButton --button 'botao_donar' --line 2 --text 'Donar Paypal' --callback_data '1' --url "$(cat < /etc/urlDN)"
ShellBot.InlineKeyboardButton --button 'botao_donar' --line 2 --text 'ACCEDER WHATSAPP' --callback_data '1' --url "https://wa.me/$(cat < /etc/numctc)"

# Ejecutando escucha del bot
while true; do
    ShellBot.getUpdates --limit 100 --offset $(ShellBot.OffsetNext) --timeout 30
    for id in $(ShellBot.ListUpdates); do
	    chatuser="$(echo ${message_chat_id[$id]}|cut -d'-' -f2)"
	    [[ -z $chatuser ]] && chatuser="$(echo ${callback_query_from_id[$id]}|cut -d'-' -f2)"
	    echo $chatuser >&2
	    #echo "user id $chatuser"

	    comando=(${message_text[$id]})
	    [[ -z $comando ]] && comando=(${callback_query_data[$id]})
	    #echo "comando $comando"

	    [[ ! -e "${CIDdir}/Admin-ID" ]] && echo "null" > ${CIDdir}/Admin-ID
	    permited=$(cat ${CIDdir}/Admin-ID | awk '{print $1}')
	    comand
    done
done
