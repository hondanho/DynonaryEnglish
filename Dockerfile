# Giai đoạn build cho frontend
FROM node:14.21.3 AS frontend-build

# Thiết lập thư mục làm việc cho frontend
WORKDIR /usr/src/app/frontend

# Copy package.json và package-lock.json vào container
COPY frontend/package*.json ./

# Cài đặt các dependencies cho frontend
RUN npm install

# Copy toàn bộ mã nguồn của frontend vào container
COPY ./frontend .

# Chạy lệnh build cho frontend
RUN npm run build

# Giai đoạn build cho backend
FROM node:14.21.3 AS backend-build

# Thiết lập thư mục làm việc cho backend
WORKDIR /usr/src/app/backend

# Copy package.json và package-lock.json vào container
COPY backend/package*.json ./

# Cài đặt các dependencies cho backend
RUN npm install

# Copy toàn bộ mã nguồn của backend vào container
COPY ./backend .

# Copy thư mục build của frontend vào thư mục backend
COPY --from=frontend-build /usr/src/app/frontend/build ./src/build

WORKDIR /usr/src/app/backend
# (Tùy chọn) Chạy lệnh build cho backend nếu có lệnh build riêng
# RUN npm run build (nếu backend có lệnh build riêng)

# Expose port và thiết lập lệnh khởi động
EXPOSE 8009
CMD ["npm", "start"]
