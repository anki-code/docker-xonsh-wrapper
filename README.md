**xonsh-docker-wrapper** shows the way to wrap an app (e.g. server) using [xonsh shell](https://xon.sh/contents.html) to:
 * catching the signals from docker
 * doing work before starting the app
 * doing work after stopping the app

To achieve this install xonsh in the container and use `run.xsh` as an entrypoint.

## Build and run the demo container

```shell script
docker build . -t local/xonsh-docker-wrapper
docker run --rm -it local/xonsh-docker-wrapper
```

## Example
```shell script
$ docker run --rm -it local/xonsh-docker-wrapper
[Work before running the app]
The app just sleep 2 minutes zZzZzZz...
                # Run docker stop, docker restart or press Ctrl+C
CATCH: signum=15, stopping the process...            
                # After getting closing signal the app could take time 
                # to stopping (closing the database, clean the memory) 
                # and we're waiting the ending before doing final work.
[Work after running the app or getting stop signals]
```