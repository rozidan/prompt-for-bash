#!/usr/bin/env bash

 # 'EXIT_CODE' 'CLOCK' 'USER_HOST' 'GIT' 'WD' 'ROOT_IND' 'TIMER'

if [[ ${#__PS1_PROMPT_LIST[@]} -eq 0 ]]; then
  __PS1_PROMPT_LIST=('TIMER' 'EXIT_CODE' 'CLOCK' 'USER_HOST' 'GIT' 'WD')
fi

__PS1_ENABLE_MULTILINE=${__PS1_ENABLE_MULTILINE:=true}
__PS1_ENABLE_SEPARATORS=${__PS1_ENABLE_SEPARATORS:=true}
__PS1_EXIT_CODE_MODE=${__PS1_EXIT_CODE_MODE:=full}
__PS1_EXIT_CODE_SHOW_SIGNAL_DESC=${__PS1_EXIT_CODE_SHOW_SIGNAL_DESC:=true}
__PS1_SHOW_HOST=${__PS1_SHOW_HOST:=false}
__PS1_GIT_SHOW_DETAILS=${__PS1_GIT_SHOW_DETAILS:=true}
__PS1_GIT_IGNORE_UNTRACKED=${__PS1_GIT_IGNORE_UNTRACKED:=false}
__PS1_GIT_SHOW_CURRENT_USER=${__PS1_GIT_SHOW_CURRENT_USER:=true}
__PS1_GIT_SHOW_REMOTE_INFO=${__PS1_GIT_SHOW_REMOTE_INFO:=auto}

__PS1_CLOCK_FORMAT=${__PS1_CLOCK_FORMAT:="%H:%M:%S"}
__PS1_WD_MODE=${__PS1_WD_MODE:=full}

__PS1_MULTILINE_CHAR1=${__PS1_MULTILINE_CHAR1:='┌─'}
__PS1_MULTILINE_CHAR2=${__PS1_MULTILINE_CHAR2:='└►'}
__PS1_RIGHT_SEPARATOR=${__PS1_RIGHT_SEPARATOR:=''}

__PS1_GIT_SIGN=${__PS1_GIT_SIGN:=''}
__PS1_GIT_CURRENT_USER_PREFIX=${__PS1_GIT_CURRENT_USER_PREFIX:=' ('}
__PS1_GIT_CURRENT_USER_SUFFIX=${__PS1_GIT_CURRENT_USER_SUFFIX:=')'}
__PS1_GIT_PROMPT_DIRTY=${__PS1_GIT_PROMPT_DIRTY:=' ✗'}
__PS1_GIT_PROMPT_CLEAN=${__PS1_GIT_PROMPT_CLEAN:=' ✓'}
__PS1_GIT_AHEAD_CHAR=${__PS1_GIT_AHEAD_CHAR:='↑'}
__PS1_GIT_BEHIND_CHAR=${__PS1_GIT_BEHIND_CHAR:='↓'}
__PS1_GIT_UNTRACKED_CHAR=${__PS1_GIT_UNTRACKED_CHAR:='?:'}
__PS1_GIT_UNSTAGED_CHAR=${__PS1_GIT_UNSTAGED_CHAR:='U:'}
__PS1_GIT_STAGED_CHAR=${__PS1_GIT_STAGED_CHAR:='S:'}
__PS1_GIT_BRANCH_TRACK_PREFIX=${__PS1_GIT_BRANCH_TRACK_PREFIX:=' → '}
__PS1_GIT_BRANCH_GONE_PREFIX=${__PS1_GIT_BRANCH_GONE_PREFIX:=' ⇢ '}
__PS1_GIT_TAG_PREFIX=${__PS1_GIT_TAG_PREFIX:='tag:'}
__PS1_GIT_DETACHED_PREFIX=${__PS1_GIT_DETACHED_PREFIX:='detached:'}
__PS1_GIT_AHEAD_CHAR=${__PS1_GIT_AHEAD_CHAR:='↑'}
__PS1_GIT_BEHIND_CHAR=${__PS1_GIT_BEHIND_CHAR:='↓'}
__PS1_GIT_NONE=${__PS1_GIT_NONE:='○'}
if [[ ${#__PS1_GIT_DIRTY_SIGNS[@]} -eq 0 ]]; then
  __PS1_GIT_DIRTY_SIGNS=('' '¹' '²' '³')
fi

__PS1_TIMER_PROMPT_PREFIX=${__PS1_TIMER_PROMPT_PREFIX:=''}
__PS1_TIMER_PROMPT_SUFFIX=${__PS1_TIMER_PROMPT_SUFFIX:=''}

__PS1_GIT_PROMPT_PREFIX=${__PS1_GIT_PROMPT_PREFIX:=''}
__PS1_GIT_PROMPT_SUFFIX=${__PS1_GIT_PROMPT_SUFFIX:=''}

__PS1_CLOCK_PROMPT_PREFIX=${__PS1_CLOCK_PROMPT_PREFIX:=''}
__PS1_CLOCK_PROMPT_SUFFIX=${__PS1_CLOCK_PROMPT_SUFFIX:=''}

__PS1_USER_HOST_PROMPT_PREFIX=${__PS1_USER_HOST_PROMPT_PREFIX:=''}
__PS1_USER_HOST_PROMPT_SUFFIX=${__PS1_USER_HOST_PROMPT_SUFFIX:=''}

__PS1_WD_PROMPT_PREFIX=${__PS1_WD_PROMPT_PREFIX:=''}
__PS1_WD_PROMPT_SUFFIX=${__PS1_WD_PROMPT_SUFFIX:=''}

__PS1_EXIT_CODE_PROMPT_PREFIX=${__PS1_EXIT_CODE_PROMPT_PREFIX:=''}
__PS1_EXIT_CODE_PROMPT_SUFFIX=${__PS1_EXIT_CODE_PROMPT_SUFFIX:=''}
__PS1_EXIT_CODE_OK_CHAR=${__PS1_EXIT_CODE_OK_CHAR:='✔'}
__PS1_EXIT_CODE_ERROR_CHAR=${__PS1_EXIT_CODE_ERROR_CHAR:='✘'}
__PS1_EXIT_CODE_SIGNAL_CHAR=${__PS1_EXIT_CODE_SIGNAL_CHAR:='»'}

__PS1_EXIT_CODE_FG_COLOR_SIGNAL=${__PS1_EXIT_CODE_FG_COLOR_SIGNAL:=0}
__PS1_EXIT_CODE_BG_COLOR_SIGNAL=${__PS1_EXIT_CODE_BG_COLOR_SIGNAL:=11}
__PS1_EXIT_CODE_FG_COLOR_ERROR=${__PS1_EXIT_CODE_FG_COLOR_ERROR:=0}
__PS1_EXIT_CODE_BG_COLOR_ERROR=${__PS1_EXIT_CODE_BG_COLOR_ERROR:=9}
__PS1_EXIT_CODE_FG_COLOR_OK=${__PS1_EXIT_CODE_FG_COLOR_OK:=0}
__PS1_EXIT_CODE_BG_COLOR_OK=${__PS1_EXIT_CODE_BG_COLOR_OK:=71}
__PS1_EXIT_CODE_FG_COLOR=${__PS1_EXIT_CODE_FG_COLOR:=15}
__PS1_EXIT_CODE_BG_COLOR=${__PS1_EXIT_CODE_BG_COLOR:=235}

__PS1_CLOCK_FG_COLOR=${__PS1_CLOCK_FG_COLOR:=255}
__PS1_CLOCK_BG_COLOR=${__PS1_CLOCK_BG_COLOR:=237}

__PS1_USER_HOST_FG_COLOR=${__PS1_USER_HOST_FG_COLOR:=0}
__PS1_USER_HOST_BG_COLOR=${__PS1_USER_HOST_BG_COLOR:=250}

__PS1_GIT_FG_COLOR=${__PS1_GIT_FG_COLOR:=0}
__PS1_GIT_BG_COLOR=${__PS1_GIT_BG_COLOR:=30}

__PS1_WD_FG_COLOR=${__PS1_WD_FG_COLOR:=255}
__PS1_WD_BG_COLOR=${__PS1_WD_BG_COLOR:=237}

__PS1_TIMER_FG_COLOR=${__PS1_TIMER_FG_COLOR:=178}
__PS1_TIMER_BG_COLOR=${__PS1_TIMER_BG_COLOR:=0}

function __ps1_is_binary_exists {
  type -P -- "$@" &>/dev/null
}

function __ps1_is_func_exists {
  type -t -- "$@" &>/dev/null
}

function __ps1_check_git {
  if [[ -f .git/HEAD ]]; then __PS1_IS_GIT="true"
  elif __ps1_is_binary_exists git && [[ -n "$(git rev-parse --is-inside-work-tree 2> /dev/null)" ]]; then __PS1_IS_GIT="true"
  else __PS1_IS_GIT="false"
  fi
}

function __ps1_git_clean_branch {
  local -r unsafe_ref=$(command git symbolic-ref -q HEAD 2> /dev/null)
  local -r stripped_ref=${unsafe_ref##refs/heads/}
  echo "${stripped_ref}"
}

function __ps1_git_status_summary {
  awk '
  BEGIN {
    untracked=0;
    unstaged=0;
    staged=0;
  }
  {
    if (!after_first && $0 ~ /^##.+/) {
      print $0
      seen_header = 1
    } else if ($0 ~ /^\?\? .+/) {
      untracked += 1
    } else {
      if ($0 ~ /^.[^ ] .+/) {
        unstaged += 1
      }
      if ($0 ~ /^[^ ]. .+/) {
        staged += 1
      }
    }
    after_first = 1
  }
  END {
    if (!seen_header) {
      print
    }
    print untracked "\t" unstaged "\t" staged
  }'
}

function __ps1_git_prompt_vars {
  local details=''
  local git_status_flags=()
  __PS1_GIT_STATE=${__PS1_GIT_PROMPT_CLEAN}
  if [[ "$(git config --get bash-it.hide-status)" != "1" ]]; then
    [[ "${__PS1_GIT_IGNORE_UNTRACKED}" = "true" ]] && git_status_flags=('-uno')
    local -r status_lines=$( (git status --porcelain "${git_status_flags[@]}" -b 2> /dev/null ||
                          git status --porcelain "${git_status_flags[@]}"    2> /dev/null) | __ps1_git_status_summary)
    local -r status=$(awk 'NR==1' <<< "$status_lines")
    local -r counts=$(awk 'NR==2' <<< "$status_lines")
    IFS=$'\t' read -r untracked_count unstaged_count staged_count <<< "$counts"
    if [[ "${untracked_count}" -gt 0 || "${unstaged_count}" -gt 0 || "${staged_count}" -gt 0 ]]; then
      __PS1_GIT_DIRTY=1
      if [[ "${__PS1_GIT_SHOW_DETAILS}" = "true" ]]; then
        [[ "${staged_count}" -gt 0 ]] && details+=" ${__PS1_GIT_STAGED_CHAR}${staged_count}" && __PS1_GIT_DIRTY=3
        [[ "${unstaged_count}" -gt 0 ]] && details+=" ${__PS1_GIT_UNSTAGED_CHAR}${unstaged_count}" && __PS1_GIT_DIRTY=2
        [[ "${untracked_count}" -gt 0 ]] && details+=" ${__PS1_GIT_UNTRACKED_CHAR}${untracked_count}" && __PS1_GIT_DIRTY=1
      fi
      __PS1_GIT_STATE=${__PS1_GIT_PROMPT_DIRTY}${__PS1_GIT_DIRTY_SIGNS[$__PS1_GIT_DIRTY]}
    fi
  fi

  [[ "${__PS1_GIT_SHOW_CURRENT_USER}" == "true" ]] && details+="$(__ps1_git_user_info)"

  local -r git_change=$(git rev-parse --short HEAD 2>/dev/null)

  local ref; ref=$(__ps1_git_clean_branch)

  if [[ -n "$ref" ]]; then
    __PS1_GIT_BRANCH="${ref}"
    local tracking_info; tracking_info="$(grep -- "${__PS1_GIT_BRANCH}\.\.\." <<< "${status}")"
    if [[ -n "${tracking_info}" ]]; then
      [[ "${tracking_info}" =~ .+\[gone\]$ ]] && local branch_gone="true"
      tracking_info=${tracking_info#\#\# ${__PS1_GIT_BRANCH}...}
      tracking_info=${tracking_info% [*}
      local remote_name=${tracking_info%%/*}
      local remote_branch=${tracking_info#${remote_name}/}
      local remote_info=""
      local -r num_remotes=$(git remote | wc -l 2> /dev/null)
      [[ "${__PS1_GIT_BRANCH}" = "${remote_branch}" ]] && local same_branch_name=true
      if  { [[ "${__PS1_GIT_SHOW_REMOTE_INFO}" = "auto" ]] && [[ "${num_remotes}" -ge 2 ]]; } ||
          [[ "${GIT_SHOW_REMOTE_INFO}" = "true" ]]; then
        remote_info="${remote_name}"
        [[ "${same_branch_name}" != "true" ]] && remote_info+="/${remote_branch}"
      elif [[ ${same_branch_name} != "true" ]]; then
        remote_info="${remote_branch}"
      fi
      if [[ -n "${remote_info}" ]];then
        if [[ "${branch_gone}" = "true" ]]; then
          __PS1_GIT_BRANCH+="${__PS1_GIT_BRANCH_GONE_PREFIX}${remote_info}"
        else
          __PS1_GIT_BRANCH+="${__PS1_GIT_BRANCH_TRACK_PREFIX}${remote_info}"
        fi
      fi
    fi
  else
    local detached_prefix=""
    ref=$(git describe --tags --exact-match 2> /dev/null)
    if [[ -n "$ref" ]]; then
      detached_prefix=${__PS1_GIT_TAG_PREFIX}
    else
      ref=$(git describe --contains --all HEAD 2> /dev/null)
      ref=${ref#remotes/}
      [[ -z "$ref" ]] && ref=${git_change}
      detached_prefix=${__PS1_GIT_DETACHED_PREFIX}
    fi
    __PS1_GIT_BRANCH=${detached_prefix}${ref}
  fi

  local ahead_re='.+ahead ([0-9]+).+'
  local behind_re='.+behind ([0-9]+).+'
  [[ "${status}" =~ ${ahead_re} ]] && __PS1_GIT_BRANCH+=" ${__PS1_GIT_AHEAD_CHAR}${BASH_REMATCH[1]}"
  [[ "${status}" =~ ${behind_re} ]] && __PS1_GIT_BRANCH+=" ${__PS1_GIT_BEHIND_CHAR}${BASH_REMATCH[1]}"

  local -r stash_count="$(git stash list 2> /dev/null | wc -l | tr -d ' ')"
  [[ "${stash_count}" -gt 0 ]] && __PS1_GIT_BRANCH+=" {${stash_count}}"

  __PS1_GIT_BRANCH+=${details}
}

function __ps1_git_user_info {
  local current_user; current_user=$(git config user.initials | sed 's% %+%')
  [[ -z "${current_user}" ]] && current_user=$(printf "%s" "$(for word in $(git config user.name | tr '[:upper:]' '[:lower:]'); do printf "%1.1s" "$word"; done)")
  [[ -n "${current_user}" ]] && printf "%s" "${__PS1_GIT_CURRENT_USER_PREFIX}${current_user}${__PS1_GIT_CURRENT_USER_SUFFIX}"
}

function __PS1_GIT_PROMPT {
  __ps1_check_git
  if [[ "${__PS1_IS_GIT}" = "true" ]]; then
    __PS1_GIT_DIRTY=0
    __PS1_GIT_STATE=''
    __ps1_git_prompt_vars
  else
    __PS1_GIT_BRANCH="$__PS1_GIT_NONE"
  fi
  __PS1_PROMPT_STR="${__PS1_GIT_SIGN} ${__PS1_GIT_BRANCH}${__PS1_GIT_STATE}"
}

function __PS1_CLOCK_PROMPT {
  local -r clock_string=$(date +"${__PS1_CLOCK_FORMAT}")
  __PS1_PROMPT_STR="${clock_string}"
}

function __PS1_USER_HOST_PROMPT {
  local host_str=''
  if [[ "${__PS1_SHOW_HOST}" = "true" ]]; then
    host_str="@$(hostname)"
  fi

  __PS1_PROMPT_STR="$(whoami)${host_str}"
}

function __PS1_WD_PROMPT {
  if [[ "${__PS1_WD_MODE}" = "full" ]]; then
    local -r wd=$(pwd)
    __PS1_PROMPT_STR="${wd/"$HOME"/"~"}"
  else
    __PS1_PROMPT_STR="$(basename "$(pwd)")"
  fi
}

__PS1_EXIT_CODE_SIGNAL_TEXT=("" "SIGHUP" "SIGINT" "SIGQUIT" "SIGILL" "SIGTRAP" "SIGABRT" "SIGBUS" "SIGFPE" "SIGKILL" "SIGUSR1" "SIGSEGV" "SIGUSR2" "SIGPIPE" "SIGALRM" "SIGTERM" "SIGSTKFLT" "SIGCHLD" "SIGCONT" "SIGSTOP" "SIGTSTP" "SIGTTIN" "SIGTTOU" "SIGURG" "SIGXCPU" "SIGXFSZ" "SIGVTALRM" "SIGPROF" "SIGWINCH" "SIGIO" "SIGPWR" "SIGSYS" )

function __PS1_EXIT_CODE_PROMPT {
  local exit_code_sig_txt="$__PS1_EXIT_CODE"
  local char
  local fg bg

  if [[ "${__PS1_EXIT_CODE}" = "0" ]]; then
    if [[ "$__PS1_EXIT_CODE_SHOW_SIGNAL_DESC" == "true" ]]; then
      exit_code_sig_txt="OK"
    fi
    __PS1_EXIT_CODE_FG_COLOR=$__PS1_EXIT_CODE_FG_COLOR_OK
    __PS1_EXIT_CODE_BG_COLOR=$__PS1_EXIT_CODE_BG_COLOR_OK
    char=$__PS1_EXIT_CODE_OK_CHAR
  else
    local exit_code_sig=$((__PS1_EXIT_CODE - 128))
    if [[ exit_code_sig -gt 0 ]] && [[ exit_code_sig -lt ${#__PS1_EXIT_CODE_SIGNAL_TEXT[@]} ]]; then
      if [[ "$__PS1_EXIT_CODE_SHOW_SIGNAL_DESC" == "true" ]]; then
        exit_code_sig_txt=${__PS1_EXIT_CODE_SIGNAL_TEXT[$exit_code_sig]}
      fi
      __PS1_EXIT_CODE_FG_COLOR=$__PS1_EXIT_CODE_FG_COLOR_SIGNAL
      __PS1_EXIT_CODE_BG_COLOR=$__PS1_EXIT_CODE_BG_COLOR_SIGNAL
      char=$__PS1_EXIT_CODE_SIGNAL_CHAR
    else
      exit_code_sig_txt=$__PS1_EXIT_CODE
      __PS1_EXIT_CODE_FG_COLOR=$__PS1_EXIT_CODE_FG_COLOR_ERROR
      __PS1_EXIT_CODE_BG_COLOR=$__PS1_EXIT_CODE_BG_COLOR_ERROR
      char=$__PS1_EXIT_CODE_ERROR_CHAR
    fi
  fi

  __PS1_PROMPT_STR=''
  if [[ "$__PS1_EXIT_CODE_MODE" = "char" ]]; then
    __PS1_PROMPT_STR="$char"
  fi

  if [[ "$__PS1_EXIT_CODE_MODE" = "desc" ]]; then
    __PS1_PROMPT_STR="$exit_code_sig_txt"
  fi

  if [[ "$__PS1_EXIT_CODE_MODE" = "full" ]]; then
      __PS1_PROMPT_STR="$char $exit_code_sig_txt"
    fi

}

function __PS1_ROOT_IND_PROMPT {
  if [[ $(id -u) -eq 0 ]]; then
    __PS1_PROMPT_STR='#'
  else
    __PS1_PROMPT_STR='$'
  fi
}

function __PS1_TIMER_START {
  __PS1_TIMER=${__PS1_TIMER:-$(date +%s.%N)}
}

function __PS1_TIMER_PROMPT {
  local -r now=$(date +%s.%N)
  local -r elapsed=$(awk "BEGIN {printf \"%.3f\",$now-$__PS1_TIMER}")
  unset __PS1_TIMER

  local T=${elapsed%.*}
  local F=${elapsed##*.}
  local D=$((T/60/60/24))
  local H=$((T/60/60%24))
  local M=$((T/60%60))
  local S=$((T%60))

  local timer
  [[ $D -gt 0 ]] && timer=${timer}$(printf '%dd ' $D)
  [[ $H -gt 0 ]] && timer=${timer}$(printf '%dh ' $H)
  [[ $M -gt 0 ]] && timer=${timer}$(printf '%dm ' $M)
  timer=${timer}$(printf "%d.${F}s" $S)

  __PS1_PROMPT_STR="$timer"
}

function __PS1_RESET_COLOR {
  echo '\[\e[m\]'
}

function __PS1_FG_COLOR {
  [[ "x$1" != "x" ]] && echo '\[\e[38;5;'"$1"'m\]'
}

function __PS1_BG_COLOR {
  [[ "x$1" != "x" ]] && echo '\[\e[48;5;'"$1"'m\]'
}

function __ps1_eval {
  eval "echo \$__PS1_$1_$2"
}

function __ps1_eval_colors {
  local -r fg=$(__ps1_eval "$1" "FG_COLOR")
  local -r bg=$(__ps1_eval "$1" "BG_COLOR")
  echo "$(__PS1_BG_COLOR "$bg")$(__PS1_FG_COLOR "$fg")"
}

function __ps1_eval_colors_separator {
  local -r bgn=$(__ps1_eval "$2" "BG_COLOR")
  local -r bg=$(__ps1_eval "$1" "BG_COLOR")
  local -r isLast=$3
  if [[ "$isLast" = "true" ]]; then
    echo "$(__PS1_FG_COLOR "$bg")"
  else
    echo "$(__PS1_BG_COLOR "$bgn")$(__PS1_FG_COLOR "$bg")"
  fi
}

function __ps1_eval_prefix {
  local -r pre=$(__ps1_eval "$1" "PROMPT_PREFIX")
  echo "$pre"
}

function __ps1_eval_suffix {
  local -r suf=$(__ps1_eval "$1" "PROMPT_SUFFIX")
  echo "$suf"
}

function __ps1_eval_exec_colors_func {
  if __ps1_is_color_func_exists "$1"; then
    local colors
    IFS=',' read -ra colors <<< "$(__PS1_"${1}"_COLORS)"
    echo "$(__PS1_BG_COLOR "${colors[0]}")$(__PS1_FG_COLOR "${colors[1]}")"
    return 0
  fi
  return 1
}

function __PS1_PROMPT {
  __PS1_EXIT_CODE=$?

  local prompt=''
  local prefix suffix col col_rev p isLast
  for i in "${!__PS1_PROMPT_LIST[@]}"; do
    p=${__PS1_PROMPT_LIST[$i]}
    __PS1_"${p}"_PROMPT

    prefix=$(__ps1_eval_prefix "$p")
    suffix=$(__ps1_eval_suffix "$p")

    col=$(__ps1_eval_colors "$p")

    if [[ "${__PS1_ENABLE_SEPARATORS}" = "true" ]]  && [[ $i -ne 0 ]]; then
      col_rev=$(__ps1_eval_colors_separator "$pn" "$p" "false")
      prompt+="$(__PS1_RESET_COLOR)$col_rev$__PS1_RIGHT_SEPARATOR"
      prompt+="$(__PS1_RESET_COLOR)"
    fi

    if [[ "${__PS1_ENABLE_MULTILINE}" = "true" ]] && [[ $i -eq 0 ]]; then
      prompt+="$(__PS1_RESET_COLOR)$__PS1_MULTILINE_CHAR1"
    fi

    prompt+="$(__PS1_RESET_COLOR)$col $prefix$__PS1_PROMPT_STR$suffix "

    pn=${__PS1_PROMPT_LIST[$i]}
  done

  if [[ "${__PS1_ENABLE_SEPARATORS}" = "true" ]]; then
    col_rev=$(__ps1_eval_colors_separator "$pn" "$p" "true")
    prompt+="$(__PS1_RESET_COLOR)$col_rev$__PS1_RIGHT_SEPARATOR"
    prompt+="$(__PS1_RESET_COLOR)"
  fi

  if [[ "${__PS1_ENABLE_MULTILINE}" = "true" ]]; then
    prompt+="$(__PS1_RESET_COLOR)\n$__PS1_MULTILINE_CHAR2"
  fi

  prompt+="$(__PS1_RESET_COLOR)"

  PS1="$prompt "
  export PS1
}

trap '__PS1_TIMER_START' DEBUG
PROMPT_COMMAND="__PS1_PROMPT"
export PROMPT_COMMAND

