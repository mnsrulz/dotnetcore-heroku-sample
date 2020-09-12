# dotnetcore-heroku-sample
A simple application built on .net core demonstrating how to deploy on Heroku platform using Docker containers.

Steps
1. Clone this repo
2. Create an application on Heroku and name it whatever you want
3. Generate an API key from Heroku account by visiting https://dashboard.heroku.com/account and under API Key section
4. Setup two github secrets by visiting https://github.com/{USER_NAME}/{REPO_NAME}/settings/secrets
   1. CREATE HEROKU_API_KEY and set the API key which you get from step 3
   2. CREATE HEROKU_APP_NAME and set the Heroku Application name created in Heroku from step 2

Once you follow the above steps you will then have to either manually trigger the Github action by visiting https://github.com/{USER_NAME}/{REPO_NAME}/actions or you can just push a change to your repo and the application will deploy automatically via Github Actions.
