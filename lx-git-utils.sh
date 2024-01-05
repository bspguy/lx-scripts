 #######################################################
 # bspguy/lx-scripts lx_git.sh  last update 24.12.2021 #
 #######################################################
 #!/bin/sh
Help()
{
   echo "lx-git-utils.sh script description."
   echo
   echo "Syntax: lx-git-utils.sh [-h|s|a]"
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

Fetch()
{
	git fetch
}

Log()
{
	git log
}

ListRemoteGitTags()
{
	git tag -n
}

ListRemoteBranches()
{
   git show-branch -r
}

CheckOutNewBranch()
{
	git checkout -b new_branch_name
 	git push --set-upstream origin new_branch_name
}

CheckOutRemoteTag()
{
	git checkout -b new_local_branch_name tags/remote_tag_name
}

CheckOutRemoteBranch()
{
   git fetch origin
   git checkout --track origin/remote_branch_name
}

Commit()
{
   git commit -m "updated files :)"
}

AddCommitPush()
{
	git add .  &&  git commit -m "Updated lx-git script" && git push
}


MirrorGitBareRepo()
{
	git clone --bare --mirror  git@github.com:analogdevicesinc/libiio.git
	#then 
	git clone /path/to/bare/
}

CrateTag()
{
    git tag -a v1.4 -m "my version 1.4"
}

PushTags()
{
   git push origin --tags
}

Push()
{
	git push
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

