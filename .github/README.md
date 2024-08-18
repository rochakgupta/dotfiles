# dotfiles

Configurations managed via [yadm](https://yadm.io).

## Tools

### Required

#### Via [Homebrew](https://brew.sh/)

```bash
brew bundle install --file=~/.config/homebrew/Brewfile
```

#### Via App Store

- [Amphetamine](https://apps.apple.com/us/app/amphetamine/id937984704?mt=12)
- [Bitwarden](https://bitwarden.com) (Installable via Homebrew but App Store preferred for browser integration)
- [HACK](https://apps.apple.com/us/app/hack-for-hacker-news-developer/id1464477788)

#### Via Installer

- [Authy](https://authy.com)
- [Dropbox](https://dropbox.com)

### Optional

- [Docker](https://docker.com)
- [Dropover](https://dropoverapp.com)
- [Dropzone](https://aptonic.com)
- [Github Desktop](https://desktop.github.com)
- [Hammerspoon](https://hammerspoon.org)
- [Karabiner Elements](https://karabiner-elements.pqrs.org)
- [Keyboard Maestro](https://keyboardmaestro.com)
- [Later](https://getlater.app)
- [Mission Control Plus](https://fadel.io/missioncontrolplus) (Purchased)
- [MonitorControl](https://github.com/MonitorControl/MonitorControl)
- [Pocket](https://getpocket.com)
- [PopClip](https://pilotmoon.com/popclip)
- [QuickShade](https://apps.apple.com/us/app/quickshade/id931571202?mt=12)
- [Rectangle](https://rectangleapp.com)
- [Shortcat](https://shortcat.app)
- [SideNotes](https://apptorium.com/sidenotes) (Purchased)
- [Vagrant](https://vagrantup.com)
- [Vimac](https://vimacapp.com)
- [VirtualBox](https://virtualbox.org)

#### Via Homebrew

##### Check support

```bash
brew search <term>
```

##### Install

###### Formula

```bash
brew install <formula>
```

###### Cask

```bash
brew install --cask <cask>
```

##### Update Brewfile

```bash
cd ~/.config/homebrew && brew bundle dump --all --force
```

Review changes and push.

#### Via App Store

Fallback to App Store if installation is not supported via Homebrew.

#### Via Installer

Fallback to installer if installation is not supported via Homebrew and App Store.
