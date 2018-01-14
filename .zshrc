
# パスの追加
# pyenvのため
export PATH=~/.pyenv/shims:$PATH

# 補完の機能を追加
# ファイル名を途中まで入力してtabを押すと補完してくれるのはデフォルトでできる。
# compinitは、コマンドの引数まで補完してくれる！
# [git a]まで入力してtabを押すと[git add]に補完してくれる。

autoload -Uz compinit
compinit

# プロンプトをカスタマイズ
# というシンプルなもの
PROMPT='%n$ '

# エイリアスを追加
alias ghcreate='python /Users/yoneda/program/git/ghcreate/new.py'
