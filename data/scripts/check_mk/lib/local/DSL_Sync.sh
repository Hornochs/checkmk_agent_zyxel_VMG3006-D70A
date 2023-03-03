# Fail on error
set -o errexit

# ================
# CONFIGURATION
# ================
# Data
DATA=

# ================
# FUNCTIONS
# ================
# Read value matching key from data
# @param $1 Key
# @param $2 Data | Optional
read_value() {
  _key="$1"
  _data="${2:-$DATA}"

  printf '%s\n' "$_data" \
    | grep "$_key" \
    | sed -e 's#.*=\(\)#\1#'
}

# ================
# MAIN
# ================
{
  # Read data
  DATA="$(/bin/dsl-tool iadtool)"

  # Read values
  _ActualDataRateUS="$(read_value 'ActualDataRateUS')"
  _ActualDataRateDS="$(read_value 'ActualDataRateDS')"
  # ...

  # Print values
  #printf 'ActualDataRateUS is %d\n' "$_ActualDataRateUS"
  #printf 'FirmwareVersion is %s\n' "$_FirmwareVersion"
  # ...n
  printf 'P "DSL Sync" DownStream='"$_ActualDataRateDS"';270000000:280000000;260000000:280000001;0;280000000|UpStream='"$_ActualDataRateUS"';43000000:44000000;42000000:44000001;0;44000000 DSLSync'
}
