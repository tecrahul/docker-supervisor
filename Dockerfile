# Use an official PHP runtime as the base image
FROM php:7.4-apache

# Install Supervisor
RUN apt-get update && apt-get install -y supervisor

# Copy Supervisor configuration file
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Enable required Apache modules
RUN a2enmod proxy_fcgi

# Restart Apache to apply changes
RUN service apache2 restart

# Expose port 80
EXPOSE 80

# Start Supervisor
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
