#!/bin/bash
this_dir="$(dirname "$0")"

echo "Installing brew CLI programs..."
brew install $(cat "${this_dir}/brew.txt")

echo "Running post-brew commands..."

sudo ln -sfnv \
  /usr/local/opt/openjdk/libexec/openjdk.jdk \
  /Library/Java/JavaVirtualMachines/openjdk.jdk

source ~/.bashrc.d/*-node.sh
nvm install node
npm install -g npm
npm install -g yarn

for ver in $(awk '/pyenv global/ { print $3 " " $4 }' ~/.bashrc.d/*-python.sh); do
  pyenv install --skip-existing "$ver"
done
