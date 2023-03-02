# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/jkoronis/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/jkoronis/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/jkoronis/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/jkoronis/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


#source /data/Xilinx/Vitis/2021.2/settings64.sh
export PATH=/data/Xilinx/Vitis/2021.2/bin:$PATH
export PATH=/data/Xilinx/Vitis_HLS/2021.2/bin:$PATH
export PATH=/data/Xilinx/Vivado/2021.2/bin:$PATH


export PATH=/data/Xilinx/Vitis/2022.2/bin:$PATH
export PATH=/data/Xilinx/Vitis_HLS/2022.2/bin:$PATH
export PATH=/data/Xilinx/Vivado/2022.2/bin:$PATH


shopt -s cdable_vars #this sentence allows exported variables to be accessed without using $ sign 
export repos=/home/jkoronis/Phd/github_repositories/

source /opt/xilinx/xrt/setup.sh
#source /run/media/ogarnica/36c2d341-7919-4920-88b6-4bb5126ff312/Xilinx/Vitis/2021.2/settings64.sh
#export PLATFORM_REPO_PATHS=/opt/xilinx/platforms/xilinx_u50_gen3x16_xdma_201920_3
export PLATFORM_REPO_PATHS=/opt/xilinx/platforms/xilinx_u50_gen3x16_xdma_5_202210_1:/opt/xilinx/platforms/xilinx_u280_gen3x16_xdma_1_202211_1

alias vitis1='/data/Xilinx/Vitis/2021.2/bin/vitis' # -workspace /home/jkoronis/Downloads/workspace_test'
alias vitis2='/data/Xilinx/Vitis/2022.2/bin/vitis' # -workspace $repos/BasicOperationsInCNN/'

#to be able to run host apps running kernels successfully
#export XILINX_VITIS=/data/Xilinx/Vitis/2021.2/
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/data/Xilinx/Vitis/2021.2/lib/lnx64.o
export XILINX_VITIS=/data/Xilinx/Vitis/2022.2/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/data/Xilinx/Vitis/2022.2/lib/lnx64.o

source /home/jkoronis/Phd/github_repositories/BasicOperationsInCNN/kronecker_prod/src/runnable_shortcuts_for_bashrc.sh

export PATH=/home/jkoronis/Phd/github_repositories/bash_scripts_for_building_in_vitis/:$PATH
source /home/jkoronis/Phd/github_repositories/bash_scripts_for_building_in_vitis/iterate_branch_build_and_run.sh
source /home/jkoronis/Phd/github_repositories/bash_scripts_for_building_in_vitis/commit_push_host.sh




alias pfi_u280="platforminfo -p /opt/xilinx/platforms/xilinx_u280_gen3x16_xdma_1_202211_1/xilinx_u280_gen3x16_xdma_1_202211_1.xpfm"
alias pfi_u50="platforminfo -p /opt/xilinx/platforms/xilinx_u50_gen3x16_xdma_5_202210_1/xilinx_u50_gen3x16_xdma_5_202210_1.xpfm"

alias geditbash="gedit /home/$USER/.bashrc"
alias sourcebash="source /home/$USER/.bashrc"

export GITHUB_USER=jorgekoronis
export GITHUB_TOKEN=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
#read -n1 -p "Press something 1 in bashrc."
source /home/$USER/.local/bin/git_repos_management.sh
alias geditgitrepo="gedit /home/$USER/.local/bin/git_repos_management.sh"
source /home/$USER/.local/bin/update_in_all_branches.sh

archive_branch(){
 git tag archived/$1-old$2 $1
 git branch -D $1
 git push origin :$1
 git push origin archived/$1-old$2
}

recover_archived_branch(){
 git checkout -b $1 archived/$1-old$2
}

export ql=/home/$USER/Downloads/quicklog.txt


source /home/jkoronis/Phd/github_repositories/bash_scripts_for_building_in_vitis/commands_for_testing.sh

#storage used by the folder passed as an argument
sizeoffolder(){
local path=$1
du -sh $path
}

#available storage on the partition where the path passed as argument is mounted.
freestorage(){
local path=$1
df -h $path
}
