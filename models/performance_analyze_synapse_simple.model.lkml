connection: "vbimspocevalsynapse"

# include all the views
include: "/views/**/*.view"

datagroup: performance_analyze_synapse_simple_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: performance_analyze_synapse_simple_default_datagroup

explore: customer {}

explore: date_dim {}

explore: item {}

explore: store {}

explore: store_returns {
  join:  customer{
    type: left_outer
    relationship: many_to_one
    sql_on: ${store_returns.sr_customer_sk} = ${customer.c_customer_sk} ;;
  }
  join:  date_dim{
    type: left_outer
    relationship: many_to_one
    sql_on: ${store_returns.sr_returned_date_sk} =  ${date_dim.d_date_sk};;
  }
  join:  item{
    type: left_outer
    relationship: many_to_one
    sql_on: ${store_returns.sr_item_sk} =  ${item.i_item_sk};;
  }
  join:  store{
    type: left_outer
    relationship: many_to_one
    sql_on: ${store_returns.sr_store_sk} =  ${store.s_store_sk};;
  }
}

explore: store_returns_bkp {}

explore: store_sales {
  join:  customer{
    type: left_outer
    relationship: many_to_one
    sql_on: ${store_sales.ss_customer_sk} = ${customer.c_customer_sk} ;;
  }
  join:  date_dim{
    type: left_outer
    relationship: many_to_one
    sql_on: ${store_sales.ss_sold_date_sk} =  ${date_dim.d_date_sk};;
  }
  join:  item{
    type: left_outer
    relationship: many_to_one
    sql_on: ${store_sales.ss_item_sk} =  ${item.i_item_sk};;
  }
  join:  store{
    type: left_outer
    relationship: many_to_one
    sql_on: ${store_sales.ss_store_sk} =  ${store.s_store_sk};;
  }
}

explore: store_sales_bkp {}

explore: time_dim {}

explore: web_page {}

explore: web_returns {
  join:  item{
    type: left_outer
    relationship: many_to_one
    sql_on: ${web_returns.wr_item_sk} =  ${item.i_item_sk};;
  }
  join:  web_page{
    type: left_outer
    relationship: many_to_one
    sql_on: ${web_returns.wr_web_page_sk} =  ${web_page.wp_web_page_sk};;
  }
}

explore: web_returns_bkp {}

explore: web_sales {
  join:  web_page{
    type: left_outer
    relationship: many_to_one
    sql_on: ${web_sales.ws_web_page_sk} =  ${web_page.wp_web_page_sk};;
  }
  join:  web_site{
    type: left_outer
    relationship: many_to_one
    sql_on: ${web_sales.ws_web_site_sk} =  ${web_site.web_site_sk};;
  }
}

explore: web_sales_bkp {}

explore: web_sales_partition {}

explore: web_sales_partition_bkp {}

explore: web_site {}
