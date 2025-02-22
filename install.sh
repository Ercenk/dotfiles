#!/bin/bash

cp ./.gitmessage ~
cp ./.gitconfig ~
git config --global commit.template ~/.gitmessage

if [ ! -d "$HOME/.streamlit" ]; then
    mkdir "$HOME/.streamlit"
fi
cp -r ./.streamlit/* "$HOME/.streamlit/"

# powerline fonts for zsh agnoster theme
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd .. && rm -rf fonts

# oh-my-zsh & plugins
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
zsh -c 'git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions'
zsh -c 'git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting'
zsh -c 'git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-you-should-use'

zsh -c 'git clone https://github.com/VidalChavez/pygmalion ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/pygmalion'

cp ./.zshrc ~

########################################################################################################################
#### set agnoster as theme, this came from https://gist.github.com/corentinbettiol/21a6d4e942a0ee58d51acb7996697a88
#### in vscode settings for devcontainer (not for User or Workspace), Search for terminal.integrated.fontFamily value, and set it to "Roboto Mono for Powerline" (or any of those: https://github.com/powerline/fonts#font-families font families).
# save current zshrc
mv ~/.zshrc ~/.zshrc.bak
cp ./.zshrc ~

sudo sh -c "$(wget -O- https://raw.githubusercontent.com/deluan/zsh-in-docker/master/zsh-in-docker.sh)" -- \
    -t agnoster

