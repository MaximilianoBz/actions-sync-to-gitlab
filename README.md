# Sync Specific Branches to Target Git Repository

This GitHub Action synchronizes specific branches and tags to a target Git repository, supporting both public and self-hosted GitLab.

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
          username: '${{ vars.TARGET_USERNAME }}'
          token: '${{ secrets.TARGET_TOKEN }}'
          target-url: '${{ vars.TARGET_URL }}'
          group: '${{ secrets.TARGET_GROUP }}'
          repo-name: '${{ vars.TARGET_REPO }}'
          branches: '${{ vars.TARGET_BRANCHES }}'
```

##  Environment Variables
*	`TARGET_USERNAME` - [Required]. Username for Git authentication.
	*	Type: string
	*	Example: your_username
*	`TARGET_TOKEN` - [Required]. Token or password for Git authentication.
	*	Type: string
	*	Example: your_personal_token
*	`TARGET_URL` - [Required]. Base URL of the target Git repository (e.g., GitLab instance).
	*	Type: string
	*	Example: https://gitlab.com
*	`TARGET_GROUP` - [Required]. Group or organization name in the target repository.
	*	Type: string
	*	Example: my-group
*	`TARGET_REPO` - [Required]. Name of the repository in the target Git server.
	*	Type: string
	*	Example: my-repo
*	`TARGET_BRANCHES` - [Required]. Comma-separated list of branches to synchronize.
	*	Type: string
	*	Example: develop,homologacion,main

---

License

The Dockerfile and associated scripts and documentation in this project are released under the MIT License.


