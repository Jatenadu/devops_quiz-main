#!/bin/bash

# กำหนดชื่อ Image
imageName="node-web-app"

# สร้าง Docker Image จาก Dockerfile ในโฟลเดอร์ปัจจุบัน
docker build -t "${imageName}" .

# ตรวจสอบว่าการสร้าง Image สำเร็จหรือไม่
if [ $? -eq 0 ]; then
    echo "Docker image '${imageName}' built successfully."
else
    echo "Failed to build Docker image '${imageName}'."
fi