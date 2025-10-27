# Task 03: Installing Packages and Managing Services

## Scenario
As a junior system administrator, you need to install necessary software packages for a web application and manage services.

## Objective
Update the package list
Install nginx web server
Start and enable nginx service
Check the status of the service

## Sample Solution

```bash
# Step 1: Update package list (Debian/Ubuntu)
sudo apt update

# For CentOS/RHEL, use:
# sudo yum check-update

# Step 2: Install nginx
sudo apt install -y nginx

# For CentOS/RHEL:
# sudo yum install -y nginx

# Step 3: Start the nginx service
sudo systemctl start nginx

# Step 4: Enable nginx to start on boot
sudo systemctl enable nginx

# Step 5: Check the status of nginx service
sudo systemctl status nginx

```

## Expected Output
```
● nginx.service - A high performance web server and a reverse proxy server
   Loaded: loaded (/lib/systemd/system/nginx.service; enabled; vendor preset: enabled)
   Active: active (running) since Sun 2025-10-27 20:40:00 UTC; 5s ago
     Docs: man:nginx(8)
 Main PID: 1234 (nginx)
    Tasks: 2 (limit: 4915)
   Memory: 3.5M
   CGroup: /system.slice/nginx.service
           ├─1234 nginx: master process /usr/sbin/nginx -g daemon on; master_process on;
           └─1235 nginx: worker process

```
## Key concepts

apt update / yum check-update: Updates package index
apt install / yum install: Installs packages
-y → automatically answer “yes” to prompts
systemctl start: Starts a service
systemctl enable: Enables service to start at boot
systemctl status: Check if service is running

## common mistakes to avoid

Forgetting sudo for package installation and service management.
Installing packages without updating the package list first.
Confusing start and enable commands (start runs service immediately, enable ensures it starts on boot).
Not checking firewall rules—nginx might run but be blocked externally.
