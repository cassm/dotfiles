# af-magic.zsh-theme
# Repo: https://github.com/andyfleming/oh-my-zsh
# Direct Link: https://github.com/andyfleming/oh-my-zsh/blob/master/themes/af-magic.zsh-theme

if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
local return_code=""
 
# primary prompt
PROMPT='$FG[237]------------------------------------------------------------%{$reset_color%}
$FG[198]%2~%{$reset_color%}\
$(git_prompt_info) \
$FG[154]%(?..$FG[009])\
%(!.#.»)%{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='${return_code}'

function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(parse_git_dirty)$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
    }


# color vars
eval my_gray='$FG[237]'
eval my_orange='$FG[214]'

# right prompt
if type "virtualenv_prompt_info" > /dev/null
then
	RPROMPT='$(virtualenv_prompt_info)$my_gray%n@%m%{$reset_color%}%'
else
	RPROMPT='$my_gray%n@%m%{$reset_color%}%'
fi

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX=" on "
ZSH_THEME_GIT_PROMPT_CLEAN="$FG[014]"
ZSH_THEME_GIT_PROMPT_DIRTY="$FG[011]"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
