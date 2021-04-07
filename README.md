git init
touch README.md
git add README.md 
git commit -m "first commit"
git branch -M main
git remote add origin git@github.com:rednaw/rednaw.github.io.git
git push -u origin main

git checkout -b source main
git add .
git commit -m "source files"
git push --set-upstream origin source

https://github.com/rednaw/rednaw.github.io/settings/branches -> change default branch to ‘source’


% Work on 'source' branch
% Publish to main branch using 'rake publish'
% This sort of breaks local clone, fix that via:
git fetch origin
git reset --hard origin/main

