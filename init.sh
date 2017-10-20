EMAIL="martinjirku@gmail.com"
NAME="Martin MJ Jirku"
DOT_REPOSITORY="https://github.com/martinjirku/ubuntuDotfiles.git"

echo "entering the home directory at ~/..."
cd ~

echo "preparing apt-get dependencies, please provid user informations..."
# installing add-apt-repository command
sudo apt-get update
sudo apt-get install software-properties-common

echo "installing git"
# adding git-core/ppa repo and install git
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install git

echo "cloning dotfiles... from ${DOT_REPOSITORY} to ~/dotfiles"
# cloning repository
git clone $DOT_REPOSITORY dotfiles
echo "setting up git globals (user.email, user.name)..."

git config --global user.email "${EMAIL}"
git config --global user.name "${NAME}"
