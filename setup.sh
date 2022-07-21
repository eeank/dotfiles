sudo apt-get -y update
# essentials
sudo apt-get -y install python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential openssl liblzma-dev pkg-config ruby-dev patchelf tmux vim curl
export PATH:~/.local/bin/:$PATH


# install pwntools
python3 -m pip install --upgrade pip
python3 -m pip install --upgrade pwntools

# download rust 
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
echo 'source "$HOME/.cargo/env"' >> ~/.bashrc
source ~/.bashrc

# download pwninit
cargo install pwninit
echo "alias pwninit='pwninit --template-path ~/.pwninit-template.py --template-bin-name e'" >> ~/.bashrc
cp ./pwninit-template.py ~/.pwninit-template.py

# gdb peda
git clone https://github.com/longld/peda.git ~/peda

# pwngdb by angelboy
cd ~/
git clone https://github.com/scwuaptx/Pwngdb.git 
cp ~/Pwngdb/.gdbinit ~/

# copy vimrc
cp ./.vimrc ~/

# tmux conf
cp ./.tmux.conf ~/

# one_gadget
sudo gem install one_gadget

# reload settings
source ~/.bashrc
