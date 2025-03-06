# Multi-Node, multi-GPU Audio Transcription using Snowflake ML Container Runtime

This repo shows how we can use ML Container runtime to perform multi-node, multi-gpu audio transcription over multiple audio files in a snowflake stage. In this demo, we use a GPU compute pool with 5 GPU_NV_S nodes and use `openai/whisper-large-v3` whisper model.

### Setup instructions
1. Run `step0_setup.sql` to setup basic objects.
2. Import `Audio Processing - Setup.ipynb` as a container based Snowflake notebook, select a warehouse and choose `audio_processing_cp_data_download` compute pool created in the above step. Use the external access integration `allow_all_integration` which will download the audio files.
3. Import `Audio Processing - Distributed Inferencing.ipynb` as a container based Snowflake notebook, select a warehouse and choose `audio_processing_cp_gpu_nv_s_5_nodes` compute pool in the above step. Use the external access integration `allow_all_integration` which will be used to download the `openai/whisper-large-v3` model.
4. Run `Audio Processing - Setup.ipynb` and that notebook will download the audio files from `LibriSpeech ASR corpus` as noted here: https://www.openslr.org/12. The notebook also puts these audio files in a snowflake internal stage named `AUDIO_FILES_STAGE`. 
5. Run `Audio Processing - Setup.ipynb` and that notebook will create a Ray cluster scaled upto 5 nodes, run distributed multi-node, multi-GPU audio transcription and write data to Snowflake using Snowflake APIs.

### Special Thanks
Special thanks to Dan An (da.an@snowflake.com) for helping making this work. Snowflake ML Engineering rocks :)