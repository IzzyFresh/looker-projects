connection: "analytics-project"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: gen_ai_data_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: gen_ai_data_default_datagroup

explore: aggregate {}

explore: all_wireless_data {}

explore: low_performing {}
