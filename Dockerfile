# Use lightweight Python image
FROM python:3.10-slim-bookworm

# Expose Streamlit port
EXPOSE 8501

# Install minimal OS dependencies
RUN apt-get update && apt-get install -y git build-essential \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy only requirements first (better caching)
COPY requirements.txt /app/requirements.txt

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy only your app code
COPY app.py /app/

# Run Streamlit
ENTRYPOINT ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]
