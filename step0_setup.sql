use role sysadmin;
create database if not exists MYDB;
use database MYDB;
create schema if not exists AUDIO_TRANSCRIPTION_SCH;
use schema AUDIO_TRANSCRIPTION_SCH;
CREATE COMPUTE POOL if not exists audio_processing_cp_data_download
  MIN_NODES = 1
  MAX_NODES = 1
  INSTANCE_FAMILY = CPU_X64_M
  INITIALLY_SUSPENDED = TRUE
  AUTO_RESUME = TRUE
  AUTO_SUSPEND_SECS = 300;
CREATE COMPUTE POOL if not exists audio_processing_cp_gpu_nv_s_5_nodes
  MIN_NODES = 5
  MAX_NODES = 5
  INSTANCE_FAMILY = GPU_NV_S
  INITIALLY_SUSPENDED = TRUE
  AUTO_RESUME = TRUE
  AUTO_SUSPEND_SECS = 300;

CREATE OR REPLACE NETWORK RULE allow_all_rule
MODE= 'EGRESS'
TYPE = 'HOST_PORT'
VALUE_LIST = ('0.0.0.0:443','0.0.0.0:80');

CREATE OR REPLACE EXTERNAL ACCESS INTEGRATION allow_all_integration
ALLOWED_NETWORK_RULES = (allow_all_rule)
ENABLED = true;