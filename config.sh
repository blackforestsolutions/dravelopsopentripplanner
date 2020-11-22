OTP_VERSION=1.4.0
CONTINENT="europe"
COUNTRY="germany"
REGION="bw"
JAVA_OPTIONS="-Xmx2G"
REPOSITORY=blackforestsolutions/dravelopsopentripplanner:v$1
#
declare -A GTFS_SUPPLIERS=(
["HVN"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten_mit_liniennetz/hnv.zip",
["VPE"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten-mit-liniennetz/vpe.zip",
["VVS"]="https://www.openvvs.de/dataset/e66f03e4-79f2-41d0-90f1-166ca609e491/resource/bfbb59c7-767c-4bca-bbb2-d8d32a3e0378/download/google_transit.zip",
["KVSH"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten_mit_liniennetz/kvsh.zip",
["VGC"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten_mit_liniennetz/vgc.zip",
["OstalbMobil"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten_mit_liniennetz/oam.zip",
["Fisland_Mobilitaetsverbund"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten_mit_liniennetz/filsland.zip",
["DING"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten_mit_liniennetz/ding.zip",
["bodo"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten_mit_liniennetz/bodo.zip",
["naldo"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten_mit_liniennetz/naldo.zip",
["VHB"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten_mit_liniennetz/vhb.zip",
["TUTicket"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten_mit_liniennetz/tuticket.zip",
["TGO"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten_mit_liniennetz/tgo.zip",
["VGF"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten_mit_liniennetz/vgf.zip",
["Rexer"]="https://www.mobidata-bw.de/dataset/rexer-mitlinienverlauf-gtfs",
["HVG"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten_mit_liniennetz/ding.zip",
["SWHN"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten_mit_liniennetz/swhn.zip",
["SWEG"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten_mit_liniennetz/sweg.zip",
["SBG"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten_mit_liniennetz/sbg.zip",
["RVS"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten_mit_liniennetz/rvs.zip",
["RAB"]="https://www.mobidata-bw.de/dataset/rab-gtfs-mitlinienverlauf",
["VPE"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten_mit_liniennetz/vpe.zip",
["RBS"]="https://www.nvbw.de/fileadmin/user_upload/service/open_data/fahrplandaten_ohne_liniennetz/rbs.zip",
["BlaBlaBus"]="https://api.idbus.com/gtfs.zip",
["Flixbus"]="http://data.ndovloket.nl/flixbus/flixbus-eu.zip"
)

echo "OTP_VERSION is $OTP_VERSION"
echo "CONTINENT is $CONTINENT"
echo "COUNTRY is $COUNTRY"
echo "REGION is $REGION"
echo "JAVA_OPTIONS is $JAVA_OPTIONS"
echo "REPOSITORY is $REPOSITORY"
for GTFS_SUPPLIER in ${!GTFS_SUPPLIERS[@]}; do
    GTFS_SUPPLY_LINK=${GTFS_SUPPLIERS[${GTFS_SUPPLIER}]}
    echo "GTFS_SUPPLIER is $GTFS_SUPPLIER and link is $GTFS_SUPPLY_LINK"
done