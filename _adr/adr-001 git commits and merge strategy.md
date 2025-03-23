# ADR 1: Git Commits and Merge Strategy
## CONTEXT
Two problems to solve.

First problem: I want to reference the relevant GitHub issue in a given git commit. This can be done in a few ways, but most of them involve closing the issue. From the commit, the options seem to be either `#xx` or `gh-xx` (where `xx` is the GitHub issue number).

The problem with using `#xx`, however, is that any line in a commit beginning with `#` is ignored. I could wrap the number in brackets, e.g. `[#xx]`. The other problem with this notation, though, is that it's what GitHub uses to reference pull requests.

So the `gh-xx` solution is uglier, but I think it's better overall.

Second problem: I want to develop on feature branches that are merged regularly with main. This is easy enough to do from a pull request. When I merge the PR into main, if I don't squash the commit(s), I'll have an extra "merge" commit in main.

I want to consider either squashing or rebasing as my default strategy.

## DECISION
I will title git commits as `gh-xx Title...` where `xx` is the GiHub issue number.

I will use rebase as my default merge strategy for pull requests.

## IMPACT
We'll have to see if rebase works for this application. If not, we may want to try squashing commits, or just dealing with the extra merge commit (maybe letting it keep it's ugly default name).