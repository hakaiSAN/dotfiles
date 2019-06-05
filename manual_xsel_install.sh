#TODO Update version and rood directory
libevent="2.1"
ncurses_version="6.0"
root=$HOME/local

function installLibrary() {
  cd $root/../tool/$1
  ./configure --exec-prefix=$root --prefix=$root
  make
  make install
  cd ../

}


#To prepare
mkdir $root/../tool
mkdir $root
#For Library
cd $root/../tool
git clone https://github.com/libevent/libevent.git
git clone git clone git://git.savannah.gnu.org/libtool.git
wget https://ftp.gnu.org/pub/gnu/ncurses/ncurses-${ncurses_version}.tar.gz
tar zxvf ncurses-${ncurses_version}.tar.gz
#Library install 
installLibrary libevent
installLibrary libtool
installLibrary ncurses-${ncurses_version}

#xsel install
export PATH=$PATH:$root/bin
export LD_LIBRARY_PATH=$PATH:$root/lib
cd $root/../tool
git clone https://github.com/kfish/xsel.git
cd xsel
./autogen.sh --prefix=$root --exec-prefix=$root
installLibrary xsel
