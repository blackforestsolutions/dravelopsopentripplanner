DEPLOY_FOLDER=sbg-slow
RELEASE_VERSION=0.0.1
REPOSITORY=blackforestsolutions/dravelopsopentripplanner
OSM_MAP="https://download.geofabrik.de/europe/germany/baden-wuerttemberg/freiburg-regbez-latest.osm.pbf"

declare -A GTFS_SUPPLIERS=(
["SBG"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten_mit_liniennetz/sbg.zip"
)

echo "RELEASE_VERSION is $RELEASE_VERSION"
echo "REPOSITORY is $REPOSITORY"
echo "OSM_MAP is $OSM_MAP"
echo "DEPLOY_FOLDER is $DEPLOY_FOLDER"

for GTFS_SUPPLIER in ${!GTFS_SUPPLIERS[@]}; do
    GTFS_SUPPLY_LINK=${GTFS_SUPPLIERS[${GTFS_SUPPLIER}]}
    echo "GTFS_SUPPLIER is $GTFS_SUPPLIER and link is $GTFS_SUPPLY_LINK"
done
