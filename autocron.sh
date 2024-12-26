# # Remove the lock file if it exists
# if [ -f /home/shubham/Documents/kubestarter-2025/.git/index.lock ]; then
#     rm /home/shubham/Documents/kubestarter-2025/.git/index.lock
# fi

# Pull the latest changes from the remote repository
git pull origin main

# Add all changes to the staging area
git add .

# Commit the changes with a message
git commit -m "update"

# Push the changes to the remote repository
git push origin main

# Print a message
echo "Auto commit and push completed."

# Schedule the script to run every 10 minutes
(crontab -l ; echo "*/1 * * * * /home/shubham/Documents/kubestarter-2025/autocron.sh") | crontab -