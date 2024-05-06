# Use an official Python runtime as the base image
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt file to the container
COPY requirements.txt .

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application's source code to the container
COPY . .

# Expose the port on which the application will run (replace 8000 with your desired port)
EXPOSE 8000

# Define the command to run your application
CMD ["python", "app.py"]