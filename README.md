# Portfolio - Loan PETIT

This portfolio is available online at <https://loanpetit.com>, check it out.

## Contact me

The preferred way of contacting me is to send me an email at <petit.loan1@gmail.com>.

Here are some other places where you can find me at:

**LinkedIn**: <https://www.linkedin.com/in/loanpetit/>

**Malt**: <https://www.malt.fr/profile/loanpetit>

## Application deployment

Thanks to GitHub Actions the deployment process is fully automatized.
It triggers when something is pushed onto master.

The application is deployed to an AWS EC2 instance using Docker images saved in
[petitloan/portfolio](https://hub.docker.com/r/petitloan/portfolio) Docker Hub public repository.

When the deployment is finised, the following containers should be running on the hosting server.

- **NGINX web server**: Based on petitloan/portfolio:nginx
- **Flutter application**: Based on petitloan/portfolio:flutter
- **Certbot for Let's Encrypt certificates administration**: Based on certbot/certbot
