#!/bin/bash
#@soygeekgirl


#paleta
rosaClaro="\e[95m" # Rosa claro
rosaOscuro="\e[35m" # Rosa oscuro
moradoClaro="\e[94m" # Morado claro
grisClaro="\e[90m"   # Gris claro
grisOscuro="\e[37m"   # Gris oscuro
rojoClaro="\e[91m"   # Rojo claro
rojoOscuro="\e[31m"   # Rojo oscuro



echo -e "${rosaClaro} /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\ ${endColour}";
sleep 0.05
echo -e "${rosaClaro}( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )${endColour}";
sleep 0.05
echo -e "${rosaClaro} > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ < ${endColour}";
sleep 0.05
echo -e "${rosaOscuro} /\_/\                                                                 /\_/\ ${endColour}";
sleep 0.05
echo -e "${rosaOscuro}( o.o )                                                               ( o.o )${endColour}";
sleep 0.05
echo -e "${rosaOscuro} > ^ <                                                                 > ^ < ${endColour}";
sleep 0.05
echo -e "${rosaClaro} /\_/\          ____      _     ____       _           _               /\_/\ ${endColour}";
sleep 0.05
echo -e "${rosaClaro}( o.o )        / ___| ___| |_  |  _ \ ___ | |__   ___ | |_ ___        ( o.o )${endColour}";
sleep 0.05
echo -e "${rosaClaro} > ^ <        | |  _ / _ \ __| | |_) / _ \| '_ \ / _ \| __/ __|        > ^ < ${endColour}";
sleep 0.05
echo -e "${rojoOscuro} /\_/\        | |_| |  __/ |_  |  _ < (_) | |_) | (_) | |_\__ \        /\_/\ ${endColour}";
sleep 0.05
echo -e "${rojoOscuro}( o.o )        \____|\___|\__| |_| \_\___/|_.__/ \___/ \__|___/       ( o.o )${endColour}";
sleep 0.05
echo -e "${rojoOscuro} > ^ <                                                                 > ^ < ${endColour}";
sleep 0.05
echo -e "${rosaClaro} /\_/\                                                                 /\_/\ ${endColour}";
sleep 0.05
echo -e "${rosaClaro}( o.o )                                                @soyGeekGirl   ( o.o )${endColour}";
sleep 0.05
echo -e "${rosaClaro} > ^ <                                                                 > ^ < ${endColour}";
sleep 0.05
echo -e "${rosaOscuro} /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\ ${endColour}";
sleep 0.05
echo -e "${rosaOscuro}( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )${endColour}";
sleep 0.05
echo -e "${rosaOscuro} > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ < ${endColour}";
sleep 0.05

function get_robots() {
    local url="$1"
    local user="${2:-null}"
    local robots_url="${url}/robots.txt"

regex='https?://(www\.)?([[:alnum:]]+)\.'

if [[ $url =~ $regex ]]; then
  dominio="${BASH_REMATCH[2]}"
  echo "El dominio es: $dominio"
  mkdir -p "$dominio" && cd "$dominio"
    robots_content=$(wget --header="X-HackerOne-Research:$user" -P "$dominio" -O "$dominio-robots.txt" "$robots_url")
    cat "$dominio-robots.txt" | awk -F: '{if (tolower($1) == "disallow") {print $2 >> "disallow.txt"} else {print $2 >> "remainder.txt"}}'
else
  echo "No se encontró un dominio válido"
fi

}

url="$1"
get_robots "$url"
