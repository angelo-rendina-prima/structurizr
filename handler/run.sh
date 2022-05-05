set -ex

while true; do
    # git pull origin master
    INPUT=$(nc -l 6113)
    NAME=$(echo $INPUT | head -n 1)
    CONTENT=$(echo $INPUT | tail -n +2)
    echo $CONTENT > "structurizr/$NAME"

    git add .
    git commit -m "Ciao mamma"
    # git push origin master
done
