# Bingwa wa Ufundi

A [Guix channel](https://guix.gnu.org/en/manual/en/html_node/Channels.html#Channels).

## Usage

### Without Subscribing

Clone this repository and load its modules using Guix's [load-path](https://guix.gnu.org/manual/en/html_node/Package-Modules.html).

For example, to install `flipped-cat`, you could do the following:

``` shell
git clone https://github.com/nairobilug/bingwa-wa-ufundi.git
cd bingwa-wa-ufundi
guix install -L . flipped-cat
```

### Subscribing

Add this channel to your list of guix channels located at `$HOME/.config/guix/channels.scm`.

``` scheme
(append
 (list
  (channel
   (name 'bingwa-wa-ufundi)
   (url "https://github.com/nairobilug/bingwa-wa-ufundi")
   (introduction
    (make-channel-introduction
     "7c67c3a9f299517bfc4ce8235628657898dd26b2"
     (openpgp-fingerprint
      "CD2D 5EAA A98C CB37 DA91  D6B0 5F58 1664 7F8B E551")))))
 %default-channels)
```

Run `guix pull` to sync the channel's modules with your store.

### Attribution

This repository forked from [Guixmart](https://git.sr.ht/~whereiseveryone/guixmart)
