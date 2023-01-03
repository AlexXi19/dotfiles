PROMPT=' %{$fg[magenta]%}%~%{$reset_color%} $(git_prompt_info)'


ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[green]%}git:(%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%})"

prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
      print -n "%{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
      print -n "%{%k%}"
  fi

  print -n "%{%f%}"
  CURRENT_BG='' 

  printf "\n \n ➜ ";
}

PROMPT+='%{%f%b%k%}$(prompt_end)'

precmd() {
  echo ""
}

preexec() {
  echo ""
}


