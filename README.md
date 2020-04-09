# Flutter portfolio - Loan PETIT

This portfolio is one of my old personal websites. It's not available online anymore. Nevertheless, feel free to check out the source code of the current one at https://github.com/loan-petit/mysite. 

This website is based on Flutter, with web support enabled.

## Try the application in the browser

Please install Docker and docker-compose before running the following command.
([Get started with Docker](https://www.docker.com/get-started/))

```bash
docker-compose up -d
```

This command may take some time as it builds the whole app.
When it finishes, you can go to <http://localhost:80/> and try the website.

The following containers should be created:
- **NGINX web server**: Based on petitloan/portfolio:nginx
- **Flutter application**: Based on petitloan/portfolio:flutter
- **Certbot for Let's Encrypt certificates administration**: Based on certbot/certbot
