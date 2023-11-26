# Use an official Ubuntu runtime as a parent image
FROM ubuntu:latest

# Install necessary packages (Nginx and MySQL)
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y nginx mysql-server && \
    rm -rf /var/lib/apt/lists/*

# Expose ports for Nginx and MySQL
EXPOSE 80 3306

# Copy configuration files (you may need to customize these)
COPY nginx.conf /etc/nginx/nginx.conf
COPY my.cnf /etc/mysql/my.cnf

# Start services
CMD service mysql start && nginx -g "daemon off;"
