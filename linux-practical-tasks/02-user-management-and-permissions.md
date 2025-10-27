Scenario

As a junior system administrator, you need to create a new user, set their home directory, and manage file permissions for a project.

Objective

Create a new user called webadmin with a home directory /home/webadmin.

Create a project directory /home/webadmin/webapp.

Set the owner of all files inside webapp to webadmin.

Create a subdirectory public_html inside webapp and give read/write/execute permissions only to the owner.

Verify ownership and permissions.

Steps
# Step 1: Create a new user with a home directory
sudo useradd -m -d /home/webadmin webadmin

# Step 2: Navigate to the user's home directory
cd /home/webadmin

# Step 3: Create a project directory for the user
mkdir webapp

# Step 4: Set ownership of the directory (recursively) to webadmin
sudo chown -R webadmin:webadmin webapp

# Step 5: Navigate into the project directory and create a subdirectory
cd webapp
mkdir public_html

# Step 6: Set permissions so only the owner can read/write/execute
chmod 700 public_html

# Step 7: Verify directory structure and permissions
ls -la

Expected Output (ls -la inside /home/webadmin/webapp)
total 12
drwx------ 3 webadmin webadmin 4096 Oct 27 20:15 .
drwxr-xr-x 4 root     root     4096 Oct 27 20:10 ..
drwx------ 2 webadmin webadmin 4096 Oct 27 20:15 public_html

Directory Tree (tree /home/webadmin/webapp)
webapp
└── public_html

Key Concepts

useradd: Create a new user

-m creates a home directory

-d specifies a custom home directory

mkdir: Create directories

chown: Change ownership of files/directories

-R applies recursively

chmod: Change permissions

700 → Owner has read, write, execute; others have no access

ls -la: View permissions, ownership, hidden files

Common Mistakes to Avoid

Forgetting sudo when creating users or changing ownership.

Not creating the home directory (-m flag is necessary).

Forgetting to set correct permissions for private directories.

Confusing user ownership (chown) with file permissions (chmod).
