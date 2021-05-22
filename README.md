# Dockerfile-for-conda-with-opencv-and-vips
Minimal Dockerfile to automatically install conda environment and set Python interpreter to installed conda environment with Linux dependencies for OpenCV and Vips

To use:
1. Copy this Dockerfile into your repository
2. Export the current conda environment you are using via `conda env export > env.yml`
3. Add the files that you need to run your application
4. Run Docker build: `docker build . --tag <image_name>`
    - this will automatically install the `env.yml` that you have exported and set then Python interpreter path to the install conda environment created via the `env.yml` when Docker image is started up
5. Run your Docker image
