# Terminal Config

## Installation

### Requirements

- zsh shell (comes stock on Mac)
- Install [starship.rs](https://starship.rs/)
- Install [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)

### `.zshrc`:

Clone this repo into `~/Code.noindex` and change the content of `~/.zshrc` to point to this:

```
source ~/Code.noindex/zshrc/.zshrc
```

### `starship.toml`

[`.zshrc`](./.zshrc) already points to `~/Code.noindex/zshrc/starship.toml` so this should work out of the box.

## Info

- zsh comes stock on Macs

~/.zshrc

- https://github.com/ohmyzsh/ohmyzsh

~/.config/starship.toml

- https://starship.rs/

## Startup time profiling

get startup time

```
/usr/bin/time /bin/zsh -i -c exit
```

profile startup time

```
zprof > zshtiming.txt
```
