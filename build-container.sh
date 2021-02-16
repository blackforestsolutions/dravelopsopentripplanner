BASEDIR=$(dirname "$0")
# This script must be called with "sh build-container.sh $1 bw"
PROJECT_NAME=bw
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
done
printf "\nSuccessfully downloaded Gtfs"

# download map material
printf "\nStarting download map material from $OSM_MAP:"
curl $OSM_MAP -O .
printf "\nSuccessfully downloaded map"

# build, tag and push container
printf "\nStarting to build, tag and push container to $REPOSITORY:$RELEASE_VERSION and $REPOSITORY:latest"
docker build -t $REPOSITORY:latest -t $REPOSITORY:$RELEASE_VERSION ../../

docker push $REPOSITORY:latest

docker push $REPOSITORY:$RELEASE_VERSION
printf "\nFinished to build, tag and push containers"

# run container
docker-compose up

printf "\nSuccessfully created OpenTripPlanner"