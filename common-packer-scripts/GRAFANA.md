If you see this from the browser, then the browser may be too 'old' - e.g. running browser on SLackware (even 15.0) :

```bash

If you're seeing this Grafana has failed to load its application files

1. This could be caused by your reverse proxy settings.

2. If you host grafana under subpath make sure your grafana.ini root_url setting includes subpath. If not using a reverse proxy make sure to set serve_from_sub_path to true.

3. If you have a local dev build make sure you build frontend using: yarn start, or yarn build

4. Sometimes restarting grafana-server can help

5. Check if you are using a non-supported browser. For more information, refer to the list of supported browsers.
```