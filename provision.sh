#!/bin/bash 

echo 'export PATH=/home/ann/anaconda3/bin:$PATH' >> /home/ann/.bashrc
su - ann -c "bash"
su - ann -c "/home/vagrant/anaconda3/bin/conda install flask-restful -c conda-forge -y" 
su - ann -c "/home/vagrant/anaconda3/bin/conda install psycopg2 sqlalchemy keras" 
sudo apt-get install  postgresql postgresql-server-dev-all libpq-dev -y
cat << EOF | su - postgres -c psql
create role ann with login superuser password 'ann';
create database ann;
EOF
