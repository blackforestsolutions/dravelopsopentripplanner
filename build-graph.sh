BASEDIR=$(dirname "$0")
#This script must be called with "sh build-graph.sh $1 bw"
PROJECT_NAME=bw
if [ $# != 0 ]; then
  PROJECT_NAME="$1"
  shift 1
fi
source $BASEDIR/projects/$PROJECT_NAME/config.sh

#Download otp version
printf "\nStarting download otp version $OTP_VERSION"
curl https://repo1.maven.org/maven2/org/opentripplanner/otp/$OTP_VERSION/otp-$OTP_VERSION-shaded.jar -O
printf "\nSuccessfully downloaded otp version $OTP_VERSION"

mkdir graphs

#download gtfs
printf "\nStarting download Gtfs:"
for GTFS_SUPPLIER in ${!GTFS_SUPPLIERS[@]}; do
  GTFS_SUPPLY_LINK=${GTFS_SUPPLIERS[${GTFS_SUPPLIER}]}
  cd graphs
  mkdir -p $DEPLOY_FOLDER
  cd $DEPLOY_FOLDER
  printf "\nStarting download $GTFS_SUPPLIER from link $GTFS_SUPPLY_LINK \n"
  curl $GTFS_SUPPLY_LINK -O /graphs/$DEPLOY_FOLDER
  cd ..
  cd ..
  printf "\nFinished download. $GTFS_SUPPLIER was saved in /graphs/$DEPLOY_FOLDER"
done
printf "\nSuccessfully downloaded Gtfs"

#download map material
printf "\nStarting download map material from $OSM_MAP"
cd graphs
mkdir -p $DEPLOY_FOLDER
cd $DEPLOY_FOLDER
curl $OSM_MAP -O /graphs/$DEPLOY_FOLDER
cd ..
cd ..
printf "\nSuccessfully downloaded map"

chmod 700 otp-$OTP_VERSION-shaded.jar

#Build the graph
printf "\nStart Build Graph with otp"
java $JAVA_OPTIONS -jar otp-$OTP_VERSION-shaded.jar --build graphs/$DEPLOY_FOLDER
printf "\nBuild Graph with otp was successful"

# build, start, tag and push container
docker-compose up -d

docker tag blackforestsolutions/dravelopsopentripplanner:latest

docker push blackforestsolutions/dravelopsopentripplanner:latest