#!/bin/bash

workflow1='/global/cfs/cdirs/dune/users/kwresilo/ndlar_flow/yamls/module3_flow/workflows/charge/charge_event_building.yaml'
workflow2='/global/cfs/cdirs/dune/users/kwresilo/ndlar_flow/yamls/module3_flow/workflows/charge/charge_event_reconstruction.yaml'
workflow3='/global/cfs/cdirs/dune/users/kwresilo/ndlar_flow/yamls/module3_flow/workflows/light/light_event_building_adc64.yaml'
workflow4='/global/cfs/cdirs/dune/users/kwresilo/ndlar_flow/yamls/module3_flow/workflows/charge/charge_light_assoc.yaml'

charge_data='/global/cfs/cdirs/dune/www/data/Module3/run3/packet/tpc12/tpc12-packet-2023_03_16_02_54_CET.h5'
light_data='/global/cfs/cdirs/dune/www/data/Module3/run3/LRS/cosmic/0cd9414a_20230316_025421.data'

output_dir='/global/cfs/cdirs/dune/users/kwresilo/data/module3/' 
run='20230316_025421'
outfile='_matched.h5'

echo "RUNNING CHARGE RECO"
#run charge building and reco
h5flow --nompi -c $workflow1 $workflow2\
    -i ${charge_data} -o ${output_dir}${run}${outfile}

echo "RUNNING LIGHT RECO"
#run light reco
h5flow --nompi -c ${workflow3}\
    -i ${light_data}\
    -o ${output_dir}${run}${outfile}

echo "RUNNING MATCHING"
#run CL matching
h5flow -c ${workflow4}\
    -i ${output_dir}${run}${outfile}\
    -o ${output_dir}${run}${outfile}
