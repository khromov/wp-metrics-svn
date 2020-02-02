# WP Metrics SVN mirror
Dockerized SVN server mirror of WordPress.org server

Your local mirror is available over http via WebDAV protocol.

Please note that an initial sync of the plugin repo will take a very long time (1+ weeks).

### Setup

```
docker-compose up
./scripts/initialize-repos.sh # Initializes mirror repos. They will be in ./svn-root
./scripts/sync-plugins.sh # Syncs plugins
./scripts/sync-themes.sh # Syncs themes
```

### Use your local mirror

The login is: 

* Username: `admin`
* Password: `password`

###### Plugins

http://localhost:8080/svn/plugins/

##### Themes

http://localhost:8080/svn/themes/