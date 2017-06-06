#!/bin/bash -e

# usage gp Polymer core-item [branch]
# Run in a clean directory passing in a GitHub org and repo name
org=$1
repo=$2
branch=${3:-"master"} # default to master when branch isn't specified

mkdir temp && cd temp
# make folder (same as input, no checking!)
#mkdir $repo
#git clone git@github.com:$org/$repo.git --single-branch
git clone "https://${GH_TOKEN}@${GH_REF}" --single-branch
# switch to gh-pages branch
#pushd $repo >/dev/null
git checkout --orphan gh-pages

# remove all content
git rm -rf -q .

# use bower to install runtime deployment   
#bower cache clean $repo # ensure we're getting the latest from the desired branch.
#git show ${branch}:bower.json > bower.json
#echo "{
#  \"directory\": \"components\"
#}
#" > .bowerrc
rm .gitignore

bower install

#bower install $org/$repo#$branch
#git checkout ${branch} -- demo
#rm -rf components/$repo/demo
#mv demo components/$repo/

# redirect by default to the component folder
#echo "<META http-equiv="refresh" content=\"0;URL=components/$repo/\">" >index.html

# send it all to github
git add -A .
git commit -am 'seed gh-pages'
git push -u origin gh-pages --force

#popd >/dev/null