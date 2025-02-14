#!/bin/bash

#DATA_DIR=$1
DATA_DIR=/home/kwood/research/dune/2x2/module0_flow/data/proto_nd_flow/

HERE=`pwd`

cd ${DATA_DIR}

# simulated data file containing packets
curl -O https://portal.nersc.gov/project/dune/data/2x2/simulation/kwood_dev/proto_nd_flow_inputs/sim2x2_challenge_5xNuMIspills_ME_65E12POTperSpill_larndsim_mockdata_v1.h5 

# tile layout describing a *single* module (fix me)
curl -O https://portal.nersc.gov/project/dune/data/2x2/simulation/kwood_dev/proto_nd_flow_inputs/multi_tile_layout-2.3.16.yaml 

# 2x2 detector description
curl -O https://portal.nersc.gov/project/dune/data/2x2/simulation/kwood_dev/proto_nd_flow_inputs/2x2.yaml

# place holder for run list
curl -O https://portal.nersc.gov/project/dune/data/2x2/simulation/kwood_dev/proto_nd_flow_inputs/runlist-2x2-mcexample.txt

# place holder for light system geometry description
curl -O https://portal.nersc.gov/project/dune/data/2x2/simulation/kwood_dev/proto_nd_flow_inputs/light_module_desc-0.0.0.yaml

cd ${HERE}
