# Use the official Python 3.8 image as the base image
FROM python:3.8-slim-buster

# Set the working directory inside the container to /app
WORKDIR /app

# Set environment variable for MongoDB URI - I have created an .env file so i commented here
#ENV MONGODB_ENDPOINT="mongodb://db:27017/example"

# Copy requirements.txt first to leverage Docker cache
COPY src/requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY src/ .

# Expose port 5000 (or the port your Flask app is running on)
EXPOSE 5000

# Run the Flask application when the container starts
CMD [ "python3", "-m", "flask", "run", "--host=0.0.0.0"]
