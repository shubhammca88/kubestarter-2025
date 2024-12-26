#!/bin/bash

# Navigate to the repository
cd /home/shubham/Documents/kubestarter-2025

# Add all changes to git
git add .

# Commit the changes with a message
git commit -m "update"

# Push the changes to the remote repository
git push origin main

# Print a message
echo "Auto commit and push completed."

# Schedule the script to run every day at 2am
# (crontab -l ; echo "*/5 * * * * /home/shubham/Documents/kubestarter-2025/autocron.sh") | crontab -
