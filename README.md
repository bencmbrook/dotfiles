# Terminal Config

## Installation

### Requirements

- zsh shell (comes stock on Mac)
- homebrew

### `.zshrc`:

Clone this repo into `~/Code.noindex` and run the install script:

```
git clone https://github.com/transcend-io/zshrc.git ~/Code.noindex/zshrc
bash ~/Code.noindex/zshrc/install.sh
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

Get startup time:

```
/usr/bin/time /bin/zsh -i -c exit
```

Profile startup time:

```
zprof
```
