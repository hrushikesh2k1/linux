# Task 02: user management and permissions 

## Scenario
As a junior system administrator, you need to create a new user, set up their project directory, and manage file permissions for a web application.

## Objective
Create a project directory structure with the following:
- Create a new user called webadmin with a home directory /home/webadmin
- Create a project directory webapp inside the user’s home
- Set proper ownership and permissions
- Create a subdirectory public_html with restricted access
- Verify ownership and permissions

## Sample Solution

```bash
## Steps
# Step 1: Create a new user with a home directory
sudo useradd -m -d /home/webadmin webadmin

# Step 2: Navigate to the user's home directory
cd /home/webadmin

# Step 3: Create the project directory
mkdir webapp

# Step 4: Set ownership of the directory to the user
sudo chown -R webadmin:webadmin webapp

# Step 5: Navigate into the project directory and create a subdirectory
cd webapp
mkdir public_html

# Step 6: Set permissions so only the owner can access
chmod 700 public_html

# Step 7: Verify directory structure and permissions
ls -la
```

## Expected Output

When you run `ls -la`, you should see:

```
total 12
drwx------ 3 webadmin webadmin 4096 Oct 27 20:15 .
drwxr-xr-x 4 root     root     4096 Oct 27 20:10 ..
drwx------ 2 webadmin webadmin 4096 Oct 27 20:15 public_html
```


Create this structure using what you've learned!
