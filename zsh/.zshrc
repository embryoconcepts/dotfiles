
# THEME
# - Powerlevel9k AwesomeFont selection (must call before sourcing)
POWERLEVEL9K_MODE='awesome-fontconfig'

# - Source Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# - Powerlevel9k theme configuration
# - - Prompts
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon root_indicator dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status rbenv nvm time)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

# - - dir
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

# - - vcs
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='blue'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='black'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='red'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='black'

# - - status (level of description)
# POWERLEVEL9K_STATUS_VERBOSE=false

# - - time
# POWERLEVEL9K_TIME_FORMAT="%D{%H:%M \uE868 %Y.%m.%d}"
# POWERLEVEL9K_TIME_FORMAT="%D{%H:%M \uf017 %Y.%m.%d}"
POWERLEVEL9K_TIME_FORMAT="%D{\uf017 %H:%M \uf073 %Y.%m.%d}"


# - Prezto theme 
autoload -Uz promptinit
promptinit

# ALIASES
alias ls="ls -ahp"
alias f='open -a Finder ./'
alias edit='subl' 
alias mansplain='mansplain(){echo "Well, actually... "; man $1};mansplain'

# - Git aliases
alias gs="git status --short"
alias gaa="git add -A :/$*"
alias ga="git add ."
alias gcm="git commit -m $*"
alias gf="git fetch $*"
alias grd="git rebase develop $*"
alias grc="git rebase --continue"
alias gnb=newBranch

# FUNCTIONS
newBranch() {
	NOW=$(date +"%Y%m%d")
	NAME="jhamilton"
	TYPE=""
	BRANCH=""
	TICKET=""

	while [[ $TYPE == "" ]];  do
		tmp=""	
		vared -cp "Type: User story, improvement or bug (u, i or b)? " tmp
		case $tmp in
			"u") 
				TYPE="story"
				;;
			"i")
				TYPE="improvement"
				;;
			"b")
				TYPE="bug"
				;;
			*)
				echo "Invalid option"
				;;
		esac
	done
	
	while [[ $BRANCH == "" ]];  do
		tmp=""
		vared -cp "Branch: Feature, Support or Test (f, s or t)? " tmp			
		case $tmp in
			"f") 
				BRANCH="feature"
				git checkout develop
				;;
			"s")
				BRANCH="support"
				git checkout develop
				;;
			"t")
				BRANCH="test"
				git checkout develop
				;;
			*)
				echo "Invalid option"
				;;
		esac
	done
	
	vared -cp "Ticket number: " TICKET

	git pull
	git checkout -b $TYPE/$BRANCH/$NAME/$NOW/$TICKET
}

# USER CONFIGURATION
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# EDITOR
export EDITOR='subl -w'

# KEY BINDING
# - Adds ability to move cursor forward and back a word at a time
bindkey '^[^[[C' forward-word
bindkey '^[^[[D' backward-word
