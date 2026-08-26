# homebrew-tap

Homebrew formulae for [ken109](https://github.com/ken109)'s tools.

```sh
brew install ken109/tap/sennit
```

## Formulae

| | |
|---|---|
| [sennit](https://github.com/ken109/sennit) | A dotfiles manager that keeps symlink semantics, and adds templating and drift detection |

## Releasing a new version

```sh
./bump.sh 0.3.2      # fetches the checksums and rewrites the formula
git commit -am "bump(sennit): 0.3.2"
git push
brew update && brew upgrade sennit
```

**Do not edit the formula inside `/opt/homebrew/Library/Taps/ken109/homebrew-tap`.**
That directory is a git clone Homebrew maintains; a local edit there makes the next
`brew update` fail with a merge conflict and leaves the tap unusable until it is reset
with `git reset --hard origin/master`. Always edit this repository and push.
