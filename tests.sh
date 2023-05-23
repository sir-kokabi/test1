#!/bin/sh
# testddds.sh

poetry install --with dev  

# Run poetry poe test with the current Python version
poetry poe test

# Save the exit status
status=$?

# If the exit status is non-zero, exit with the same status
if [ $status -ne 0 ]; then
    exit $status
fi

# Exit with zero status if all tests passed
exit 0
