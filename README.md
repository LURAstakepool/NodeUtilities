# Node Utilities.

**Basics scripts for creating and updating a Cardano stake pool.** After reading many guides I have created this basic scripts/guide. A problem that is sometimes faced when using scripts for automate some process is that new users don't really understand what they are doing and for a critical area like cryptocurrency, this behavior is far from acceptable. This repo has the objective of allowing you to implement a Cardano node and stake pool quickly, while still fully understanding what you are doing. I recommend you to always contrast what you are executing against guides like the [Coincashew](https://www.coincashew.com/coins/overview-ada/guide-how-to-build-a-haskell-stakepool-node) or the one available at the [Cardano Developers portal](https://developers.cardano.org/docs/stake-pool-course/) (which are actually the sources of this small guide)

# Installation
*This installation process is for Debian/Ubuntu only*
*This is mainly the same process described in the Cardano Developers Portal*

### Install requirements:

	sudo apt-get update -y && sudo apt-get upgrade -y
	sudo apt-get install automake build-essential pkg-config libffi-dev libgmp-dev libssl-dev libtinfo-dev libsystemd-dev zlib1g-dev make g++ tmux git jq wget libncursesw5 libtool autoconf -y


Next, we must install GHC and Cabal:

	curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
	ghcup install ghc 8.10.7
	ghcup set ghc 8.10.7   
	ghcup install cabal 3.6.2.0
	ghcup set cabal 3.6.2.0
You can check if installed correctly by running:

	ghc --version
	cabal --version
In case that this commands don't show any output, try again after running this command:
	
	source $HOME/.bashrc


### Compile Cardano-node:
Now we are going to make use of this repo's scripts:
First, we must install some extra libraries:

	sudo sh setup-scripts/installation.sh
When this stops executing you must reboot your machine:
	
	sudo reboot 
After this you run the last installation command:

	sudo sh setup-scripts/installation-node.sh


Cardano-node and Cardano-cli are now installed in your system, you should see the versions of the programs printed on your terminal.
