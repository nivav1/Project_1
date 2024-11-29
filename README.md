# In this project I am running a containerized jenkins master that controls one containerized agent to configure an AWS VM and deploy an app on it.

# I created a simple website using react, flask and postgresql

# All that's needed is to build the jenkins images, a simple jenkins-master configuration and the project runs automatically.

# The pipeline builds infrastructure, runs CI to test(lint tests) and generate the artifacts that are deployed onto the infrastructure by the CD.

# Note that the purpose of this porject was to experiment, test and increase my knowledge with certain tools.

# I am aware that I am missing parts for it to work automatically in a continous environment. And that this is far from best practices for security, speed and quality.

#### Now I'll add more content

######## WEB APP

### Frontend/ backend/ folders and package*json, docker-compose files are for the web code. 

# The backend consists of simple flask application that connects to a postgres database configures it(with a table) and POSTs users into it.

# The frontend is a react application that has simple register on / and navigates to /Welcome if successfully registered.

# In order to fetch the backend API(Unknown_IP:Known_PORT) I inserted a variable in my frontend code (see fetch(line 33) on frontend/src/Register.js)

# I did that in order for it to run without manual intervention, and because it proves very dynamic pipelines that can change the artifacts themselves and keep constant variables between pipelines.

######## DOCKER COMPOSE

# The docker-compose file pulls the images from dockerhub and creates the full functional app, The db passes a health check before backend starts in order to create the db configuration successfully.
 
######## ANSIBLE

# Ansible has one playbook that installs dependencies(in that case docker) and another playbook to deploy the app and run it.

######## TERRAFORM

# simple main.tf file that creates a security group to allow traffic to my app ports and ssh connection, a key-pair connected to my id_rsa and an ec2 instance that uses both.

######## MACHINE_IP.SH

# machine_ip script generates the was ec2 instance's ip from terraform state(output on main.tf) and places it in ansible's hosts file(host.ini) along with the correct user for the ec2 machine.

######## JENKINS MASTER

# Jenkins master is configured in a docker on my host machine, I installed some packages on top of my base image(see jenkins/dockerfile).

# I ran the jenkins master with docker compose, it has docker.sock(for docker use) and docker(for docker CLI) mounted on it, and I configured it with docker plugins and pipeline for each jenkinsfile.

# Jenkins agent is configured on debian with packages, secrets and config files for it to be able to run terraform for aws and ansible on my new ec2 machine. jenkins/slave_infrastructure/dockerfile

# jenkinsfile-infrastructure uses the agent to to install the infrastructure, save the .tfstate file in /state and generate the machine's IP for the CI pipeline then runs the CI pipeline

# jenkinsfile-CI runs tests on the code and if it passes it compiles the code(and inserts the machine's IP into the frontend) and pushes the images to dockerhub

# jenkinsfile-CD installs dependencies on the new machine(in that case docker), deploys the app and runs the docker-compose inside the new machine, which pulls the images from dockerhub and runs the app.

############ END
