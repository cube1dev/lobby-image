#! /bin/sh

if ! [ -f "ran.txt" ]; then
    echo "Modify sabre-config.json..."
    sed -i "s/{secret}/$VELOCITY_SECRET/" sabre-config.json
    echo "B" > ran.txt
fi

java -Xmx4G -jar sabre-1.0.0-all.jar