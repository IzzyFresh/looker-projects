connection: "analytics-project"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: exploring_wifi_data_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: exploring_wifi_data_default_datagroup

explore: wireless_data_cleaned {}

