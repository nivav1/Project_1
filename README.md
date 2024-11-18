# In this project I am running a Jenkins pipeline to first configure a cloud VM using terraform

# Generate the IP of the machine using terraform output in a bash script and store it in jenkins env variable and in my ansible host.ini file

# Install any dependencies for the app, In that case docker, using ansible

# Then deploy the app and run it inside the environment using ansible and docker compose.

# I used multi stage docker images to massively decrease my frontend image's size

# Note: Jenkins server was set and configured inside an aws ec2 instance along with all permissions, credentials and plugins needed, and was given AMI permissions for this project's pipeline to run.
