# trace input events

    sudo libinput list-devices
    sudo libinput debug-events

# evdev device nodes location

    /dev/input/event*

# resize logical volume to claim the whole drive

    vgs
    sudo lvresize -l 100%FREE --resizefs /dev/mapper/fedora-root

# create service and add to default zone

    sudo firewall-cmd --permanent --new-service=postgres
    sudo firewall-cmd --permanent --service=postgres --set-description 'Postgres'
    sudo firewall-cmd --permanent --service=postgres --add-port 5432/tcp
    sudo firewall-cmd --permanent --add-service postgres
