cd /home/quincy

# yazi thing
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# add rust installs to path
fish_add_path "$HOME/.cargo/bin"

if status is-interactive
    # abbrs
    abbr -a helix '/home/quincy/.cargo/bin/hx'
    abbr -a hx '/home/quincy/.cargo/bin/hx'
    abbr -a cd z
    abbr -a zz 'cd ..'
    abbr -a grep 'grep --color auto'
    abbr -a ls 'eza --icons --group-directories-first'
    abbr -a lsa 'eza la --icons --group-directories-first'
    abbr -a sl 'eza --icons --group-directories-first'
    abbr -a la 'eza -la --icons --group-directories-first'
    abbr -a clsa 'clear && eza -la --icons --group-directories-first'
    abbr -a clss 'clear && ls'
    abbr -a em '/usr/bin/emacs -nw'
    abbr -a emacs '/usr/bin/emacs -nw'
    abbr -a doom '~/.config/emacs/bin/doom'
    abbr -a confish 'hx ~/.config/fish/config.fish'
    abbr -a conz 'hx ~/.config/zellij/config.kdl'
    abbr -a r 'source ~/.config/fish/config.fish'
    abbr -a zj zellij
    abbr -a lg lazygit

    # git
    abbr -a g git
    abbr -a gs 'git status'
    abbr -a ga 'git add'
    abbr -a gaa 'git add --all'
    abbr -a gc 'git commit -v'
    abbr -a gcm 'git commit -m'
    abbr -a gcma 'git commit -v -am'
    abbr -a gca 'git commit --amend'
    abbr -a gp 'git push'
    abbr -a gl 'git pull'
    abbr -a gd 'git diff'
    abbr -a gds 'git diff --staged'

    # cargo
    abbr -a c cargo
    abbr -a cb 'cargo build'
    abbr -a cr 'cargo run'
    abbr -a ct 'cargo test'

    # bacon
    if type -q bacon
        abbr -a bw 'bacon watch'
        abbr -a br 'bacon run'
        abbr -a brl 'bacon run-long'
    end
end

set -gx LANG en_US.UTF-8
set -gx COLORTERM truecolor
set -gx EDITOR hx
set -gx VISUAL hx
set -gx TERMINAL_COMMAND hx

starship init fish | source
zoxide init fish | source
