# ivim - An easy & highly customizable vim configuration 

### Automatic Installation (*nix only)

**via 'curl'**

```bash
bash <(curl -L https://raw.githubusercontent.com/huxinbang/ivim/master/setup.sh) -i
```

**via 'wget'**

```bash
bash <(wget --no-check-certificate https://raw.githubusercontent.com/huxinbang/ivim/master/setup.sh -O -) -i
```

## Updating

```bash
bash $HOME/ivim/setup.sh -n
```

## Configuration

There are some options you could set through `.vimrc` to configure ivim:
* g:ivim_user -- your username
* g:ivim_email -- your email
* g:ivim_github -- your github
* g:ivim_fancy_font -- using fancy font or not
* g:ivim_show_number -- showing number or not
* g:ivim_bundle_groups -- plugin groups

*This distribution is completely customisable using a `~/.vimrc.local`, `~/.gvimrc.local` and `~/.vimrc.bundles.local`!*

