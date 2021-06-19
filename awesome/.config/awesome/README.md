# Gruver - An AwesomeWM theme

Original Work - [PapyElGringo's Material Awesome](https://github.com/material-shell/material-awesome)

![2021-03-18_11-08](https://user-images.githubusercontent.com/74004229/111578600-71fda280-87da-11eb-8530-2b99a36bbfb8.png)

## My changes

-   Changed some icons for the tags.
-   Removed the WiFi thing 'cause it wasn't working for me.
-   Changed the colour scheme to gruvbox.
-   Changed some shortcuts.
-   Removed "Search Applications".
-   Removed full screen switch and left MSTAB tabbing as-is.

> PS: I don't know much lua so I changed what I understood.

## Dependencies

-   AwesomeWM
-   BlexMono Nerd Font Mono
-   Themes and Icons are your choice.

## Other suggested dependencies

-   playerctl
-   i3lock-color (default lock is set to this. Lock icon in the exit screen might not work if this isn't there.)
-   Xfce4 Power Manager (press the power button to toggle the power menu, since I removed the menu_button and hence the functionality it provides.)
-   Alacritty (the terminal is set to this, so the terminal might not open if this isn't there.)
-   Compositor (this is really a choice, if you want transparency and blur, you can enable it thorugh adding this to start.)
-   Rofi (since there kinda is no other way to launch apps.)
-   Any policy kit agent
-   LXAppearence (to change themes and cursors.)
-   xdotool (required for the minimize shortcut to work.)

## To change wallpaper

1. To change the wallpaper, navigate to "theme/default-theme.lua" and change the variable "theme.wallpaper" and add your wallpaper path there. This is if you want to have a single wallpaper. Use nitrogen or feh for slideshow stuff.
2. Instead of doing 1, you can create a "walps" directory in your Downloads folder and rename the picture you want as wallpaper to "current.jpg".

## To change the primary colour thing

Navigate to "theme/PapyElGringo-theme/init.lua" and change the variable theme.primary to one of the colours in the mat-colors.lua which is at "theme/mat-colors.lua". (Purple is not working for me.)

If you want to change the color to something of your own, add a color from mat-colors.lua and check which of the various colour hues in being of effect. For example, I set the primary as "teal" in which hue_500 is of effect. I change this colour to match my wallpaper.

## To change or create workspace icons or "tags"

1. Define a variable for the tag and give its location as the value. The file where you must do this is in "theme/icons/init.lua". You can either copy your icons to the folder ~/.config/awesome/theme/icons" (which makes defining the variable for your icon simpler) or keep them in your own path (in which case you have to define the whole path of the icon instead of just the name, which might lead to any errors).
2. Now, go to "configuration/tags/init.lua". Here, create a tag with the variable you created which should look like:

```lua
{
    icon = icons.code,
    type = 'code',
    defaultApp = 'alacritty',
    screen = 1
  },
```

> You can get these icons [here](https://material.io/resources/icons). Suggested to download 24dp SVGs.

## To autostart apps

Add the following code at the end of the rc.lua file which will be located at "rc.lua".

```lua
awful.spawn.with_shell('NAME_OF_THE_APP')
```

PS: My Rofi theme goes well with this. Check it out [here](https://github.com/sainivasmangu/dotfiles/tree/main/.config/rofi)

## Need help with this:

Remove icons from tags and replace with text.
