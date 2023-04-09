#/bin/bash

function yes_or_no {
    while true; do
        echo -n "$* [y/n]: "
        read decision
        case $decision in 
            [Yy]*)
                return 0
                ;;
            [Nn]*)
                return 1
                ;;
            *)
                echo "Input y or n"
                ;;
        esac
    done
}

function change_container_name {
    name=$1
    sed -e "s/container_name/$name/g" ./template/run.sh > ../run.sh
    sed -e "s/container_name/$name/g" ./template/start.sh > ../start.sh
    sed -e "s/container_name/$name/g" ./template/stop.sh > ../stop.sh
    sed -e "s/cantainer_name/$name/g" ./template/exec.sh > ../exec.sh
}

echo -n "Input container name: "
read name

if yes_or_no "Do you want to change the name of container $name?"; then
    echo "yes"
    change_container_name $name
    chmod 777 ../run.sh
    chmod 777 ../start.sh
    chmod 777 ../stop.sh
    chmod 777 ../exec.sh
else
    echo "Aborted"
fi
