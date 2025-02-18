@echo off

cd ..

terraform destroy -target aws_spot_instance_request.this --auto-approve