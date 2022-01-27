# Bazrc
Hijack .bashrc and .zshrc  
Every time user pops a bash or zsh terminal a new socket is listening for us to connect.   

Note:  
bazrc.sh points to get root access trying to leave a connection always open (with first payload, second payload will fail if user close his terminal and you are looking for some persistence).  
user function and user varibles are defined and ready to be called in the same place that __root_bash_and_zsh_hijack__, but we want only root access so.   
wait until user log in terminal as root.  

# Screenshots
![alt text](https://github.com/0bfxgh0st/bazrc/blob/main/screenshots/screenshot1.png)
![alt text](https://github.com/0bfxgh0st/bazrc/blob/main/screenshots/screenshot2.png)  
