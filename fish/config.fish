if status is-interactive
    # Commands to run in interactive sessions can go here
    function fcd     
        cd $(find . \( \
        -name ".git" -o \
        -name ".dotnet" -o \
        -name "debug" -o \
        -name "bin" -o \
        -name "obj" -o \
        -name ".idea" -o \
        -name ".fleet" -o \
        -name "node_modules" -o \
        -name "volumes" -o \
        -name ".terraform" -o \
        -name "Library" -o \
        -name "Pictures" -o \
        -name "Documents" -o \
        -name ".local" -o \
        -name ".nuget" -o \
        -name ".npm" -o \
        -name ".vscode" -o \
        -name ".rustup" -o \
        -name ".cargo" -o \
        -name ".quokka" -o \
        -name ".vscode-insiders" \
        \) -prune -false -o -type d -print | fzf --layout reverse --border)
    end

    abbr -a cp cp --verbose
    abbr -a mv mv --verbose
    abbr -a f fcd
    abbr -a bs sudo brightnessctl set
    abbr -a bl bluetoothctl
    abbr -a nv nvim .
    abbr -a l ls 
    abbr -a cl clear 
    abbr -a py python 
    abbr -a erm cd $HOME/repos/almosheriff/
    abbr -a gta git add .
    abbr --set-cursor -a gtc git commit -m \'%\'
    abbr -a rsynctooci rsync -Pavz -e "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" --progress ubuntu@146.235.58.149:/home/ubuntu/


    status --is-interactive; and rbenv init - fish | source
end
