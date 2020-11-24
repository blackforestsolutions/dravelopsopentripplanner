BASEDIR=$(dirname "$0")
source $BASEDIR/config.sh

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
    mkdir -p $REGION
    cd $REGION
    printf "\nStarting download $GTFS_SUPPLIER from link $GTFS_SUPPLY_LINK \n"
    curl $GTFS_SUPPLY_LINK -O /graphs/$GTFS_SUPPLIER
    cd ..
    cd ..
    printf "\nFinished download. $GTFS_SUPPLIER was saved in /graphs/$REGION"
done
printf "\nSuccessfully downloaded Gtfs"

#download map material
printf "\nStarting download map material Continent: $CONTINENT, Country: $COUNTRY, Region: $REGION"
cd graphs
mkdir -p $REGION
cd $REGION
curl $OSM_MAP -O /graphs/$REGION
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
