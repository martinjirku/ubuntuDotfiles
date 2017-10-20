curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.5/install.sh | bash


chmod +x ~/.nvm

~/.nvm/nvm.sh install v8.7.0

apt-get install apt-transport-https
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn
