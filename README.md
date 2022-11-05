# WP Metrics SVN mirror
Dockerized SVN server mirror of WordPress.org server

Your local mirror is available over http via WebDAV protocol.

Please note that an initial sync of the plugin repo will take a very long time (1+ weeks). But you can still use your 
partial sync for testing purposes (just Ctrl+C out of the process whenever you feel like you have enough plugins/themes 
for your purpose).

### Setup

```
docker-compose up
./scripts/initialize-repos.sh # Initializes mirror repos. They will be in ./svn-root
```

The cron job will update your plugins and themes according to the rules in `cron/sync`.

### Sync manually

Useful for initial sync. Don't worry about the cron jobs, they will time out after a while because the repo is locked by another process.

```
./scripts/sync-plugins.sh # Syncs plugins
./scripts/sync-themes.sh # Syncs themes
```

### Use your local mirror

###### Plugins

http://localhost:8080/svn/plugins/

##### Themes

http://localhost:8080/svn/themes/
