# Task 01: Basic File Operations

## Scenario
You've just started working as a junior system administrator. Your first assignment is to create a project directory structure for a new web application. You need to create directories, create empty files for configuration, and view file information.

## Objective
Create a project directory structure with the following:
- A main project directory called `webapp`
- Three subdirectories: `config`, `logs`, and `scripts`
- Empty files: `config/app.conf`, `config/database.conf`, `logs/access.log`, and `scripts/deploy.sh`
- List all files with detailed information

## Steps
1. Create the main project directory
2. Navigate into the directory
3. Create the three subdirectories
4. Create the empty configuration and log files
5. List all files and directories with detailed information
6. Display the directory tree structure

## Hints
- Use `mkdir` to create directories
- Use the `-p` flag with `mkdir` to create parent directories as needed
- Use `touch` to create empty files
- Use `ls -la` to list files with detailed information
- Use `tree` command to view directory structure (if available)
- You can create multiple directories at once with `mkdir dir1 dir2 dir3`

## Sample Solution

```bash
# Step 1: Create the main project directory
mkdir webapp

# Step 2: Navigate into the directory
cd webapp

# Step 3: Create the three subdirectories at once
mkdir config logs scripts

# Alternative: Create subdirectories one at a time
# mkdir config
# mkdir logs
# mkdir scripts

# Step 4: Create empty files with full paths
touch config/app.conf config/database.conf logs/access.log scripts/deploy.sh

# Alternative: Navigate to each directory and create files
# cd config
# touch app.conf database.conf
# cd ../logs
# touch access.log
# cd ../scripts
# touch deploy.sh
# cd ..

# Step 5: List all files with detailed information
ls -la
ls -laR  # Recursive listing to show all subdirectories

# Step 6: Display directory tree (if tree is installed)
tree

# If tree is not installed, you can install it:
# Ubuntu/Debian: sudo apt-get install tree
# CentOS/RHEL: sudo yum install tree
# macOS: brew install tree
```

## Expected Output

When you run `ls -laR`, you should see:

```
.:
total 20
drwxrwxr-x 5 user user 4096 Oct 26 19:53 .
drwxrwxr-x 3 user user 4096 Oct 26 19:53 ..
drwxrwxr-x 2 user user 4096 Oct 26 19:53 config
drwxrwxr-x 2 user user 4096 Oct 26 19:53 logs
drwxrwxr-x 2 user user 4096 Oct 26 19:53 scripts

./config:
total 8
drwxrwxr-x 2 user user 4096 Oct 26 19:53 .
drwxrwxr-x 5 user user 4096 Oct 26 19:53 ..
-rw-rw-r-- 1 user user    0 Oct 26 19:53 app.conf
-rw-rw-r-- 1 user user    0 Oct 26 19:53 database.conf

./logs:
total 8
drwxrwxr-x 2 user user 4096 Oct 26 19:53 .
drwxrwxr-x 5 user user 4096 Oct 26 19:53 ..
-rw-rw-r-- 1 user user    0 Oct 26 19:53 access.log

./scripts:
total 8
drwxrwxr-x 2 user user 4096 Oct 26 19:53 .
drwxrwxr-x 5 user user 4096 Oct 26 19:53 ..
-rw-rw-r-- 1 user user    0 Oct 26 19:53 deploy.sh
```

## Key Concepts

- **mkdir**: Create directories
- **cd**: Change directory
- **touch**: Create empty files or update file timestamps
- **ls**: List directory contents
  - `-l`: Long format (detailed information)
  - `-a`: Show all files including hidden files (starting with .)
  - `-R`: Recursive listing
- **tree**: Display directory structure in tree format

## Common Mistakes to Avoid

1. Forgetting to create parent directories first (use `mkdir -p` for nested paths)
2. Using spaces in filenames without quotes (use quotes or escape spaces)
3. Not checking if directory already exists before creating
4. Forgetting that `touch` updates timestamps of existing files

## Practice Exercise

Try creating a more complex directory structure:
```
project/
├── src/
│   ├── main.py
│   └── utils.py
├── tests/
│   └── test_main.py
└── docs/
    └── README.md
```

Create this structure using what you've learned!
