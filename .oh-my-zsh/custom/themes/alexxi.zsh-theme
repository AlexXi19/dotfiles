PROMPT=' %{$fg[gray]%}%~%{$reset_color%} $(git_prompt_info)'


ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[white]%}git:(%{$fg_bold[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[white]%}) %{$fg_bold[white]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[white]%})"

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


