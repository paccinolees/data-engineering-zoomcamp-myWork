# Start with slim Python 3.13 image
FROM python:3.13.10-slim

# Copy uv binary from official uv image
COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/

# Set working directory
WORKDIR /app

# Add virtual env to PATH
ENV PATH="/app/.venv/bin:$PATH"

# 1. Copy dependency files first (maximizes layer caching)
COPY pyproject.toml uv.lock .python-version ./

# 2. Install dependencies ONLY (skip installing the local project package since source isn't copied yet)
RUN uv sync --locked --no-install-project

# 3. Copy the rest of your application code (including your src/ directory and pipeline.py)
COPY . /app

# 4. Run uv sync again to install your local project package into the environment
RUN uv sync --locked

# Set entry point
ENTRYPOINT ["python", "ingest_data.py"]