# harpend

This is my father's home page, written with Hakyll.

# Installing

You first will need `git`, `ghc`, `alex`, `happy`, `cabal-install`, and `sass`.

* Install `git`, `ghc`, `ruby`, and `cabal-install` through your distribution's
package manager.
* Install the rest of the Haskell platform with `cabal`
```
cabal update
cabal install alex happy
```
* Install `sass` with `gem`
```
gem install sass
```
* Clone the project
```
git clone https://github.com/pharpend/harpend.git
cd harpend
```
* Install some more Haskell stuff
```
cabal install bytestring hakyll pandoc
```

