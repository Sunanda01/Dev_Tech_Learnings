# ============================================================
# 1. LINUX BASICS COMMANDS & TERMINAL NAVIGATION
# ============================================================

# Linux = OS kernel; interact with Linux mainly through terminal.
# Shell = program that takes commands and executes them.

uname
# Basic information about the OS/system.

pwd
# Print working directory - current directory.

ls
# List files in current directory.

ls -l
# Detailed view of files.

ls -a
# Show hidden files.

ls -la
# Detailed view + hidden files.

cd <folder>
# Go into a folder.

cd ..
# Go back one directory level.

cd ~
# Go to home directory.

clear
# Clear terminal.
# Ctrl + L also clears the terminal.

history
# Show command history.

!!
# Rerun the last command.


# ============================================================
# 2. FILE & DIRECTORY OPERATIONS
# ============================================================

touch file.txt
# Create a single empty file.

touch file1.txt file2.txt
# Create multiple empty files.

mkdir folder
# Create a single directory.

mkdir -p src/main/java
# Create nested directories.
# -p creates parent directories automatically.

cp file1 file2
# Copy a file.

cp file1 /home/sunanda/abc
# Copy a file to another directory.

cp -r folder1 folder2
# Copy a directory recursively.
# -r is required for directories.

mv old.txt new.txt
# Rename a file.

mv file.txt docs/
# Move a file to another directory.

mv oldfolder newfolder
# Rename a directory.

rm file.txt
# Delete a file.

rmdir emptyfolder
# Delete an empty directory.

rm -r folder
# Delete a directory recursively.

rm -rf folder
# Force-delete a directory recursively.
# DANGEROUS - use carefully.

ls -R
# View directory structure recursively.


# ============================================================
# 3. FILE TYPE & FILE CONTENTS
# ============================================================

file abc.jar
# Identify the file type.

cat file.txt
# Display the entire file contents.
# Avoid cat for very large files/logs.

less app.log
# View a large file page by page.

# less controls:
# Space  -> next page
# b      -> previous page
# /text  -> search for text
# n      -> next search match
# q      -> quit

head file.txt
# Show first 10 lines.

head -n 20 file.txt
# Show first 20 lines.

tail file.txt
# Show last 10 lines.

tail -n 20 file.txt
# Show last 20 lines.

tail -f app.log
# Live log monitoring / follow a log file.
# Ctrl + C -> stop following.


# ============================================================
# 4. VI / VIM
# ============================================================

# vi / vim are terminal-based text editors in Linux.
# vi → the original Unix/Linux text editor.
# vim → Vi Improved, an enhanced version of vi with more features.

vi config.yml
# Open a file using vi.

vim config.yml
# Open a file using Vim.

# Vim modes:
# Normal mode -> commands
# Insert mode -> type/edit text

# Vim commands:
# i       -> insert mode
# Esc     -> return to normal mode
# :w      -> save
# :wq     -> save and quit
# :q      -> quit
# dd      -> delete current line
# /text   -> search for text


# ============================================================
# 5. PERMISSIONS & OWNERSHIP
# ============================================================

# Permission format:
# -rwxr-xr--
#
# -       -> file type
# rwx     -> owner permissions
# r-x     -> group permissions
# r--     -> others permissions
#
# r = read
# w = write
# x = execute
#
# Numeric permissions:
# r = 4
# w = 2
# x = 1
#
# 7 = rwx = 4 + 2 + 1
# 6 = rw- = 4 + 2
# 5 = r-x = 4 + 1
# 4 = r--

chmod +x script.sh
# Make a file executable.

chmod 755 script.sh
# Numeric permission mode:
# Owner  = 7 = rwx
# Group  = 5 = r-x
# Others = 5 = r-x

chown user file.txt
# Change file ownership.

chown user:group file.txt
# Change owner and group.


# ============================================================
# 6. SEARCHING & TEXT PROCESSING
# ============================================================

find . -name "app.log"
# Find by name.

find . -iname "app.log"
# Find by name, case-insensitive.

find . -type f
# Find files.

find . -type d
# Find directories.

find . -name "*.tmp" -delete
# Find and delete .tmp files.
# DANGEROUS - verify the result of find before using -delete.

