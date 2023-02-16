alias bootstrap='$HOME/.yadm/bootstrap'
alias brewdump='brew bundle dump --force --global'
alias ap='aws-profile'
alias c='zz'
alias cdp='cdproject'
alias cat='bat -np --paging=never --theme base16'
alias diff='icdiff -N'
alias dmesg='sudo dmesg'
alias helm2='/usr/local/opt/helm@2/bin/helm'
alias htop='sudo htop'
alias ls='exa'
alias l='ls'
alias rg='rg -i'
alias t='true'
alias tf='terraform'
alias tree='exa --tree'
alias ym='yadm'
alias zreload='exec $SHELL -l'

#Ansible
alias go-to-ansible='source cd ~/ansible/utils && source venv-init.sh && cd .. && export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES'
alias workoff='deactivate'

#Terraform repos
alias go-tf-prod-net='cd ~/terraform/A05/tf-a05-networking'
alias go-tf-prod-db='cd ~/terraform/A05/tf-a05-db'
alias go-tf-prod-iam='cd ~/terraform/A05/tf-a05-iam'
alias go-tf-prod-shared='cd ~/terraform/A05/tf-a05-shared'
alias go-tf-dev-shared='cd ~/terraform/A06/tf-a06-shared && export AWS_PROFILE=a06-admin'
alias go-tf-dev-iam='cd ~/terraform/A06/tf-a06-iam && export AWS_PROFILE=a06-admin'
alias go-tf-dev-modules='cd ~/terraform/A06/tf-modules && export AWS_PROFILE=a06-admin'

#vault
alias vault-login='export VAULT_TOKEN=`vault login -token-only -method=ldap -address="https://vault.a05.4finance.net/" username=andris.eizenbergs`'
alias vault-read-a06='vault read -address="https://vault.a05.4finance.net/" aws-a06/creds/administrator'
alias vault-lease='vault lease renew -address="https://vault.a05.4finance.net/" -increment=634800'

# Helm
alias h='helm'
alias hdu='h dep up'
alias hrl='h repo list'
alias hid='h install --debug --dry-run'

# Kubectl
alias kctx='kubectx'
alias kns='kubens'
alias kx='kctx'
alias kn='kns'
alias kgjs='k get jobs'

if command -v nvim > /dev/null 2>&1; then
  alias vim='nvim'
  alias vi='nvim'
  alias vimdiff='nvim -d'
fi

# unalias sl
