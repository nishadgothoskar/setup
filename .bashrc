export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"

function _wget() { curl "${1}" -o $(basename "${1}") ; };
alias wget='_wget'

export PATH="/usr/local/bin:$PATH"
export JULIA_SSL_CA_ROOTS_PATH=""
export BASH_SILENCE_DEPRECATION_WARNING=1

export CPP="/usr/local/opt/llvm/bin/clang"
export CPPFLAGS="-I/usr/local/opt/llvm/include -fopenmp"
export LDFLAGS="-L/usr/local/opt/llvm/lib"

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
alias g="git"
__git_complete g _git
alias gc="git checkout"
__git_complete gc _git_checkout
alias gs="git status"
__git_complete gs _git_status
alias gb="git branch"
__git_complete gb _git_branch
alias gd="git diff HEAD"
__git_complete gd _git_diff
alias gnb="git checkout -b"
__git_complete gnb _git_checkout
alias gbd="git branch -d"
__git_complete gbd _git_branch

alias gpo="git push -u origin HEAD"
alias gsl="git stash list"
alias gl="tig"
alias ga="git add"
alias gaa="git add -A"
alias gcm="git commit -m"
alias gca="git commit --amend"
alias gfo="git fetch origin"
alias gfu="git fetch upstream"
alias grm="git rebase --interactive master"
alias gupdate="git checkout master; git fetch origin; git pull origin master"
alias gclean="git remote prune origin"
alias gdm="git diff master"
alias gd="git diff"

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="\[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "

# export PYTHONDONTWRITEBYTECODE=1
# # export PYTHONPATH=$PYTHONPATH:/usr/lib/python3/dist-packages
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/nishadg/.mujoco/mujoco200/bin
# export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libGLEW.so

alias bashrc="subl ~/.bash_profile"

alias i="ipython"
alias ju="jupyter-notebook"
alias j="julia"

s() {
    if [ "$#" -eq 1 ]; then
        export JULIA_PROJECT="$PWD/$1"
        cd "$PWD/$1"
        source "./venv/bin/activate"
    elif [ "$#" -eq 0 ]; then
        export JULIA_PROJECT="$PWD"
        source "./venv/bin/activate"
    else
      echo "not right amount of args"
    fi
}

alias rosviz="cd ~/mcs; (roslaunch mcs.roslaunch &);"
alias ros="cd ~/mcs; (roscore &);"
alias killros="killall rosmaster"
alias killj="killall julia"
alias ig="cd ~/mit/InverseGraphics; s;"
alias ca="cd ~/mit/CoraAgent; s;"
alias o="cd ~/vicarious/objects3d; s;"
alias render="cd ~/mit/InverseGraphics; s; cd dev/GLRenderer; s;"

julia_register () {
    echo $1;
   julia -e "import $1; import LocalRegistry; LocalRegistry.register($1, registry = \"git@github.com:probcomp/InverseGraphicsRegistry.git\")"
}

fix_pycall () {
    export PYTHON=$(which python);
    export PYCALL_JL_RUNTIME_PYTHON=$(which python);
    julia --project -e 'import Pkg; Pkg.build("Conda"); Pkg.build("PyCall")'
}

alias mcs_ec2="ssh -i ~/.ssh/mcs_ec2key.pem ubuntu@52.71.54.30"
alias ec2="ssh -i ~/.ssh/ndl.pem ubuntu@18.222.217.181"

# alias robots="cd ~/robots; s ."
# alias slam="cd ~/mcs; cd GenGridSLAM.jl; s .;"
# alias agent="cd ~/mcs; cd GenAgent.jl; s .;"
# alias agency="cd ~/mcs; cd GenAgency.jl; s .;"
# alias per="cd ~/mcs; cd Perception.jl; s .;"
# alias scene="cd ~/scene_graphs/GenSceneDerender.jl; s .;"
# alias class="cd ~/6.438; s .;"
# alias play="cd ~/play; s .;"

export JULIA_NUM_THREADS=26

xorg () {
    sudo kill -9 $( ps -e | grep Xorg | awk '{ print $1 }' )
    sudo /usr/bin/Xorg :0 &
    export DISPLAY=:0
}

