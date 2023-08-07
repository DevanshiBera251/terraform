terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.39"
    }
  }
}

provider "snowflake" {
  role = "SYSADMIN"
  account = "MW00873.AP_SOUTHEAST_1.AWS"
  private_key_path = "~/.ssh/snowflake_tf_snow_key.p8"
  username = "T_SNOW"

}

resource "snowflake_database" "db" {
  name = "TF_DEMO"
}

resource "snowflake_warehouse" "warehouse" {
  name           = "TF_DEMO"
  warehouse_size = "large"
  auto_suspend   = 60
}