# Sử dụng node:16.20.0 image làm base image
FROM node:16.20.0

# Thiết lập thư mục làm việc trong container
WORKDIR /usr/src/app

# Copy package.json và package-lock.json vào container
COPY package*.json ./

# Cài đặt các dependencies
RUN npm install

# Copy toàn bộ mã nguồn vào container
COPY . .

# Expose cổng mà ứng dụng của bạn sẽ chạy
EXPOSE 5000

# Lệnh để chạy ứng dụng
CMD ["npm", "start"]
