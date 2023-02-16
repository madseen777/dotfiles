#!/usr/bin/env zsh

aws-profile() {
    case ${1} in
        "" | clear)
            export AWS_PROFILE=""
            ;;
        *)
            export AWS_PROFILE="${1}"
            ;;
    esac
}

kpst() {
  if ( $SPACESHIP_KUBECONTEXT_SHOW ); then
    export SPACESHIP_KUBECONTEXT_SHOW=false
  else
    export SPACESHIP_KUBECONTEXT_SHOW=true
  fi
}

weather() {
  curl "http://wttr.in/$1"
}

myip() {
  curl "ifconfig.co"
}

zbench() {
  for i in $(seq 1 10); do
    /usr/bin/time /usr/local/bin/zsh -i -c exit
  done
}

pyenv-brew-relink() {
  rm -f "$HOME/.pyenv/versions/*-brew"

  for i in $(brew --cellar python)/*; do
    ln -s --force $i $HOME/.pyenv/versions/${i##/*/}-brew;
  done

  for i in $(brew --cellar python@2)/*; do
    ln -s --force $i $HOME/.pyenv/versions/${i##/*/}-brew;
  done
}

direnv() { asdf exec direnv "$@"; }

ecd() {
  fasdlist=$( fasd -d -l -r $1 | \
    fzf --query="$1 " --select-1 --exit-0 --height=25% --reverse --tac --no-sort --cycle) &&
    cd "$fasdlist"
}

#Jenkins info
awsinfo () { aws ec2 describe-instances --filters "Name=tag:Name,Values=jenkins-pipeline3-worker-standard" --query 'Reservations[*].Instances[*].{"InstanceId":InstanceId,"PrivateIP":PrivateIpAddress,"State":State.Name}' }
export06 () { export $(vault read aws-a06/creds/administrator -format=json | jq -r '"AWS_ACCESS_KEY_ID=" + .data.access_key +" " + "AWS_SECRET_ACCESS_KEY=" + .data.secret_key + " " + "VAULT_LEASE_ID=" + .lease_id') }
export-test () { export $(vault read aws-test/creds/administrator -format=json | jq -r '"AWS_ACCESS_KEY_ID=" + .data.access_key +" " + "AWS_SECRET_ACCESS_KEY=" + .data.secret_key + " " + "VAULT_LEASE_ID=" + .lease_id') }
loginjenkins () { ssh -i .ssh/a06-jenkins-shared.pem root@"$@"; }


#Login
login05 () { ssh -i .ssh/a05-devops-shared.pem centos@"$@"; }
login06 () { ssh -i .ssh/a06-devops-shared.pem centos@"$@"; }