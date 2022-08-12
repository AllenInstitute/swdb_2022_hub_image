#!/bin/bash -l

cd /home/jovyan
touch ~/test.file

git clone https://$JUPYTERHUB_USER@github.com/AllenInstitute/swdb_2022 swdb_2022_test
cd swdb_2022_test
git merge origin/initial_EM
git clone https://$JUPYTERHUB_USER@github.com/AllenInstitute/swdb_2022_python_bootcamp
mv swdb_2022_python_bootcamp/Python* .
mv swdb_2022_python_bootcamp/support_files .
rm -rf swdb_2022_python_bootcamp
git clone https://$JUPYTERHUB_USER@github.com/corbennett/swdb_2022 swdb_2022_corbennett
cp -r swdb_2022_corbennett/Organizers/* DynamicBrain/
rm -rf swdb_2022_corbennett

