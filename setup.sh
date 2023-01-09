sudo apt-get -y update

# copy vimrc
cp ~/dotfiles/vimrc ~/.vimrc

# tmux conf
cp ~/dotfiles/tmux.conf ~/.tmux.conf

# essentials
<<<<<<< HEAD
sudo apt-get -y zsh install python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential openssl liblzma-dev pkg-config ruby-dev patchelf tmux vim curl gdb elfutils

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

=======
sudo apt-get -y install python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential openssl liblzma-dev pkg-config ruby-dev patchelf tmux vim curl gdb elfutils
>>>>>>> 311560cb63419320fe123c43a15a3f7f853215c3
echo "export PATH:~/.local/bin/:$PATH" >> ~/.bashrc


# install pwntools
python3 -m pip install --upgrade pip
python3 -m pip install --upgrade pwntools

<<<<<<< HEAD
# download rust 
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
echo 'source "$HOME/.cargo/env"' >> ~/.bashrc
source "$HOME/.cargo/env"
=======
# download rust, since it's only for pwninit I don't think it's needed for now..
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# echo 'source "$HOME/.cargo/env"' >> ~/.bashrc
# source "$HOME/.cargo/env"
# source ~/.bashrc
>>>>>>> 311560cb63419320fe123c43a15a3f7f853215c3

# # download pwninit
# cargo install pwninit
# echo "alias pwninit='pwninit --template-path ~/.pwninit-template.py --template-bin-name e'" >> ~/.bashrc
# cp ./pwninit-template.py ~/.pwninit-template.py

# gdb peda
git clone https://github.com/longld/peda.git ~/peda

# pwngdb by angelboy
cd ~/
git clone https://github.com/scwuaptx/Pwngdb.git 
cp ~/Pwngdb/.gdbinit ~/


# one_gadget
sudo gem install one_gadget

# reload settings
source ~/.bashrc

# init ctf setting
cd ~
mkdir ctf