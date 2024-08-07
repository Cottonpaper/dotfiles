<p align="center"><b>DOTFILES</b></p>
<p align="center"><sup>by <i>Cottonpaper</sup></i></p>

## QUICKSTART

Start by cloning the repo into your home directory:

```
cd ~
git clone https://github.com/Cottonpaper/dotfiles .dotfiles
```
Run [packages.sh](scripts/packages.sh) to install everything required for configs in [package.list](packages.list):
```
cd .dotfiles
./scripts/packages.sh
```
Then run ```cd ~/.dotfiles | stow .``` to generate symlinks in the target directory (in this case your home folder) that points to each file in your package directory ( in this case .dotfiles ). For more help with Stow look at the [Documentation](https://www.gnu.org/software/stow/manual/stow.html).
