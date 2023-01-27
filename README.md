# rofi-insect

[insect](https://github.com/sharkdp/insect) plugin for [`rofi`](https://github.com/davatorium/rofi) / `dmenu`

https://user-images.githubusercontent.com/20600565/215080362-7c188e15-2d56-421d-abec-9bf88b44df60.mp4

> **Note**
> Watch the demo in full screen for much better quality.

## Usage

`insect` is used as the calculator back-end. You can pass any operation `insect` can handle.

## Installation + Configuration

I integrate this with [`rofi-bangs.sh`](https://github.com/gotbletu/shownotes/blob/master/rofi-scripts-collection/rofi-bangs.sh).

```bash
## ~/.config/rofi/scripts/rofi-bangs.sh
...
# Use calculator (insect)
COMMANDS["calc"]="/home/alichtman/.config/rofi/scripts/rofi-insect/rofi-insect.sh"
LABELS["calc"]=""
```

And I have `rofi-bangs` integrated with [`sxhkd`](https://github.com/baskerville/sxhkd).

```
## ~/.config/sxhkd/sxhkdrc
...
alt + @m
        ~/.config/rofi/scripts/rofi-bangs.sh
```

I press `Alt + m` on my keyboard, and get the `rofi-bangs` popup. I can then enter `calc` mode.

## Dependencies

1. `insect`
2. `xsel`
3. `rofi` or `dmenu`
