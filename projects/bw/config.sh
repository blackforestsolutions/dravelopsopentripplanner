DEPLOY_FOLDER=bw
RELEASE_VERSION=0.0.1-bw
OTP_VERSION=2.0.0
JAVA_OPTIONS="-Xmx26G"
REPOSITORY=blackforestsolutions/dravelopsopentripplanner
OSM_MAP="https://download.geofabrik.de/europe/germany/baden-wuerttemberg-latest.osm.pbf"

declare -A GTFS_SUPPLIERS=(
["SPNV"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten_mit_liniennetz/bwspnv.zip"
["NVH"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten_mit_liniennetz/nvh.zip"
["ubahn"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten_mit_liniennetz/bwsbahnubahn.zip"
["VAG-FR"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten_mit_liniennetz/vagfr.zip"
["VRN"]="http://www.vrn.de/opendata/sites/default/files/uploads/data/2021-01-04/vrn_gtfs_11.12.2020_0.zip"
["HVN"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten_mit_liniennetz/hnv.zip"
["VPE"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten-mit-liniennetz/vpe.zip"
["VVS"]="https://www.openvvs.de/dataset/e66f03e4-79f2-41d0-90f1-166ca609e491/resource/bfbb59c7-767c-4bca-bbb2-d8d32a3e0378/download/google_transit.zip"
["KVSH"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten_mit_liniennetz/kvsh.zip"
["VGC"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten_mit_liniennetz/vgc.zip"
["OstalbMobil"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten_mit_liniennetz/oam.zip"
["Fisland_Mobilitaetsverbund"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten_mit_liniennetz/filsland.zip"
["DING"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten_mit_liniennetz/ding.zip"
["bodo"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten_mit_liniennetz/bodo.zip"
["naldo"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten_mit_liniennetz/naldo.zip"
["VHB"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten_mit_liniennetz/vhb.zip"
["TUTicket"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten_mit_liniennetz/tuticket.zip"
["TGO"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten_mit_liniennetz/tgo.zip"
["VGF"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten_mit_liniennetz/vgf.zip"
#["Rexer"]="https://www.mobidata-bw.de/dataset/rexer-mitlinienverlauf-gtfs"
["HVG"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten_mit_liniennetz/ding.zip"
["SWHN"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten_mit_liniennetz/swhn.zip"
["SWEG"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten_mit_liniennetz/sweg.zip"
["SBG"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten_mit_liniennetz/sbg.zip"
["RVS"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten_mit_liniennetz/rvs.zip"
["RAB"]="https://www.mobidata-bw.de/dataset/rab-gtfs-mitlinienverlauf"
["VPE"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten_mit_liniennetz/vpe.zip"
["RBS"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten_ohne_liniennetz/rbs.zip"
["BlaBlaBus"]="https://api.idbus.com/gtfs.zip"
["Flixbus"]="http://data.ndovloket.nl/flixbus/flixbus-eu.zip"
["KVV"]="https://projekte.kvv-efa.de/GTFS/google_transit.zip"
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