 ############################################################
 # bspguy/lx-scripts lx-settings.sh  last update 16.03.2024 #
 ############################################################
 #!/bin/sh

LX_SCRIPT_LOC="./"

#
# Add required binary tools to the user's search path
#
PATH="${LX_SCRIPT_LOC}/scripts/:${PATH}"

#
# Check for "." or ".\" in the path - it's broken
#
echo "${PATH}" | tr ":" "\n" | grep '^\./*$' > /dev/null && 
	echo "WARNING: '.' detected in PATH - fixing it." 1>&2
PATH=`echo ${PATH} | tr ":" "\n" | grep -v '^\./*$' | tr "\n" ":"`

# Strip any trailing or multi-colons - they are interpreted as '.'
PATH=$(echo ${PATH} | sed -e 's/:*$//g' -e 's/::*/:/g')

export PATH


echo LX Scripts environment set to \'${LX_SCRIPT_LOC}\'

for s in /bin/sh sh; do
	if ! $s --version 2>/dev/null | grep -q "^GNU bash"; then
		echo "WARNING: $s is not bash! "
		echo "bash is PetaLinux recommended shell. Please set your default shell to bash."
		break
	fi
done

if ! echo $SHELL | grep -q "bash"; then
	echo "WARNING: $SHELL is not bash! "
	echo "/bin/bash is lx-scripts recommended SHELL variable. Please set your SHELL variable to /bin/bash."
fi