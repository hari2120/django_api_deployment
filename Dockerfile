# Dockerfile

# Use Python official image as a base
FROM python:3.9

# Set the working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt # Added --no-cache-dir for potentially smaller image

# Copy the project files to the container
COPY . /app/

# Expose the port the app will run on
EXPOSE 8000

# Command to run the app
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