grep "ERROR" app.log
# Search text inside a file.

grep -i "error" app.log
# Case-insensitive search.

grep "EXCEPTION" *.log
# Search in all .log files in the current directory.

grep -R "DB_HOST" .
# Recursive search through directories.

grep -C 2 "ERROR" app.log
# Show 2 lines before and after matching ERROR.

grep -C 3 "ERROR" app.log
# Show 3 lines before and after matching ERROR.

# Useful grep options:
# -i -> ignore case
# -n -> show line number
# -R -> recursive search
# -v -> exclude matching lines


# ============================================================
# 7. PROCESS & SYSTEM MONITORING
# ============================================================

ps
# List processes.

ps aux
# Show all running processes.

ps aux | grep NODE
# Find Node.js-related processes.

ps aux | grep java
# Find Java-related processes.

top
# Live process/system monitoring.
# q -> quit.

kill <PID>
# Gracefully stop a process.

kill -9 <PID>
# Forcefully kill a process.
# Use only when normal kill does not work.

lsof -i :8080
# Check which process is using port 8080.

netstat -tulpn | grep 8080
# Check which process/listener is using port 8080.
# Availability of netstat depends on the Linux distribution.


# ============================================================
# 8. NETWORKING BASICS
# ============================================================

ping google.com
# Check whether a host is reachable.
# Ctrl + C -> stop.

curl http://localhost:8080
# Basic HTTP GET request.

curl -I http://localhost:8080
# Check HTTP response headers.

curl -O <URL>
# Download a file from a URL.

# curl can transfer data to/from a server using protocols
# such as HTTP/HTTPS and FTP.


# ============================================================
# 9. ENVIRONMENT VARIABLES & PATH
# ============================================================

env
# View environment variables.

echo $JAVA_HOME
# View JAVA_HOME.

export PORT=8080
# Set an environment variable for the current shell session.

echo $PORT
# View PORT value.

vi ~/.bashrc
# Open Bash configuration file.

# Add a variable inside ~/.bashrc:
export JAVA_HOME=value

source ~/.bashrc
# Apply ~/.bashrc changes to the current shell.

echo $PATH
# Display PATH directories.
# Linux searches these directories when executing commands.

# Example:
# /usr/local/bin:/usr/bin:/bin:/usr/sbin


# ============================================================
# 10. LOG DEBUGGING EXAMPLES
# ============================================================

grep "ERROR" app.log
# Search errors.

tail -f app.log
# Monitor logs live.

grep -i "error" app.log
# Case-insensitive error search.

grep -C 2 "ERROR" app.log
# Error + surrounding lines.

# Debug flow:
# Processes -> Logs -> Port -> Environment -> Permissions


# ============================================================
# 11. DOCKER COMMANDS FROM THE NOTEBOOK
# ============================================================
# These are Docker commands appearing on the right-hand page.
# They are included so none of the commands from the images
# are missed.

docker ps
# Show running containers.

docker ps -a
# Show all containers, including stopped containers.

docker stop <container>
# Stop a running container.

docker rename <old-name> <new-name>
# Rename a container.

docker rm <container>
# Remove a container.

docker rmi <image>
# Remove a Docker image.

docker run -d <image>
# Run a container in detached/background mode.

docker exec -it <container> <command>
# Execute a command interactively inside a running container.

# Docker concepts from the notes:
# Container = isolated environment for application + dependencies.
# VM = virtual machine with its own guest OS.
# Docker containers are generally more lightweight than VMs.


# ============================================================
# 12. QUICK BACKEND TROUBLESHOOTING FLOW
# ============================================================

# If a backend service is not working:

ps aux | grep java
# 1. Check whether the Java process is running.

tail -f app.log
# 2. Check application logs.

lsof -i :8080
# 3. Check whether port 8080 is being used.

echo $PORT
echo $JAVA_HOME
echo $PATH
# 4. Check environment variables.

ls -l
# 5. Check file permissions.

# Then, if the application is containerized:
docker ps
docker logs <container>
docker exec -it <container> <command>


# ============================================================
# END OF LINUX COMMAND NOTES
# ============================================================
