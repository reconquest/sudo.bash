_sudo_default_options=(-n)

sudo() {
    {
        printf "\e[1;31m{sudo} $ %s\e[0m\n" "$1"
        printf "\e[1;31m       .  %s\e[0m\n" "${@:2}"
    } | :sudo:indent

    sudo:silent "${@}"
}

sudo:silent() {
    command sudo ${_sudo_default_options[@]} "${@}"
}

:sudo:indent() {
    sed -ur \
        -e 's/^/    /' \
        -e '1i\ ' \
        -e '$a\ ' >&2
}
