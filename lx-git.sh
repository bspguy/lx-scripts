 #######################################################
 # misteroy/scripts bdl_git.sh  last update 24.12.2021 #
 #######################################################
 #!/bin/sh
Help()
{
   echo "bdl_git.sh script description."
   echo
   echo "Syntax: bdl_git.sh [-h|s|a]"
   echo "options:"
   echo "h     Print this Help."
   echo "s     Shows the git repo status"
   echo "a     Add new files, Commit and push."
   echo
}

Status()
{
	if [ $(git status --porcelain | wc -l) -eq "0" ]; then 
		echo "  🟢 Git repo is clean."
	else 
		echo "  🔴 Git repo dirty. Quit."
  	exit 1
	fi
}

Commit()
{

	//just commit

}

AddCommitPush()
{

	git add .  &&  git commit -m "updated files :)" && git push

}

Push()
{

	//just push

}

Log()
{
   git log -v HEAD..origin/main
}

# Get the options
while getopts ":hsal" option; do
   case $option in
	h) # display Help
         Help
         exit;;
	s) # show git status
         Status
         exit;;
	a) # Add new files, Commit and push
         AddCommitPush
         exit;;
	l) # log commit diff
         Log
         exit;;         
     \?) # incorrect option
         echo "Error: Invalid option"
         exit;;
   esac
done

Help
exit;

echo "
._____. ._____. .____________________. ._____. ._____.
| ._. | | ._. | | .________________. | | ._. | | ._. |
| !_| |_|_|_! | | !________________! | | !_| |_|_|_! |
!___| |_______! !____________________! !___| |_______!
.___|_|_| |________________________________|_|_| |___.
| ._____| |____________________________________| |_. |
| !_! | | |                                | | ! !_! |
!_____! | | If you are reading this        | | !_____!
._____. | | then somting worng has happend | | ._____.
| ._. | | |                                | | | ._. |
| | | | | |                                | | | | | |
| !_! | | |                                | | ! !_! |
!_____! | |                                | | !_____!
._____. | |                                | | ._____.
| ._. | | |                                | | | ._. |
| !_| |_|_|________________________________| |_|_|_! |
!___| |____________________________________| |_______!
.___|_|_| |___. .____________________. .___|_|_| |___.
| ._____| |_. | | .________________. | | ._____| |_. |
| !_! | | !_! | | !________________! | | !_! | | !_! |
!_____! !_____! !____________________! !_____! !_____!
"

