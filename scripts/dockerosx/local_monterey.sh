xhost + && docker run -it \
    --memory 14G \
    --memory-swap 20G \
    --cpus=16 \
    --device /dev/kvm \
    -p 50922:10022 \
    -e GENERATE_UNIQUE=true \
    -e WIDTH=1600 \
    -e HEIGHT=900 \
    -v "${PWD}/osximg/mac_hdd_ng.img:/image" \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e "DISPLAY=${DISPLAY:-:0.0}" \
    sickcodes/docker-osx:naked