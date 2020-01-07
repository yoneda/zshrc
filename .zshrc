
# pyenvのためにパスを追加
export PATH=~/.pyenv/shims:$PATH
# phpbrewのためにスクリプトを実行
# source ~/.phpbrew/bashrc

# rbenvのために追加
eval "$(rbenv init -)"

# nodebrewのためにパスを追加
export PATH=~/.nodebrew/current/bin:$PATH

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
