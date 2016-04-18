# rails-movies

### Git process

#### Standards

* The master branch must contain only deployable commits.
* The commit messages on the master branch must be descriptive. They represent the change log and
serve as the developer documentation for the evolution of the app.
* Commit messages to master should use the imperative tense ("Add the feature", "Fix the bug",
"Update the library")
* Merges to master should be fast-forward only. Changes made in master should be re-integrated with
branches by rebasing before merging.

##### References

* [A Note about Commit Messages](http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html)

#### Workflow

* Check out a feature branch from master (`git checkout -b feature/name`)
* Frequently push commits to origin repo while working (`git push origin feature/name`)
* Reintegrate changes from master into your branch by rebasing (`git rebase master`)
* Squash commits into logical, deployable units of work (`git rebase -i HEAD~n` where n = number of commits you made)
* Submit a Pull Request, making sure that you are up to date with the latest code in master
* Make any needed changes and push again (`git commit --amend`, `git push -f`)
* Checkout master branch to prepare for merge ('git checkout master')
* Merge your branch into master by fast-forwarding (`git merge --ff-only feature/name`)
* Push your merged changes ('git push')
* Delete your feature branch (`git branch -d feature/name`, `git push origin :feature/name`)

#### Configuration

Add the following settings to your Git configuration for this project:

```bash
git config branch.autosetuprebase always
git config core.autocrlf input
```

For any branches that you created before adding the previous config, run this command:

```bash
git config branch.<branchname>.rebase true
```