# Use Python 3.11.5 as the base image
FROM python:3.11.5-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements.txt file first (to leverage Docker layer caching)
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire project into the container
COPY . .

# Expose port 8000 to allow access to the FastAPI app
EXPOSE 8000

# Command to run the FastAPI app with Uvicorn
CMD ["uvicorn", "sql_app.main:app", "--host", "0.0.0.0", "--port", "8000"]
