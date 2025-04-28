# Init resource
```
terraform init
```

# Verify information before apply
```
terraform plan
```

# Deploy infrastructure
```
terraform apply
```

# Destroy infrastructure
```
terraform destroy
```

# Check point
1. VPC
+ Subnets (Public + Private)
+ Internet Gateway: internet_gateway
+ Default Security Group: security_group

2. Route Tables
+ Public Route Table: Internet qua IGW
+ Private Route Table: Internet qua NAT Gateway

3. Nat Gateway
+ Private Subnet phải ra internet thông qua Nat Gateway

4. EC2
+ Instance trong Public Subnet: Có thể truy cập Internet.
+ Instance trong Private Subnet: Không có Public IP, chỉ SSH thông qua Public Instance. 

5. Security Groups
+ Public EC2 SG: Chỉ cho phép SSH từ IP cụ thể. `allowed_ip`
+ Private EC2 SG: Chỉ cho phép SSH từ Public EC2.

# Test Cases
## Bảng Test Case Chi Tiết

| STT | Thành phần kiểm tra        | Mục tiêu kiểm tra                                                                 | Phương pháp kiểm tra | Kết quả mong đợi |
|:---:|-----------------------------|----------------------------------------------------------------------------------|----------------------|------------------|
| 1   | VPC                         | VPC được tạo đúng CIDR block                                                     | AWS Console → VPC    | VPC tồn tại với CIDR đúng |
| 2   | Public Subnet                | Subnet public được tạo đúng CIDR, AZ                                             | AWS Console → Subnets| Subnet public tồn tại, map public IP enabled |
| 3   | Private Subnet               | Subnet private được tạo đúng CIDR, AZ                                            | AWS Console → Subnets| Subnet private tồn tại, không map public IP |
| 4   | Internet Gateway             | IGW đã attach đúng vào VPC                                                       | AWS Console → Internet Gateway | IGW attach vào đúng VPC |
| 5   | NAT Gateway                  | NAT Gateway được tạo và có Elastic IP                                            | AWS Console → NAT Gateway | NAT Gateway tồn tại với Elastic IP |
| 6   | Route Table Public           | Route Table public định tuyến đúng 0.0.0.0/0 qua IGW                             | AWS Console → Route Tables | Route 0.0.0.0/0 → IGW |
| 7   | Route Table Private          | Route Table private định tuyến đúng 0.0.0.0/0 qua NAT Gateway                    | AWS Console → Route Tables | Route 0.0.0.0/0 → NAT Gateway |
| 8   | Security Group Public EC2    | SG cho Public EC2 cho phép SSH từ IP cá nhân                                      | AWS Console → Security Groups | Rule allow port 22 từ IP cá nhân |
| 9   | Security Group Private EC2   | SG cho Private EC2 cho phép SSH từ Public EC2                                    | AWS Console → Security Groups | Rule allow port 22 từ SG public |
| 10  | EC2 Instance Public          | EC2 Public được tạo, có Public IP, SSH được từ IP cá nhân                        | SSH + AWS Console → EC2 | SSH thành công |
| 11  | EC2 Instance Private         | EC2 Private không có Public IP, SSH chỉ được từ Public EC2                       | SSH qua Public EC2 | SSH thành công từ Public EC2 |
| 12  | Public EC2 Internet Access   | Public EC2 truy cập Internet được (ping 8.8.8.8)                                | SSH vào Public EC2 + ping | Ping thành công |
| 13  | Private EC2 Internet Access  | Private EC2 truy cập Internet được qua NAT Gateway (ping 8.8.8.8)                | SSH vào Private EC2 + ping | Ping thành công |
| 14  | Private EC2 Không truy cập trực tiếp | Private EC2 không thể SSH trực tiếp từ máy ngoài Internet | SSH thử vào Private IP | Kết nối thất bại |

---

# 🛠 Hướng dẫn cách test nhanh:

1. `terraform apply`
2. Lấy Public IP của EC2 Public từ output hoặc AWS Console.
3. SSH vào EC2 Public:
   ```bash
   ssh -i your-key.pem ec2-user@<Public_IP>
   ```
4. Từ EC2 Public SSH vào EC2 Private (dùng private IP):
   ```bash
   ssh ec2-user@<Private_IP>
   ```
5. Ping Internet:
   ```bash
   ping 8.8.8.8
   ```

---
