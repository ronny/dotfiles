function fish_title
    # this one sets the X terminal window title
    # argv[1] has the full command line
    echo -n $USER@$hostname:(prompt_pwd) $argv[1]
end
