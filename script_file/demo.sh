#!/bin/bash

# GitHub API URL
API_URL="https://api.github.com"

# GitHub username and personal access token
USERNAME="helllo"
TOKEN="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"




# User and Repository information
REPO_OWNER=for-just-practice
REPO_NAME=demop

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
