# Task 04: creating and editing files

## Scenario
As a system administrator, you need to create text configuration files and edit them using the command line.

## Objective
Create a text file settings.conf inside /home/webadmin/webapp/config
Add configuration lines to the file
View the contents of the file
Edit the file using nano or vi (command-line editors)

## Sample Solution

```bash
# Step 1: Navigate to the config directory
cd /home/webadmin/webapp/config

# Step 2: Create the file
touch settings.conf

# Step 3: Add content to the file using echo and redirection
echo "APP_ENV=development" >> settings.conf
echo "APP_DEBUG=true" >> settings.conf
echo "DB_HOST=localhost" >> settings.conf

# Step 4: View the file contents
cat settings.conf

# Step 5: Edit the file using nano (or vi)
# nano settings.conf
# OR
# vi settings.conf
```

## Expected Output
```
This is the test file
```

## Key concepts
touch: Creates an empty file
echo "text" >> file: Appends text to a file
cat: Displays file content on the terminal
nano / vi: Command-line editors to modify files

## common mistakes to avoid

Using > instead of >> will overwrite the file instead of appending.
Forgetting to navigate to the correct directory before creating files.
Not saving changes in nano or vi after editing.
Using incorrect file permissions that prevent editing.
