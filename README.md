# Terminal Config

## Installation

### Requirements

- zsh shell (comes stock on Mac)
- Install [starship.rs](https://starship.rs/) with homebrew
  - Install homebrew first

### Updating

- Update [antigen](https://github.com/zsh-users/antigen) by rerunning install script and overwriting this [antigen.zsh](./antigen.zsh)

### `.zshrc`:

Clone this repo into `~/Code.noindex` and change the content of `~/.zshrc` to point to this:

```
source ~/Code.noindex/zshrc/.zshrc
```

_If using a different folder, change `ZSHRC_FOLDER` in [`.zshrc`](./.zshrc)._

### `starship.toml`

[`.zshrc`](./.zshrc) already points to `~/Code.noindex/zshrc/starship.toml` so this should work out of the box.

## Info

- zsh comes stock on Macs

~/.zshrc

- https://github.com/ohmyzsh/ohmyzsh

~/.config/starship.toml

- https://starship.rs/

## Startup time profiling

Get startup time:

```
/usr/bin/time /bin/zsh -i -c exit
```

Profile startup time:

```
zprof
```
