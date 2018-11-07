#!/bin/bash

# If enabler.sh exists in any of the child directories, source them
for type in "aliases" "plugins" "completion"
do
	if [ -e "$type/enabler.sh" ]; then
		source "$type/enabler.sh"
	fi
done

