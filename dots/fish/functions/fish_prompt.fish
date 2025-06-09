function fish_prompt
    echo -n (set_color 00ffcf)(prompt_pwd)' '
    if fish_is_root_user
        echo -n (set_color 8860ff)'FORCE '
    else
        echo -n (set_color 00adff)'ORDER '
    end
    echo -n (set_color ffffff)'> '
    set_color normal
end
