FROM pytorch/pytorch:2.5.0-cuda12.1-cudnn8-runtime

WORKDIR /app

# Install basic dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    wget \
    ffmpeg \
    libsm6 \
    libxext6 \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the source code
COPY . .

# Expose the port for Gradio
EXPOSE 7860

# Set up entry point
CMD ["python", "gradio_demo.py", "--share", "--name", "flux-dev-fp8"] 