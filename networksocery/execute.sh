pnpm i -g pm2

pm2 delete network-sorcery

pm2 start src/server.js --name network-sorcery -f

# Write your code here
#!/bin/bash

# Redirect requests from https://api.jokes.bashaway.sliitfoss.org to http://localhost:3000
iptables -t nat -A OUTPUT -p tcp --dport 443 -d api.jokes.bashaway.sliitfoss.org -j DNAT --to-destination localhost:3000
