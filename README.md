# JDownLoader 2 in Docker
## Compose
```
  jdownloader2:
    container_name: jdownloader2
    image: kaycon/jdownloader2
    volumes:
      - ./cfg:/jdownloader/cfg
      - ./downloads:/root/Downloads
    restart: unless-stopped
```

## Login to MyJDownloader
./cfg/org.jdownloader.api.myjdownloader.MyJDownloaderSettings.json
```
{
  "email": "deine-email@example.com",
  "password": "dein-passwort",
  "deviceName": "MeinJDownloader"
}
```
