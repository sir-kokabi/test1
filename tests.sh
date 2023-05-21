#!/bin/sh
# tests.sh

curl -sSL https://install.python-poetry.org | python3 -

# Install pyenv and its dependencies
curl https://pyenv.run | bash

# Add pyenv to the shell configuration file
echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc

# Restart the shell or source the configuration file
source ~/.bashrc

# Install the Python versions
pyenv install 3.8.0
pyenv install 3.9.0
pyenv install 3.10.0
pyenv install 3.11.0

# Define an array of Python versions to test with
PYTHON_VERSIONS=(3.8.0 3.9.0 3.10.0 3.11.0)

# Loop through each Python version
for PYTHON_VERSION in "${PYTHON_VERSIONS[@]}"
do

    pyenv local $PYTHON_VERSION

    # Switch to the Python version
    poetry env use $PYTHON_VERSION

    poetry install --with dev

    # Run poetry poe test with the current Python version
    poetry poe test

    # Save the exit status
    status=$?

    # If the exit status is non-zero, exit with the same status
    if [ $status -ne 0 ]; then
        exit $status
    fi
done

# Exit with zero status if all tests passed
exit 0
