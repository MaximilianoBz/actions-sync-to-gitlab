# Sync Specific Branches to Target Git Repository

This GitHub Action synchronizes specific branches and tags to a target Git repository, supporting both public and self-hosted GitLab.

## **Environment Variables**

| Variable Name        | Description                                                    | Type    | Required | Type | Example                          |
|-----------------------|----------------------------------------------------------------|---------|----------|--------|-------------------------------|
| `TARGET_USERNAME`     | Username for Git authentication.                               | string  | Yes      | Variable | `your_username` |
| `TARGET_TOKEN`        | Token or password for Git authentication.                     | string  | Yes      | Secret | `your_personal_token`          |
| `TARGET_URL`          | Base URL of the target Git repository (e.g., GitLab instance). | string  | Yes      | Variable | `https://gitlab.com`        |
| `TARGET_GROUP`        | Group or organization name in the target repository.           | string  | Yes      | Variable | `my-group`                  |
| `TARGET_REPO`         | Name of the repository in the target Git server.               | string  | Yes      | Variable | `my-repo`                   |
| `TARGET_BRANCHES`     | Comma-separated list of branches to synchronize.               | string  | Yes      | Variable | `develop,homologacion,main` |


## Usage

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