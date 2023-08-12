# Docker Instructions

| Dockerfile/Containerfile | Explanation      |
|--------------------------|------------------|
| FROM          | We use “FROM” to specify the base image we want to start from
| RUN           | RUN is used to run commands during the image build process
| ENV           | Sets environment variables within the image, making them accessible both during the build process and while the container is running. If you only need to define build-time variables, you should utilize the ARG instruction
| COPY          | The COPY command is used to copy a file or folder from the host system into the docker image
| EXPOSE        | Used to specify the port you want the docker image to listen to at runtime
| ADD           | An advanced form of COPY instruction. You can copy files from the host system into the docker image. You can also use it to copy files from a URL into a destination in the docker image. In fact, you can use it to copy a tarball from the host system and automatically have it extracted into a destination in the docker image
| WORKDIR       | It’s used to set the current working directory
| VOLUME        | It's used to create or mount the volume to the Docker container
| USER          | Sets the user name and UID when running the container. You can use this instruction to set a non-root user of the container
| LABEL         | Specify metadata information of Docker image
| ARG           | Defines build-time variables using key-value pairs. However, these ARG variables will not be accessible when the container is running. To maintain a variable within a running container, use  ENV instruction instead
| CMD           | Executes a command within a running container. Only one CMD instruction is allowed, and if multiple are present, only the last one takes effect
| ENTRYPOINT    | Specifies the commands that will execute when the Docker container starts. If you don’t specify any ENTRYPOINT, it defaults to “/bin/sh -c”

---
