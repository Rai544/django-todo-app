# Use official Python image
FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set work directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    && rm -rf /var/lib/apt/lists/*

RUN pip install django==3.2
# Copy project files
COPY . /app/

# Create volume directory for SQLite
RUN mkdir -p /app/volume/store_data

# Expose port
EXPOSE 8000

# Run migrations and start server
CMD ["python", "manage.py", "runserver","0.0.0.0:8000"]




