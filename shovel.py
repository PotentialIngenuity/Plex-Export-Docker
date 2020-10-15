import os
import json
from shovel import task

PLEX_TAG = '1.0.0'

@task
def build_image(tag=PLEX_TAG):
    """ Use Docker to build the Plex Export Image.
    """
    os.system(f"""docker build \
        --tag=plex-export:{tag} \
        --file=dockerfiles/plex-export.Dockerfile \
    .""")