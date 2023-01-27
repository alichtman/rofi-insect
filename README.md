# rofi-insect

[insect](https://github.com/sharkdp/insect) plugin for [`rofi`](https://github.com/davatorium/rofi) / `dmenu`. This is an analog of [macOS Spotlight calculator functions](https://macandegg.com/2020/12/use-macos-spotlight-search-as-calculator/) for Linux.

https://user-images.githubusercontent.com/20600565/215080362-7c188e15-2d56-421d-abec-9bf88b44df60.mp4

> **Note**
> Watch the demo in full screen for much better quality.

## Usage

`insect` is used as the calculator back-end. You can pass any operation `insect` can handle.

## Recommended Installation + Configuration

I integrate this with [`rofi-bangs.sh`](https://github.com/gotbletu/shownotes/blob/master/rofi-scripts-collection/rofi-bangs.sh).

```bash
## ~/.config/rofi/scripts/rofi-bangs.sh
...

# Use calculator (insect)
COMMANDS["calc"]="$XDG_CONFIG_HOME/rofi/scripts/rofi-insect/rofi-insect.sh"
LABELS["calc"]=""
```

And I have `rofi-bangs` integrated with [`sxhkd`](https://github.com/baskerville/sxhkd).

```bash
## ~/.config/sxhkd/sxhkdrc
...
alt + @m
        ~/.config/rofi/scripts/rofi-bangs.sh
```

I press `Alt + m` on my keyboard, and get the `rofi-bangs` popup. I can then enter `calc` mode.

If you want faster access to the calculator, you can add an entry in your `sxhkdrc` like:

```bash
alt + 7
    $XDG_CONFIG_HOME/rofi/scripts/rofi-insect/rofi-insect.sh
```

## Dependencies

1. `insect`
2. `xsel`
3. `rofi` or `dmenu`
