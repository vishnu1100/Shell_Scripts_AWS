# Shell Scripts for AWS Automation

This repository demonstrates how to use shell scripts to automate tasks on AWS. The example below uses `PackageUpdate.sh` to update package lists on an AWS instance.

## PackageUpdate.sh

This script updates the package lists on an AWS instance.

### Script Content
```bash
#!/bin/bash
# PackageUpdate.sh
# Script to update package lists

echo "Updating package lists..."
sudo apt update
```

### Hosting the Script on S3

1. Upload the script to an S3 bucket:
   ```bash
   aws s3 cp PackageUpdate.sh s3://your-bucket-name/PackageUpdate.sh --acl public-read
   ```

2. Note the public URL:
   ```
   https://your-bucket-name.s3.amazonaws.com/PackageUpdate.sh
   ```

## Steps to Run the Script

### 1. Download the Script
Use `wget` to download the script to your instance:
```bash
wget https://your-bucket-name.s3.amazonaws.com/PackageUpdate.sh -O PackageUpdate.sh
```

### 2. Make the Script Executable
```bash
chmod +x PackageUpdate.sh
```

### 3. Execute the Script
```bash
./PackageUpdate.sh
```

## Prerequisites

Before running the script, ensure the following:

1. **AWS CLI Installed and Configured**
   - Install the AWS CLI:
     ```bash
     curl "https://awscli.amazonaws.com/aws-cli-v2.zip" -o "awscliv2.zip"
     unzip awscliv2.zip
     sudo ./aws/install
     ```
   - Configure the AWS CLI:
     ```bash
     aws configure
     ```
     Provide your AWS access key, secret key, region, and output format.

2. **Instance Connectivity**
   - Use SSH to connect to your instance:
     ```bash
     ssh -i "your-key.pem" ubuntu@your-instance-ip
     ```

3. **Hosted Script**
   - Ensure the script `PackageUpdate.sh` is hosted on a publicly accessible location (e.g., AWS S3).

## Troubleshooting

- **HTML Content in Script**: If you see HTML instead of the script content, ensure the URL is correct and publicly accessible.
  ```bash
  cat PackageUpdate.sh
  ```

- **File Format Issues**: Convert line endings if created on Windows:
  ```bash
  dos2unix PackageUpdate.sh
  ```

- **Debugging Downloads**: Use verbose mode to inspect `wget`:
  ```bash
  wget -v https://your-bucket-name.s3.amazonaws.com/PackageUpdate.sh -O PackageUpdate.sh
  ```

## Automating with User Data

To run the script during instance startup, use the following user data script when launching the instance:

```bash
#!/bin/bash
wget https://your-bucket-name.s3.amazonaws.com/PackageUpdate.sh -O /tmp/PackageUpdate.sh
chmod +x /tmp/PackageUpdate.sh
/tmp/PackageUpdate.sh
```

This will ensure the script executes automatically after the instance launches.

## Conclusion

Using `PackageUpdate.sh`, you can simplify routine updates on AWS instances. This approach can be extended to automate other administrative tasks efficiently.
