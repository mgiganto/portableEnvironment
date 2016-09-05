
if [ -f $HOME/portableEnvironment/bin/zsh ] ; then
	ZSH=TRUE
	$HOME/portableEnvironment/bin/zsh
fi


if [ $? -eq 0 ] && [ ! -z "$ZSH" ] ; then
	exit
else
	echo WARNING!!!!! FAILED EXIT FROM ZSH!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!	
fi

