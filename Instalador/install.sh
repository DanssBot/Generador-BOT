
  1
  2
  3
  4
  5
  6
  7
  8
  9
 10
 11
 12
 13
 14
 15
 16
 17
 18
 19
 20
 21
 22
 23
 24
 25
 26
 27
 28
 29
 30
 31
 32
 33
 34
 35
 36
 37
 38
 39
 40
 41
 42
 43
 44
 45
 46
 47
 48
 49
 50
 51
 52
 53
 54
 55
 56
 57
 58
 59
 60
 61
 62
 63
 64
 65
 66
 67
 68
 69
 70
 71
 72
 73
 74
 75
 76
 77
 78
 79
 80
 81
 82
 83
 84
 85
 86
 87
 88
 89
 90
 91
 92
 93
 94
 95
 96
 97
 98
 99
100
101
102
103
104
105
106
107
108
109
110
111
112
113
114
115
116
117
118
119
120
121
122
123
124
125
126
127
128
129
130
131
132
133
134
135
136
137
138
139
140
141
142
143
144
145
146
147
148
149
150
151
152
153
154
155
156
157
158
159
160
161
162
163
164
165
166
167
168
169
170
171
172
173
174
175
176
177
178
179
180
181
182
183
184
185
186
187
188
189
190
191
192
193
194
195
196
197
198
199
200
201
202
203
204
205
206
207
208
209
210
211
212
213
214
215
216
217
218
219
220
221
222
223
224
225
226
227
228
229
230
231
232
233
234
235
236
237
238
239
240
241
242
243
244
245
246
247
248
249
250
251
252
253
254
255
256
257
258
#!/bin/bash
#Instalador del BOT
coo=1
IVAR="/etc/http-instas"
SCPT_DIR="/etc/SPlus"
_hora=$(printf '%(%D-%H:%M:%S)T')
rm -f gera*
source <(curl -sSL https://raw.githubusercontent.com/ChumoGH/ChumoGH-Script/master/msg-bar/msg) > /dev/null
add-apt-repository universe
apt update -y; apt upgrade -y

install_ini () {
clear
msg -bar
echo -e "\033[92m        -- INSTALANDO PAQUETES NECESARIOS -- "
msg -bar
ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
locale-gen en_US.UTF-8 > /dev/null 2>&1
update-locale LANG=en_US.UTF-8 > /dev/null 2>&1
echo -e "\033[97m  # Instalando  UTF...................... $ESTATUS "
apt-get install gawk -y > /dev/null 2>&1
#bc
[[ $(dpkg --get-selections|grep -w "jq"|head -1) ]] || apt-get install jq -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "jq"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "jq"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m  # apt-get install jq................... $ESTATUS "
#SCREEN
[[ $(dpkg --get-selections|grep -w "screen"|head -1) ]] || apt-get install screen -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "screen"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "screen"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m  # apt-get install screen............... $ESTATUS "
#apache2
[[ $(dpkg --get-selections|grep -w "apache2"|head -1) ]] || {
 apt-get install apache2 -y &>/dev/null
echo -e '# If you just change the port or add more ports here, you will likely also
# have to change the VirtualHost statement in
# /etc/apache2/sites-enabled/000-default.conf

Listen 85

<IfModule ssl_module>
        Listen 443
</IfModule>

<IfModule mod_gnutls.c>
        Listen 443
</IfModule>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet' > /etc/apache2/ports.conf
 service apache2 restart > /dev/null 2>&1 &
 }
[[ $(dpkg --get-selections|grep -w "apache2"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "apache2"|head -1) ]] && ESTATUS=`echo -e "\e[3;32mINSTALADO\e[0m"` &>/dev/null
echo -e "\033[97m  # apt-get install apache2.............. $ESTATUS " 
#curl
[[ $(dpkg --get-selections|grep -w "curl"|head -1) ]] || apt-get install curl -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "curl"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "curl"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m  # apt-get install curl................. $ESTATUS "
#socat
[[ $(dpkg --get-selections|grep -w "socat"|head -1) ]] || apt-get install socat -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "socat"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "socat"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m  # apt-get install socat................ $ESTATUS "
#netcat
[[ $(dpkg --get-selections|grep -w "netcat"|head -1) ]] || apt-get install netcat -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "netcat"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "netcat"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m  # apt-get install netcat............... $ESTATUS "
#netcat-traditional
[[ $(dpkg --get-selections|grep -w "netcat-traditional"|head -1) ]] || apt-get install netcat-traditional -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "netcat-traditional"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "netcat-traditional"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m  # apt-get install netcat-traditional... $ESTATUS "
#net-tools
[[ $(dpkg --get-selections|grep -w "net-tools"|head -1) ]] || apt-get net-tools -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "net-tools"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "net-tools"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m  # apt-get install net-tools............ $ESTATUS "
#cowsay
[[ $(dpkg --get-selections|grep -w "cowsay"|head -1) ]] || apt-get install cowsay -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "cowsay"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "cowsay"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m  # apt-get install cowsay............... $ESTATUS "
#figlet
[[ $(dpkg --get-selections|grep -w "figlet"|head -1) ]] || apt-get install figlet -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "figlet"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "figlet"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m  # apt-get install figlet............... $ESTATUS "
#lolcat
apt-get install lolcat -y &>/dev/null
sudo gem install lolcat &>/dev/null
[[ $(dpkg --get-selections|grep -w "lolcat"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "lolcat"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m  # apt-get install lolcat............... $ESTATUS "
#PV
[[ $(dpkg --get-selections|grep -w "pv"|head -1) ]] || apt-get install pv -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "pv"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "pv"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m  # apt-get install PV   ................ $ESTATUS "
msg -bar
echo -e "\033[92m La instalacion de paquetes necesarios a finalizado"
msg -bar
echo -e "\033[97m Si la instalacion de paquetes tiene fallas"
echo -ne "\033[97m Puede intentar de nuevo [s/n]: "
read inst
[[ $inst = @(s|S|y|Y) ]] && install_ini
}

check_ip () {
MIP=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
MIP2=$(wget -qO- ipv4.icanhazip.com)
[[ "$MIP" != "$MIP2" ]] && IP="$MIP2" || IP="$MIP"
}
function_verify () {
unset keybot
echo -e "\033[7;49;35m    ${TTini} GEN NETCOLVIP${TTcent}VPS ${TTfin}      \033[0m"
msg -bar
}

[[ ! -e /etc/http-instas ]] && echo '0' > /etc/http-instas || let sd=$(cat < /etc/http-instas)-$coo && echo $sd > /etc/http-instas
[[ -d $SCPT_DIR ]] && rm -rf $SCPT_DIR

#CORES
cor[1]="\033[1;36m"
cor[2]="\033[1;32m"
cor[3]="\033[1;31m"
cor[4]="\033[1;33m"
cor[0]="\033[1;37m"

#TEXTOS

#COMPARA
fun_filez () {
fup="$HOME/update"
echo "$1" >> $HOME/files.log
[[ $1 = 'http-server.py' ]] && mv -f ${fup}/$1 /bin/http-server.sh && chmod +x /bin/http-server.sh
[[ -e $1 ]] && mv -f ${fup}/$1 /etc/SPlus/$1
chmod 666 /etc/SPlus/$1
}

ofus () {
unset server
server=$(echo ${txt_ofuscatw}|cut -d':' -f1)
unset txtofus
number=$(expr length $1)
for((i=1; i<$number+1; i++)); do
txt[$i]=$(echo "$1" | cut -b $i)
case ${txt[$i]} in
".")txt[$i]="R";;
"R")txt[$i]=".";;
"9")txt[$i]="@";;
"@")txt[$i]="9";;
"5")txt[$i]="?";;
"?")txt[$i]="5";;
"0")txt[$i]="%";;
"%")txt[$i]="0";;
"4")txt[$i]="I";;
"I")txt[$i]="4";;
"/")txt[$i]="Y";;
"Y")txt[$i]="/";;
"-")txt[$i]="T";;
"T")txt[$i]="-";;
"L")txt[$i]="1";;
"1")txt[$i]="L";;
esac
txtofus+="${txt[$i]}"
done
echo "$txtofus" | rev
}


