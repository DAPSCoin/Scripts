cd
echo "Checking for and Applying any available upgrades......"
sudo apt update && sudo apt upgrade -y
echo "Installing dependencies..."
sudo apt install build-essential libboost-dev libssl-dev -y
echo "Cloning Git Repo..."
git clone https://github.com/DAPSCoin/daps-seeder.git
echo "Building seeder..."
cd daps-seeder
make
echo "Installing to /usr/local/bin..."
sudo cp dnsseed /usr/local/bin
echo "Editing seeder service..."
nano contrib/init/daps-seeder.service
echo "Installing seeder service..."
sudo cp contrib/init/daps-seeder.service /etc/systemd/system/
echo "Starting seeder service..."
sudo systemctl start daps-seeder.service
sudo systemctl enable daps-seeder.service
echo "Done!"
