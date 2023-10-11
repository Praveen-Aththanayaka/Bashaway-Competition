rm -rf src

git clone https://github.com/sliit-foss/npm-catalogue.git src

# Write your code here
#!/bin/bash

# Iterate through all branches
for branch in $(git for-each-ref --format='%(refname:short)' refs/heads/); do
  # Iterate through all commits on the current branch
  for commit in $(git rev-list $branch); do
    # Get the original commit timestamp
    original_timestamp=$(git log -1 --format="%at" $commit)
    
    # Calculate the new timestamp by adding 13 days (13 * 24 * 60 * 60 seconds)
    new_timestamp=$((original_timestamp + 13 * 24 * 60 * 60))
    
    # Update the commit timestamp
    git filter-branch --env-filter "export GIT_COMMITTER_DATE=$new_timestamp" -f $commit
  done
done

# Force push the changes to all branches
git push --all --force
