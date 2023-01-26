function gcp_prompt_info() {
  # dont show 'default' workspace in home dir
  [[ "$PWD" != ~ ]] || return
  # check if in terraform dir and file exists
  [[ -d .terraform && -r .terraform/environment ]] || return

  local workspace="$(< .terraform/environment)"
  echo "${ZSH_THEME_TF_PROMPT_PREFIX-[}${workspace:gs/%/%%}${ZSH_THEME_TF_PROMPT_SUFFIX-]}"
}

alias gcp-list='gcloud projects list'
alias gcp-confs='gcloud config configurations list'
alias gcp-activate='gcloud config configurations activate'

# Secrets
alias gcs-list='gcloud secrets versions access latest'

# Container
alias gccl='gcloud container clusters list'
alias gsvl='gcloud secrets versions list'

if (( $+commands[terraform] )); then
  autoload -U +X bashcompinit && bashcompinit
  complete -o nospace -C gcloud gcloud
fi