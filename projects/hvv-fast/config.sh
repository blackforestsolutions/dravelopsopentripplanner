DEPLOY_FOLDER=hvv-fast
RELEASE_VERSION=0.0.3
REPOSITORY=blackforestsolutions/dravelopsopentripplanner
OSM_MAP="https://download.geofabrik.de/europe/germany/hamburg-latest.osm.pbf"

declare -A GTFS_SUPPLIERS=(
["HVV"]="http://daten.transparenz.hamburg.de/Dataport.HmbTG.ZS.Webservice.GetRessource100/GetRessource100.svc/3343dbd9-807d-4019-a4ca-1df50946de07/Upload__HVV_Rohdaten_GTFS_Fpl_20211122_Uebergang.zip"
)

echo "RELEASE_VERSION is $RELEASE_VERSION"
echo "REPOSITORY is $REPOSITORY"
echo "OSM_MAP is $OSM_MAP"
echo "DEPLOY_FOLDER is $DEPLOY_FOLDER"

for GTFS_SUPPLIER in ${!GTFS_SUPPLIERS[@]}; do
    GTFS_SUPPLY_LINK=${GTFS_SUPPLIERS[${GTFS_SUPPLIER}]}
    echo "GTFS_SUPPLIER is $GTFS_SUPPLIER and link is $GTFS_SUPPLY_LINK"
done
