#!/bin/bash
### Description: Start ssh service in container
### Written by: Alex Yin - mooncreeks@gmail.com on 11-06-2015
__create_user() {
# Create a user to SSH into as.
useradd admin
SSH_USERPASS=abcd.9527
echo -e "$SSH_USERPASS\n$SSH_USERPASS" | (passwd --stdin admin)
echo ssh user password: $SSH_USERPASS
}

# Call all functions
__create_user
