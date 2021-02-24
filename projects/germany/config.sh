DEPLOY_FOLDER=germany
RELEASE_VERSION=0.0.1-germany
OTP_VERSION=2.0.0
JAVA_OPTIONS="-Xmx26G"
REPOSITORY=blackforestsolutions/dravelopsopentripplanner
OSM_MAP="https://download.geofabrik.de/europe/germany-latest.osm.pbf"

declare -A GTFS_SUPPLIERS=(
["germany"]="https://www.opendata-oepnv.de/fileadmin/datasets/delfi/20210219_fahrplaene_gesamtdeutschland_gtfs.zip"
)

echo "OTP_VERSION is $OTP_VERSION"
echo "RELEASE_VERSION is $RELEASE_VERSION"
echo "JAVA_OPTIONS is $JAVA_OPTIONS"
echo "REPOSITORY is $REPOSITORY"
echo "OSM_MAP is $OSM_MAP"
echo "DEPLOY_FOLDER is $DEPLOY_FOLDER"

for GTFS_SUPPLIER in ${!GTFS_SUPPLIERS[@]}; do
    GTFS_SUPPLY_LINK=${GTFS_SUPPLIERS[${GTFS_SUPPLIER}]}
    echo "GTFS_SUPPLIER is $GTFS_SUPPLIER and link is $GTFS_SUPPLY_LINK"
done