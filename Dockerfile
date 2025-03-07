FROM python:3.x-slim-buster
FROM public.ecr.aws/docker/library/python:3.12-bullseye
COPY /analytics /coworking
WORKDIR /coworking
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 5153
# Run the application when the container starts
CMD ["python", "app.py"]
