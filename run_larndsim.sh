# run larnd-sim
inFile=$1
outFile=$2
DET=$3

if [ "${DET}" == "0" ]; then
simprop=singles_sim.yaml
#simprop=2x2_NuMI_sim.yaml
python3 simulate_pixels.py --input_filename "$inFile" \
    --output_filename "$outFile" \
    --detector_properties ../larndsim/detector_properties/2x2.yaml \
    --pixel_layout ../larndsim/pixel_layouts/multi_tile_layout-2.4.16.yaml \
    --response_file ../larndsim/bin/response_44.npy \
    --light_lut_filename ../larndsim/bin/lightLUT.npz \
    --light_det_noise_filename ../larndsim/bin/light_noise-2x2-example.npy \
    --simulation_properties ../larndsim/simulation_properties/${simprop}
elif [ "${DET}" == "1" ]; then
python3 simulate_pixels.py --input_filename "$inFile" \
    --output_filename "$outFile" \
    --detector_properties ../larndsim/detector_properties/module0.yaml \
    --pixel_layout ../larndsim/pixel_layouts/multi_tile_layout-2.3.16.yaml \
    --response_file ../larndsim/bin/response_44.npy \
    --light_lut_filename ../larndsim/bin/lightLUT.npz \
    --light_det_noise_filename ../larndsim/bin/light_noise-module0.npy \
    --simulation_properties ../larndsim/simulation_properties/singles_sim.yaml
else
echo "No detector corresponding to DET=${DET}"
fi
