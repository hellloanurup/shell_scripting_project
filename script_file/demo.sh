#!/bin/bash

# GitHub API URL
API_URL="https://api.github.com"

# GitHub username and personal access token
USERNAME="helllo"
TOKEN="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"




# User and Repository information
REPO_OWNER=bashscriptexec
REPO_NAME=customrepo

# Function to make a GET request to the GitHub API
function github_api_get {
    local endpoint="$1"
    local url="${API_URL}${endpoint}"

    # Send a GET request to the GitHub API with authentication
    curl -s -u "hellloanurup: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" "${url}"
}

# Function to list users with read access to the repository
function list_users_with_read_access {
    local endpoint="/repos/${REPO_OWNER}/${REPO_NAME}/collaborators"

    # Fetch the list of collaborators on the repository
    collaborators="$(github_api_get "${endpoint}" | jq -r '.[] | select(.permissions.pull == true) | .login')"

    # Display the list of collaborators with read access
    if [[ -z "$collaborators" ]]; then
        echo "No users with read access found"
    else
        echo "Users with read access "
        echo "$collaborators"
    fi
}

# Main script

echo "Listing users with read access"
list_users_with_read_access
