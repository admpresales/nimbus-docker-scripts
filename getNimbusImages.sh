#!/bin/bash

file="./nimbusImages.properties"
#while IFS= read -r line
while IFS=':' read -r image tag
do
	# Remove white spaces
	image=${image//[[:blank:]]/}
	tag=${tag//[[:blank:]]}

	# Ignore comments and empty lines
	if [[ ! $image == \#* ]] && [ ! -z "$image" ]; then
		printf '*********** Executing: docker pull admpresales/%s:%s ***********\n\n' "$image" "$tag"
		docker pull admpresales/"$image":"$tag"
		printf '\n*********** %s:%s Completed ***********\n\n' "$image" "$tag"
	fi
done <"$file"
