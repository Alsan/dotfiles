# Garuda Sway-WM CheatSheet #

   = Super Key

# common operations
           Return      *term* (`kitty`)
           t           *term* (`kitty`)
           q           *quit* (kill focused window)
           p           *show activities*
           f2          *show app menu (i3 like)* (`wofi`)
    Shift  f2          *show app menu (mac like)* (`...`)
    Shift  e           *show power menu* (lock/suspend/logout/reboot/shutdown)
    Shift  c           *reload config files* (`sway reload`)
           f1          *lock screen* (`swaylock`)

# screenshot
            PnrintSrc   *full screenshot*
     Shift  PrintSrc    *screenshot options*

# application shortcuts
           d           *file manager* (`dolphin`)
           b           *browser* (`brave`)
           c           *vscode projects*
   Alt     c           *vscode*
           y           *clipboard restore*

# container layout
           z           *split horizontally* (on next open)
           v           *split vertically*   (on next open)
           s           *layout stacked*
           w           *layout tabbed*
           e           *toggle split* (?)
           f           *toggle fullscreen*
   Shift   u           *toggle tiling/floating mode*
           u           *toggle tiling/floating focus* (`focus mode_toggle`?)
           a           *focus parent container*

     left mouse button *move floating window*
    right mouse button *resize floating window*

# window focus and location
           Left        *focus left*
           Down        *focus down*
           Up          *focus up*
           Right       *focus right*
    Shift  Left        *move left*
    Shift  Down        *move down*
    Shift  Up          *move up*
    Shift  Right       *move right*

# window size
           r           *toggle resize mode*
            Left
            Down
            Up
            Right
       Return / Escape  *return to default mode*

# scratchpad
           Minus       *cycle scratchpad*
    Shift  Minus       *move scratchpad*

# workspaces
           1 .. 0      *switch to workspace 1 .. 10*
    Shift  1 .. 0      *move container to workspace 1 .. 10*

# multimedia keys
  - may not work for every keyboard
  - may need to hold down the function (`fn`) key

# notes
  - *Sway* is documented through man pages unlike i3.
    To get a overview of what to expect you can read `man 5 sway`.
    The pages are then spilt into topics - some the important ones
    are listed at the bottom of the document.
  - *Waybar* is also documented through man pages - `man 5 waybar`.

  - User configuration files are in `~/.config/`.
  - Sway configuration files are in `~/.config/sway/config.d/`.
    `~/.config/sway/config` only includes the files in `config.d`.
    The file structure is spilt for easier use, where filenames refer
    to the part they play - for example `output` for output devices.
  - Similarly, Waybar configuration is in `~/.config/waybar`.
