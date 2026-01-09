# Use official Ubuntu base image
FROM ubuntu:22.04

# Prevent interactive prompts during package install
ENV DEBIAN_FRONTEND=noninteractive

# Update and install required packages
RUN apt-get update && \
    apt-get install -y apache2 git && \
    apt-get clean

# Clone your Git repository into Apache's web root
# Replace with your actual repo URL
RUN rm -rf /var/www/html/* && \
    git clone https://github.com/jagan-prakash/htmlo.git /var/www/html/core

# Expose Apache port
EXPOSE 81

# Start Apache in foreground (important for Docker)
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
