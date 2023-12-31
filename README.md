# Overview:
This project comprises of all the files created and generated to accomplish the MAYD spacebeacon challenge

# Contents:
- spacebeacon_docker_files: All files used to create docker image. Docker image can be pulled from the dockerhub repository: bshreya639/spacebeacon:1.0
- spacebeacon_helm_charts: Charts created for spacebeacon kubernetes deployment.
- spacebeacon_terraform_scripts: Terraform scripts to create the infrastructure on AWS.
- sample_screenshots: Screenshots taken for validations during tasks.
- README.md: Project Descriptions and Overview.
- config: kubeconfig file generated after cluster creation
- spacebeacon_report_docx: A word document listing Journey Logs, Issues Overview, Thoughts, etc.

# Instructions to execute terraform scripts:
Recommended to configure an aws profile before commencing terraform tasks.

1. Execute: terraform init
2. The files should be planned and applied in the following order (to avoid errors). Execute the following commands after every file is placed in the project
   ```
   terraform fmt
   terraform plan
   terraform apply
   ```

   Files:   
   1. provider.tf
   2. vpc.tf
   3. subnet.tf
   4. internet-gateway.tf
   5. eips.tf
   6. nat-gateway.tf
   7. routing-tables.tf
   8. route-table-association.tf
   9. eks.tf
   10. eks-node-groups.tf


