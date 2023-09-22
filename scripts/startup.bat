@echo off

cd ..

terraform apply --auto-approve

ipconfig/flushdns

pause