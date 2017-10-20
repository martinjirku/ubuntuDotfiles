EMAIL="martinjirku@gmail.com"
NAME="Martin MJ Jirku"
DOT_REPOSITORY="git@github.com:martinjirku/ubuntuDotfiles.git"

echo "entering the home directory at ~/..."
cd ~

echo "preparing ssh keys..."
echo "  - generating new key"
ssh-keygen -t rsa -b 4096 -C "${EMAIL}"
echo "  - adding key to ssh agent"
ssh-agent
eval "$(ssh-agent -s)"
echo "  - adding a private key do ssh agent"
ssh-add -k ~/.ssh/id_rsa
echo "COPY your public key and place it to githubkeys here: https://github.com/settings/keys"
echo 
echo

cat ~/.ssh/id_rsa.pub

echo
echo
echo "Write \"github\", when you are done > "
while [ "$submittedToGithub" != "github" ]; do
	read submittedToGithub
done


echo "preparing apt-get dependencies, please provid user informations..."
# installing add-apt-repository command
sudo apt-get update
sudo apt-get install software-properties-common

echo "installing git"
# adding git-core/ppa repo and install git
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install git

echo "setting up git globals (user.email, user.name)..."
git config --global user.email "${EMAIL}"
git config --global user.name "${NAME}"

echo "cloning dotfiles... from ${DOT_REPOSITORY} to ~/dotfiles"
# cloning repository
git clone $DOT_REPOSITORY dotfiles
