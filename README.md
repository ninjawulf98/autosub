Usage

Create empty config.properties in /path/to/config/ (Or copy existing file) . This will keep the config.properties save, even if you delete the container.


docker run -d -p 9960:9960 -v /path/to/your/mediafiles:/series -v /path/to/config/config.properties:/opt/autosub-master/config.properties --name Autosub bamischijf/autosub

Once the container is running, open your browser and go to http://your_docker_host:9960. Set the "Series Folder" to: /series (Or w/e you used in the docker run command)
