# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY service/ ./service/

# Create a non-root user (theia)
RUN useradd --uid 1000 theia && chown -R theia /app
USER theia

# Expose the application port
EXPOSE 8080

ENV PORT=8080

# Run Gunicorn server
CMD ["gunicorn", "--bind=0.0.0.0:8080", "--log-level=info", "service:app"]
