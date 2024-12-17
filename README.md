# Sync Specific Branches to Target Git Repository

This GitHub Action synchronizes specific branches and tags to a target Git repository, supporting both public and self-hosted GitLab.

## Inputs

| Input Name   | Description                                     | Required | Type | Example                                    |
| ------------ | ----------------------------------------------- | -------- | -------- | ------------------------------------------ |
| `username`   | Username for Git authentication                 | Yes      | Variable | `your_username`                            |
| `token`      | Token for Git authentication                    | Yes      | Secret | `your_personal_token`                      |
| `target-url` | Base URL of the target repository               | Yes      | Variable | `https://gitlab.com` or `https://gitlab.mycompany.com` |
| `group`      | Group or organization name in the repository    | Yes      | Variable | `my-group`                                 |
| `repo-name`  | Repository name                                 | Yes      | Variable | `my-repo`                                  |
| `branches`   | Comma-separated list of branches to synchronize | Yes      | Variable | `develop,homologacion,main`                |

## Example Workflow

```yaml
name: GitLab Sync

on: [push, pull_request]

jobs:
  sync:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0

      - name: Sync to Target Repository
        uses: MaximilianoBz/actions-sync-to-gitlab@v1
        with:
          username: ${{ vars.TARGET_USERNAME }}
          token: ${{ secrets.TARGET_TOKEN }}
          target-url: '${{ vars.TARGET_URL }}'
          group: '${{ secrets.TARGET_GROUP }}'
          repo-name: '${{ vars.TARGET_REPO }}'
          branches: '${{ vars.TARGET_BRANCHES }}'
```