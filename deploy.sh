#!/usr/bin/env sh
# abort on errors
set -e
# build
npm run serve
# navigate into the build output directory
cd dist
# if you are deploying to a custom domain
# echo 'www.example.com' > CNAME
git init
git add -A
git commit -m 'deploy'
git push -f git@github.com:DaniOP30/prac_pokedex.git master:gh-pages
cd -