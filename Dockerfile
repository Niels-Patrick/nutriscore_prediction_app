# Use a lightweight Python image as the base
FROM python:3.12-slim-bullseye

# Set the working directory
WORKDIR /app

# Create the /save_data directory with write permissions
RUN mkdir -p /save_data && chmod 777 /save_data

# Copy the requirements file
COPY requirements.txt requirements.txt
# Install dependencies
RUN pip install -r requirements.txt

# Copy the application code
COPY . .

# Expose the port the app will listen on
EXPOSE 5000

# Define the command to run the app
CMD ["python", "run.py", "--host='0.0.0.0'", "--port=5000"]