# Author: Zachary Snow <zach@zachjs.com>
# based on oh my zsh's "simple" theme

local ret_status="[%B%(?:%F{green}%?%f:%F{red}%?%f)%b]%{$reset_color%}"
local host_name="%{$fg_bold[black]%}$HOST%{$reset_color%}"
local dir_path="%{$fg[green]%}%~%{$fg_bold[blue]%}%{$reset_color%}"

PROMPT='${host_name} ${ret_status} ${dir_path} $(git_prompt_info)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=") "
ZSH_THEME_GIT_PROMPT_DIRTY=" ✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" ✔"
