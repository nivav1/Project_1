# In this project I am using Jenkins to configure a cloud environment using terraform

# Then generate the IP of the machine using terraform output in a bash script and store it in jenkins env. variable and in my ansible host.ini file

# Installs any dependencies for the app, In that case docker using ansible

# Then deploys the app and runs it inside the environment using ansible.

#  I used multi stage docker images to massively decrease my frontend image's size

# Note: Jenkins server was set and configured inside an aws ec2 instance along with all permissions and credentials needed, and was given AMI permissions for this project's pipeline to run.
