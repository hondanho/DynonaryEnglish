#!/bin/bash

# Xóa thư mục build nếu tồn tại
rm -rf "../backend/src/build"

# Di chuyển thư mục build
mv "./build" "../backend/src"

# Chuyển thư mục làm việc sang thư mục backend
cd ../backend
