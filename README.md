## Summary
Docker container for my fork of [plex-export](https://github.com/blake1029384756/Plex-Export). Built on top of a php/apache container from [Team WebDevOps](https://dockerfile.readthedocs.io/en/latest/content/DockerImages/dockerfiles/php-apache.html). 


## Features

- Refreshes data on a specified interval


## Environment Variables

| Variable | Default | Examples | Description |
| --- | --- | --- | --- |
| `PLEX_URL` | `blank` | `http://172.16.0.3:32400` | Link to your plex server |
| `PLEX_TOKEN` | `blank` | `Gqs3tk86-6kgXcRoxVCK` | Token to authenticate to plex. See below for details |
| `PHP_DATE_TIMEZONE` | `America/Chicago` | `America/Chicago` | Timezone to use |
| `REFRESH_RATE` | `1800` | any number | How often to refresh the data (in minutes) |


## Instructions

- Get a plex token
  -  To get a valid token for your system, look here: https://support.plex.tv/hc/en-us/articles/204059436-Finding-your-account-token-X-Plex-Token
- Deploy container
  - ```yml
    version: "3.7"
    services:
        plex-export:
            image: plex-export:1.0.0
            container_name: plex-export
            hostname: plex-export
            restart: always
            ports:
            - "80:80"
            security_opt:
            - no-new-privileges:true
            environment:
            - PLEX_URL=url_here
            - PLEX_TOKEN=token_here
            - PHP_DATE_TIMEZONE=America/Chicago
            - REFRESH_RATE=300 # Minutes
    ```