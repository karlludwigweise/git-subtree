# git-subtree

This is a GitHub Action to make use of `git subtree` commands. It works around GitHub Action magic to enable adding and pulling subtrees from other repositories.

## How to use it

1. Create a [Personal Access Token (PAT)](https://github.com/settings/tokens).
2. Add your PAT to your repos actions secrets.
   - Find it at _Your Repo > Settings > Secrets and variables > Actions_ OR modify this URL accordingly and open it: `https://github.com/{user-or-org}/{repo}/settings/secrets/actions`
   - This doc uses `PAT` as a name
3. Add this action to your workflow

```yaml
# .github/workflows/update.yml

name: "update subtree"
on:
  push:
  workflow_dispatch:

jobs:
  update-lib:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0
      - uses: karlludwigweise/git-subtree
        with:
          pat: ${{ secrets.PAT }}
          repo: https://github.com/{user}/{repo}.git
          action: pull
          prefix: my-dir
          message: Custom Commit Message
      - name: push
        run: git push
```

## Parameters

| Input     | Description                                        | Required | Default            |
| --------- | -------------------------------------------------- | -------- | ------------------ |
| pat       | GitHub Persoanl Access Token                       | true     |                    |
| git_name  | Git User Name                                      |          | GitHub Actions     |
| git_email | Git User Email                                     |          | actions@github.com |
| repo      | Repository to add/pull (only https path supported) | true     |                    |
| action    | Action (add/ pull)                                 | true     |                    |
| position  | Branch Name or Commit Sha                          |          | main               |
| prefix    | Path to put subtree in repo                        | true     |                    |
| squash    | Should the subtree merge be sqashed                |          | true               |
| message   | Message (depending on command)                     |          | Subtree Action     |
