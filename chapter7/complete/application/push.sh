git init && git add -A && git commit -m "initial push"
git config --global 'credential.https://source.developers.google.com.helper' gcloud.sh
git remote add google $1 #google https://source.developers.google.com/p/fd-gcp/r/fd-team-repo
gcloud auth login && git push --all google