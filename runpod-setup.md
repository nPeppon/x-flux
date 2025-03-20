# RunPod Deployment Guide

## Requirements
- RunPod account
- Docker installed locally (for building and pushing the image)

## Steps to Deploy

### 1. Build and Push the Docker Image

```bash
# Build the Docker image
docker build -t your-dockerhub-username/x-flux:latest .

# Log in to Docker Hub
docker login

# Push the image to Docker Hub
docker push your-dockerhub-username/x-flux:latest
```

### 2. Deploy on RunPod

1. Go to RunPod.io and log in
2. Click on "Deploy" and select a GPU template
3. In the "Container Image" field, enter `your-dockerhub-username/x-flux:latest`
4. Ensure the following:
   - HTTP Port is set to `7860`
   - Volume size is appropriate for your model files (at least 20GB recommended)
   - Select a GPU with enough VRAM for your model (16GB+ recommended)

5. Click "Deploy" to start your pod

### 3. Access Your Gradio Demo

Once the pod is running:
1. Access the pod's web interface via the provided URL
2. You'll see the Gradio interface for your Flux demo

## Environment Variables

If you need to update environment variables:

1. In RunPod, go to your pod's settings
2. Add/modify the following environment variables if needed:
   - `HF_TOKEN` - Your Hugging Face token
   - `PYTORCH_CUDA_ALLOC_CONF` - CUDA memory allocation settings

## Troubleshooting

- If you encounter CUDA/GPU issues, make sure your RunPod instance has the right GPU type
- Check pod logs for any startup errors
- Ensure the model can fit in your selected GPU's VRAM

## Optional Parameters for Gradio Demo

```bash
# To specify a different model:
python gradio_demo.py --name "your-model-name"

# To use CPU instead of GPU:
python gradio_demo.py --device "cpu"

# To specify a checkpoint directory:
python gradio_demo.py --ckpt_dir "/path/to/checkpoints"
``` 