xhost + && docker run \
    --memory 14G \
    -e RAM=14 \
    --memory-swap 20G \
    -e CPU_STRING=16 \
    --cpus=16 \
    -it \
    --device /dev/kvm \
    -p 50922:10022 \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e "DISPLAY=${DISPLAY:-:0.0}" \
    sickcodes/docker-osx:monterey