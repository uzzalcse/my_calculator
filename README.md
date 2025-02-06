

# Run the following command to start the GitLab Runner container:
```
docker run -d --name gitlab-runner --restart always \
  -v /srv/gitlab-runner/config:/etc/gitlab-runner \
  gitlab/gitlab-runner:latest

```

# Register the GitLab Runner

```
docker exec -it gitlab-runner bash
```

Then `bash` will be opened then you go to the add runner page in the gitlab localhost and you will get the following command copy and paste it to the bash shell

```
gitlab-runner register  --url http://localhost:8000  --token glrt-t3_QzVg3qFK7QcKUxu3VJoU
```

After that follow the on screen instruction to complete runner registration