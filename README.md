## Summary
Docker container for my fork of [plex-export](https://github.com/blake1029384756/Plex-Export). Built on top of a php/apache container from [Team WebDevOps](https://dockerfile.readthedocs.io/en/latest/content/DockerImages/dockerfiles/php-apache.html). 

![](images/Plex-Export.gif)


## Features

- Refreshes data on a specified interval
- Provides an overview of all media in each of your library sections
- Images are lazy loaded as you scroll down
- Live filtering within each section
- View additional item information on click



## Usage

- Create the `docker-compose.yml`:
  - ```yml
    version: "3.7"
    services:
        plex-export:
            image: blake0192/plex-export:latest
            container_name: plex-export
            hostname: plex-export
            restart: always
            ports:
            - "8080:80"
            security_opt:
            - no-new-privileges:true
            environment:
            - PLEX_URL=url_here
            - PLEX_TOKEN=token_here
            - PHP_DATE_TIMEZONE=America/Chicago
            - REFRESH_RATE=5m
    ```
- Start the container: `docker-compose -f docker-compose.yml up -d`


## Environment Variables

| Variable | Default | Optional |
| --- | --- | --- |
| `PLEX_URL` | `blank` | No |
| `PLEX_TOKEN` | `blank` | No |
| `PLEX_SECTIONS` | `all` | Yes |
| `PLEX_SORT_SKIP_WORDS` | `""` | Yes |
| `REFRESH_RATE` | `60m` | Yes |
| `PHP_DATE_TIMEZONE` | `America/Chicago` | Yes |



#### PLEX_URL
It's recommended to use the internal URL in the format: `http://Plex_Media_Server_IP:Port`
> ```sh 
> PLEX_URL=http://192.168.1.100:32400
> ```

#### PLEX_TOKEN
The token to authenticate Plex-Export with your Plex Media Server
> ```sh 
> PLEX_TOKEN=XXX
> ```
> To find the token visit https://support.plex.tv/articles/204059436-finding-an-authentication-token-x-plex-token


#### PLEX_SECTIONS
The Plex-libraries you want to display
> E.g.: You have three libraries Movies, Tvshows and Videos, but you only want to display Movies and Tvshows.
> ```sh 
> PLEX_SECTIONS=Movies,Tvshows
> ```

#### PLEX_SORT_SKIP_WORDS 
If you want to leave out certain words like "the" or "a" when sorting the website.
> ```sh 
> PLEX_SORT_SKIP_WORDS=a,the
> ```

#### REFRESH_RATE
Sets the interval on how often the plex data is refreshed. 
**WARNING:** Setting this option on a low value can cause strain on your server!

> | parameter| Explanation| Example|
> | ------ | ------ |------ |
> | s| seconds | 30s |
> | m| minutes | 5m |
> | h| hours | 3h |
> | d | days | 2d |

> ```sh 
> REFRESH_RATE=3h
> ```


