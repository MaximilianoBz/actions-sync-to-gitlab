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

      # Extract the repository name
      - name: Extract repository name
        id: extract_repo_name
        run: echo "repo_name=$(basename ${{ github.repository }})" >> $GITHUB_ENV

      # Sync to Gitlab Repository
      - name: Sync to Gitlab Repository
        uses: MaximilianoBz/actions-sync-to-gitlab@v2.0
        env:
          TARGET_USERNAME: '${{ vars.TARGET_USERNAME }}'
          TARGET_TOKEN: '${{ secrets.TARGET_TOKEN }}'
          TARGET_URL: '${{ vars.TARGET_URL }}'
          TARGET_GROUP: '${{ vars.TARGET_GROUP }}'
          TARGET_BRANCHES: '${{ vars.TARGET_BRANCHES }}'
          TARGET_REPO: '${{ env.repo_name }}'  # Use the extracted repository name
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
*	`TARGET_BRANCHES` - [Required]. Comma-separated list of branches to synchronize.
	*	Type: string
	*	Example: develop,homologacion,main
*	`TARGET_REPO` - [Required]. Name of the repository in the target Git server.
	*	Type: string
	*	Example: my-repo
  * __Note__: This value will be automatically extracted from the GitHub repository name during the workflow run. You can extract it using the step Extract repository name.

---

License

The Dockerfile and associated scripts and documentation in this project are released under the MIT License.