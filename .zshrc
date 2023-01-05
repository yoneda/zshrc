
# pyenvのためにパスを追加
export PATH=~/.pyenv/shims:$PATH
# phpbrewのためにスクリプトを実行
# source ~/.phpbrew/bashrc

# laravelのためにパスを通す
export PATH=~/.composer/vendor/bin:$PATH

# rbenvのために追加
eval "$(rbenv init -)"

# nodebrewのためにパスを追加
export PATH=~/.nodebrew/current/bin:$PATH

# npmのパスが通ってない問題を解決(v16.0.0)
# export PATH=$HOME/.nodebrew/node/v16.0.0/bin:$PATH

# Goのために追加
export GOPATH=${HOME}/go
export PATH=$GOPATH/bin:$PATH

# macOS Monterey からPython2.7が削除されたため、pythonコマンドでPython3が起動するようaliasを設定
alias python='python3'
alias pip='pip3'

# git add commit push を同時にやる
# function hoge() とやることで、エイリアスの代わりになり、
# どの階層でhoge と入力してもこの関数が呼ばれる。不思議だ。
function lazygit(){
	git add .
	git commit -a -m "$1"
	git push
}

# git add commit を同時にやる
function easygit(){
	git add .
	git commit -a -m "$1"
}

# 補完の機能を追加
# ファイル名を途中まで入力してtabを押すと補完してくれるのはデフォルトでできる。
# compinitは、コマンドの引数まで補完してくれる！
# [git a]まで入力してtabを押すと[git add]に補完してくれる。

autoload -Uz compinit
compinit

# プロンプトをカスタマイズ
# というシンプルなもの
# PROMPT='%n$ '

# エイリアスを追加
# alias ghcreate='python /Users/yoneda/softwares/ghcreate/new.py'
alias scripts='open -a "Google Chrome" ~/scripts/'
alias appdata='open ~/Library/Application\ Support/'

# sublime text に関するコマンド
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

# java8を利用したい場合
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

# cpコマンドで隠しファイルも含めてコピーできるように
setopt GLOB_DOTS

# タブのタイトルにカレントディレクトリのフォルダ名を表示しておく
precmd(){
	echo -ne "\e]1;${PWD:t}\a"
}

# git のブランチ名を表示
# 今どこのブランチにいるんだっけ…[git branch -a]することが多いので追加
# vcs_infoロード
autoload -Uz vcs_info
# PROMPT変数内で変数参照する
setopt prompt_subst
# vcsの表示
zstyle ':vcs_info:*' formats '[%F{green}%b%f]'
# プロンプト表示直前にvcs_info呼び出し
precmd() { vcs_info }
# プロンプト表示
PROMPT='%n${vcs_info_msg_0_}$ '

code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# homebrewで追加したphp8のために追加
export PATH="/opt/homebrew/opt/php@8.0/bin:$PATH"
export PATH="/opt/homebrew/opt/php@8.0/sbin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/php@8.0/lib"
export CPPFLAGS="-I/opt/homebrew/opt/php@8.0/include"
export PATH="~/.composer/vendor/bin:$PATH"


