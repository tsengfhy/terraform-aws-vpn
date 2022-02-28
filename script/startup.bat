@echo off

cd ..

terraform init
terraform apply --auto-approve

pause