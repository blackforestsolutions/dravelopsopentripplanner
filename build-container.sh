BASEDIR=$(dirname "$0")
# This script must be called with "sh build-container.sh $1 bw-fast"
PROJECT_NAME=bw
FEED_INFO=feed_info.txt
TRANSLATIONS=translations.txt

if [ $# != 0 ]; then
  PROJECT_NAME="$1"
  shift 1
fi
source $BASEDIR/projects/$PROJECT_NAME/config.sh

cd projects || exit
cd $DEPLOY_FOLDER || exit

#download gtfs
printf "\nStarting download Gtfs:"
for GTFS_SUPPLIER in ${!GTFS_SUPPLIERS[@]}; do
  GTFS_SUPPLY_LINK=${GTFS_SUPPLIERS[${GTFS_SUPPLIER}]}

  printf "\nStarting download $GTFS_SUPPLIER from link $GTFS_SUPPLY_LINK \n"
  curl $GTFS_SUPPLY_LINK -o "$GTFS_SUPPLIER.gtfs.zip"
  printf "\nFinished download. $GTFS_SUPPLIER was saved in $DEPLOY_FOLDER"

  printf "\nStarting to replace $FEED_INFO"
  if [[ `unzip -l $GTFS_SUPPLIER.gtfs.zip | grep $TRANSLATIONS` ]]; then
    printf "\n$GTFS_SUPPLIER.gtfs.zip has $TRANSLATIONS and consequently $FEED_INFO could not be replaced!"
    exit
  fi
  echo "feed_publisher_name,feed_publisher_url,feed_lang,feed_id" > $FEED_INFO
  echo "$GTFS_SUPPLIER,https://$GTFS_SUPPLIER.com,$LANGUAGE,$GTFS_SUPPLIER" >> $FEED_INFO
  zip $GTFS_SUPPLIER.gtfs.zip $FEED_INFO
  rm $FEED_INFO
  printf "\nSuccessfully replaced $FEED_INFO"

done
printf "\nSuccessfully downloaded Gtfs"

# download map material
printf "\nStarting download map material from $OSM_MAP:"
curl $OSM_MAP -O .
printf "\nSuccessfully downloaded map"

# build, tag and push container
printf "\nStarting to build, tag and push container to $REPOSITORY:$RELEASE_VERSION and $REPOSITORY:latest"
docker build -t $REPOSITORY:latest -t $REPOSITORY:$DEPLOY_FOLDER-$RELEASE_VERSION --build-arg "DEPLOY_FOLDER_BUILD_TIME=$DEPLOY_FOLDER" ../../

docker push $REPOSITORY:latest

docker push $REPOSITORY:$DEPLOY_FOLDER-$RELEASE_VERSION
printf "\nFinished to build, tag and push containers"

# run container
docker-compose up -d

printf "\nSuccessfully created OpenTripPlanner"