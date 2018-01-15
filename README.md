# API Proxy Test

`h local rails s`

Local request:

`curl http://localhost:3000/home/index | jq .`

Remote request to support-api-staging:

`curl http://localhost:3000/health | jq .`
