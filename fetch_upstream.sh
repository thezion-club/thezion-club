git fetch upstream/master
git rebase -i upstream/master
git tag -d tag v0.1.3 v0.1.4 v0.1.5 v0.1.6 v0.1.7 v0.1.8 v0.1.9
git push origin --delete tag  v0.1.3 tag v0.1.4 tag v0.1.5 tag v0.1.6 tag v0.1.7 tag v0.1.8 tag v0.1.9
