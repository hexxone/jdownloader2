# JDownloader 2 in Docker headless mode

Needs to be controlled via "MyJdownloader".

## Docker Compose

```yaml
  jdownloader2:
    container_name: jdownloader2
    image: kaycon/jdownloader2
    volumes:
      - ./cfg:/jdownloader/cfg
      - ./downloads:/root/Downloads
    restart: unless-stopped
```

Easiest way to set-up is by copying the `cfg`-folder files from a fully set-up JDownloader2 instance (e.g. your PC).

## Login to MyJDownloader

Required: `./cfg/org.jdownloader.api.myjdownloader.MyJDownloaderSettings.json`

```json
{
  "email": "deine-email@example.com",
  "password": "dein-passwort",
  "deviceName": "MeinJDownloader"
}
```

## Captcha Solver Settings (optional)

E.g.: For "2captchaa/rucaptcha": `./cfg/org.jdownloader.captcha.v2.solver.twocaptcha.TwoCaptchaConfigInterface.json`

```json
{
	"blackwhitelistingenabled": true,
	"apikey": "YOUR_CAPTCHA_API_KEY",
	"feedbacksendingenabled": true,
	"enabled": true,
	"threadpoolsize": 5
}
```

## Proxy List Settings (optional)

File: `./cfg/org.jdownloader.settings.InternetConnectionSettings.customproxylist.json`

- first item should be "default" connection (no Proxy - all null)

```json
[
	{
		"filter": null,
		"proxy": {
			"address": null,
			"password": null,
			"port": 80,
			"type": "NONE",
			"username": null,
			"connectMethodPrefered": false,
			"preferNativeImplementation": false,
			"resolveHostName": false
		},
		"enabled": false,
		"pac": false,
		"rangeRequestsSupported": true,
		"reconnectSupported": true
	},
	{
		"filter": null,
		"proxy": {
			"address": "server.com",
			"password": "Proxy-Pass",
			"port": 1337,
			"type": "HTTP",
			"username": "Proxy-User",
			"connectMethodPrefered": false,
			"preferNativeImplementation": false,
			"resolveHostName": false
		},
		"enabled": true,
		"pac": false,
		"rangeRequestsSupported": true,
		"reconnectSupported": false
	},
  // .... More entries
]
```
