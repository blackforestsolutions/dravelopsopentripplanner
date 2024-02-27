DEPLOY_FOLDER=hvv-slow
RELEASE_VERSION=0.0.3
REPOSITORY=blackforestsolutions/dravelopsopentripplanner
OSM_MAP="https://download.geofabrik.de/europe/germany/hamburg-220101.osm.pbf"

declare -A GTFS_SUPPLIERS=(
["HVV"]="https://daten.transparenz.hamburg.de/Dataport.HmbTG.ZS.Webservice.GetRessource100/GetRessource100.svc/7bb261f5-16d1-4cdd-a803-95613cce44f1/Upload__hvv_Rohdaten_GTFS_Fpl_20240201.ZIP"
)

echo "RELEASE_VERSION is $RELEASE_VERSION"
echo "REPOSITORY is $REPOSITORY"
echo "OSM_MAP is $OSM_MAP"
echo "DEPLOY_FOLDER is $DEPLOY_FOLDER"

for GTFS_SUPPLIER in ${!GTFS_SUPPLIERS[@]}; do
    GTFS_SUPPLY_LINK=${GTFS_SUPPLIERS[${GTFS_SUPPLIER}]}
    echo "GTFS_SUPPLIER is $GTFS_SUPPLIER and link is $GTFS_SUPPLY_LINK"
done
