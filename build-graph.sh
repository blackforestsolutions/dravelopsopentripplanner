OTP_VERSION=1.4.0
CONTINENT="europe"
COUNTRY="germany"
REGION="bw"
JAVA_OPTIONS="-Xmx2G"
REPOSITORY=blackforestsolutions/dravelopsopentripplanner:v$1

if [ -z $1 ]
then
  echo "ERROR: NO VERSION PARAMETER LIKE 1.0.0"
  exit
fi

declare -A GTFS_SUPPLIERS=( ["sbg"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten_mit_liniennetz/sbg.zip" )

#Download otp version
printf "\nStarting download otp version $OTP_VERSION"
curl https://repo1.maven.org/maven2/org/opentripplanner/otp/$OTP_VERSION/otp-$OTP_VERSION-shaded.jar -O
printf "\nSuccessfully downloaded otp version $OTP_VERSION"

mkdir graphs

#download gtfs
printf "\nStarting download Gtfs:"
for key in ${!GTFS_SUPPLIERS[@]}; do
    GTFS_SUPPLY_LINK=${GTFS_SUPPLIERS[${key}]}
    cd graphs
    mkdir -p $REGION
    cd $REGION
    printf "\nStarting download $GTFS_SUPPLIER from link $GTFS_SUPPLY_LINK \n"
    curl $GTFS_SUPPLY_LINK -O /graphs/$KEY
    cd ..
    cd ..
    printf "\nFinished download. $KEY was saved in /graphs/$REGION"
done
printf "\nSuccessfully downloaded Gtfs"

#download map material
printf "\nStarting download map material Continent: $CONTINENT, Country: $COUNTRY, Region: $REGION"
cd graphs
mkdir -p $REGION
cd $REGION
curl https://download.geofabrik.de/europe/germany/baden-wuerttemberg/freiburg-regbez-latest.osm.pbf -O /graphs/$REGION
cd ..
cd ..
printf "\nSuccessfully downloaded map"

chmod 700 otp-$OTP_VERSION-shaded.jar

#Build the graph
printf "\nStart Build Graph with otp"
java $JAVA_OPTIONS -jar otp-$OTP_VERSION-shaded.jar --build graphs/$REGION
printf "\nBuild Graph with otp was successful"

# build, start, tag and push container
docker-compose up -d

docker tag blackforestsolutions/dravelopsopentripplanner:latest $REPOSITORY

docker push $REPOSITORY
