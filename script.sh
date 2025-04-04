#!/bin/bash

# Renk kodları
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m'



# 8. bringmecoins
echo " "
echo " "
echo " "
echo -e "${BLUE} ######   ######    ####    ##   ##    ####   ##   ##  #######    ####    #####    ####    ##   ##   #####${NC}"
echo -e "${BLUE}  ##  ##   ##  ##    ##     ###  ##   ##  ##  ### ###   ##   #   ##  ##  ##   ##    ##     ###  ##  ##   ##${NC}"
echo -e "${BLUE}  ##  ##   ##  ##    ##     #### ##  ##       #######   ## #    ##       ##   ##    ##     #### ##  #${NC}"
echo -e "${BLUE}  #####    #####     ##     ## ####  ##       #######   ####    ##       ##   ##    ##     ## ####   #####${NC}"
echo -e "${BLUE}  ##  ##   ## ##     ##     ##  ###  ##  ###  ## # ##   ## #    ##       ##   ##    ##     ##  ###       ##${NC}"
echo -e "${BLUE}  ##  ##   ##  ##    ##     ##   ##   ##  ##  ##   ##   ##   #   ##  ##  ##   ##    ##     ##   ##  ##   ##${NC}"
echo -e "${BLUE} ######   #### ##   ####    ##   ##    #####  ##   ##  #######    ####    #####    ####    ##   ##   #####${NC}"
echo " "
echo " "
echo " "
echo " "

echo "📦 Update..."
sudo apt update && sudo apt install -y sudo

echo "🔧 Packages install"
sudo apt update && sudo apt install -y \
  python3 python3-venv python3-pip curl wget screen git lsof
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install -y yarn

echo "🚀 Gensyn script start.."
curl -sSL https://raw.githubusercontent.com/zunxbt/installation/main/node.sh | bash

echo "📁 Cloning the repo..."
cd $HOME
[ -d rl-swarm ] && rm -rf rl-swarm
git clone https://github.com/zunxbt/rl-swarm.git
cd rl-swarm

echo "📦 Yarn update..."
cd modal-login
yarn install
yarn upgrade
yarn add next@latest
yarn add viem@latest

echo "🚀 Node installed..."
cd $HOME/rl-swarm
screen -dmS gensyn bash -c "python3 -m venv .venv && . .venv/bin/activate && ./run_rl_swarm.sh"

echo -e "${GREEN}CC : ZUNXBT ${NC}"

echo "COMPLETED"

# 8. bringmecoins
echo " "
echo " "
echo " "
echo -e "${BLUE} ######   ######    ####    ##   ##    ####   ##   ##  #######    ####    #####    ####    ##   ##   #####${NC}"
echo -e "${BLUE}  ##  ##   ##  ##    ##     ###  ##   ##  ##  ### ###   ##   #   ##  ##  ##   ##    ##     ###  ##  ##   ##${NC}"
echo -e "${BLUE}  ##  ##   ##  ##    ##     #### ##  ##       #######   ## #    ##       ##   ##    ##     #### ##  #${NC}"
echo -e "${BLUE}  #####    #####     ##     ## ####  ##       #######   ####    ##       ##   ##    ##     ## ####   #####${NC}"
echo -e "${BLUE}  ##  ##   ## ##     ##     ##  ###  ##  ###  ## # ##   ## #    ##       ##   ##    ##     ##  ###       ##${NC}"
echo -e "${BLUE}  ##  ##   ##  ##    ##     ##   ##   ##  ##  ##   ##   ##   #   ##  ##  ##   ##    ##     ##   ##  ##   ##${NC}"
echo -e "${BLUE} ######   #### ##   ####    ##   ##    #####  ##   ##  #######    ####    #####    ####    ##   ##   #####${NC}"
echo " "
echo -e "${GREEN}#### Twitter : @BringMeCoins #####${NC}"
echo " "
echo -e "${GREEN}Gensyn Node installation completed.${NC}"
echo " "
echo -e "${GREEN}Run node : ${NC}""${YELLOW}screen -r gensyn${NC}"
