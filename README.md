# homebrew-tap

Homebrew formulae for [ken109](https://github.com/ken109)'s tools.

```sh
brew install ken109/tap/sennit
brew install ken109/tap/r2-lfs
```

## Formulae

| | |
|---|---|
| [sennit](https://github.com/ken109/sennit) | A dotfiles manager that keeps symlink semantics, and adds templating and drift detection |
| [r2-lfs](https://github.com/ken109/r2-lfs) | A Git LFS server on Cloudflare Workers and R2, with a CLI to manage LFS objects (installs from npm, depends on `node`) |

## Releasing a new version

```sh
./bump.sh 0.3.2      # sennit: fetches the checksums and rewrites the formula
git commit -am "bump(sennit): 0.3.2"
git push
brew update && brew upgrade sennit
```

```sh
./bump-r2-lfs.sh 0.5.1   # r2-lfs: hashes the npm tarball and rewrites the formula
git commit -am "bump(r2-lfs): 0.5.1"
git push
brew update && brew upgrade r2-lfs
```

**Do not edit the formula inside `/opt/homebrew/Library/Taps/ken109/homebrew-tap`.**
That directory is a git clone Homebrew maintains; a local edit there makes the next
`brew update` fail with a merge conflict and leaves the tap unusable until it is reset
with `git reset --hard origin/master`. Always edit this repository and push.