atualiza_fun () {
msg -bar
[[ -d $HOME/update ]] && rm -rf $HOME/update/* || mkdir $HOME/update
cd $HOME/update/
msg -bar
echo -e "\033[1;33mDescargando archivos... ESPERE "
msg -bar
wget -q --no-check-certificate -O $HOME/files.tar https://github.com/netfreeplus/SSHPLUS/raw/main/SSHPlus.tar
## RECUERDA -- CADA UPDATE DEBES RECOMPRIMIR ESTE TAR Y RESUBIRLO CON LA MISMA RUTA ( SI CAMBIAS DE URL, SOLO LO CAMBIAS AQUI )
[[ -d $HOME/update ]] && rm -rf $HOME/update/* || mkdir $HOME/update
[[ -e $HOME/files.tar ]] && tar xpf $HOME/files.tar -C $HOME/update && rm -f $HOME/files.tar
n=1
unset arqs
n=1
rm -f $HOME/files.log
for arqs in `ls $HOME/update`; do
echo -ne "\033[1;33m FILE \e[32m [${n}.gen] \e[0m "
fun_filez $arqs > /dev/null 2>&1 && echo -e "\033[1;31m- \033[1;31m $arqs (no Trasladado!)" || echo -e "\033[1;31m- \033[1;32m $arqs Trasladado!"
n=$(($n + 1))
done
echo -e "DESCARGANADO LA BASE DEL SERVIDOR FTP"
wget -q -O /bin/http-server.sh https://www.dropbox.com/scl/fi/541yo195lh3mp4pyt4feb/http-server.py?rlkey=tv06qulpo04vgr5yjuorlhcr0 
##FILE HTTP-SERVER ( FICHERO A REEMPLAZAR POR EL TUYO )
chmod 777 /bin/http-server.sh 
wget -q -O /bin/keygen https://www.dropbox.com/scl/fi/wzavic76je14ew51wx202/gerar.sh?rlkey=fkp16dkx49tth1emoxz9i54ga && chmod +x /bin/keygen
##FILE KEYGEN DE GENERADOR ( DEBES VOLVER A DESCARGARLO POR LOS CAMBIOS HACIA EL BOT )
cd $HOME
  [[ -e $HOME/lista ]] && rm $HOME/lista
  [[ -d $HOME/update ]] && rm -rf $HOME/update
cd $HOME && rm -rf $HOME/update && rm -f $HOME/files.tar  
}

unset Key
[[ $1 = '--gen' ]] && install_ini 
[[ $1 = '' ]] && clear && echo " DESTRUYENDO FICHERO rm -rf /bin " && exit 
clear
check_ip
function_verify 
msg -bar
echo -e "\033[7;49;35m    ${TTini} GEN NETCOLVIP${TTcent}VPS ${TTfin}      \033[0m"
msg -bar
echo -e " \nPara Finalizar, AGREGA NOMBRE DE SCRIPT \n"
msg -bar
read -p " DIGITA NOMBRE " nscript
[[ -z ${nscript} ]] && nscript='@NETCOLVIP'
echo -e "${nscript}" > /etc/NSCT
chmod 777 /etc/NSCT
echo -ne " \033[1;33mIP $(wget -qO- ifconfig.me) VERIFICADA POR @NETCOLVIP. . . " | pv -qL 20

meu_ip () {
[[ -e /usr/bin/vendor_code ]] && IP=$(cat < /usr/bin/vendor_code) || {
MIP=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
MIP2=$(wget -qO- ipv4.icanhazip.com)
[[ "$MIP" != "$MIP2" ]] && IP="$MIP2" || IP="$MIP"
echo "$IP" > /usr/bin/vendor_code
}
}

meu_ip

[[ -e /usr/bin/vendor_code ]] && {
[[ ! -d ${IVAR} ]] && touch ${IVAR}
[[ -d /etc/SPlus ]] && rm -rf /etc/SPlus/* || mkdir /etc/SPlus
[[ ! -d /var/www/html/NETCOLVIP ]] && mkdir /var/www/html/NETCOLVIP
cd 
atualiza_fun
IVAR2="/etc/key-gerador"
echo "$Key" > $IVAR2
wget --no-check-certificate -q -O /var/www/html/index.html https://raw.githubusercontent.com/ChumoGH/ChumoGH-Script/master/html/index.html
echo -e "\033[1;33m Perfecto, utilize el comando \033[1;31mkeygen o gerar \033[1;33mpara administrar sus keys y
 actualizar la base del servidor"
echo -e "\033[1;36m--------------------------------------------------------------------\033[0m"
echo -e " Recuerda Generar 1 Key manual, luego de terminar la Instalacion "
echo -e "\033[1;36m--------------------------------------------------------------------\033[0m"
echo -e "\033[1;33mKey ACCESIBLE MEDIANTE" $1
echo -e "\033[1;36m--------------------------------------------------------------------\033[0m"
curl -s --max-time 10 -d "chat_id=$ID&disable_web_page_preview=1&text=$(echo -e "$MENSAJE")" $urlBOT &>/dev/null  
} || {
echo -e "\033[1;36m--------------------------------------------------------------------\033[0m"
echo -e "\033[1;33mKey inválida!"
echo -e "\033[1;36m--------------------------------------------------------------------\033[0m"
curl -s --max-time 10 -d "chat_id=$ID&disable_web_page_preview=1&text=$(echo -e "$MENSAJE")" $urlBOT &>/dev/null  
}
echo "$(wget -qO- ifconfig.me)" > /etc/key-gerador
echo -ne "\033[0m" 
rm -f insta*
