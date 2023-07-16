sudo apt-get update
sudo apt-get install -y unzip xvfb libxi6 libgconf-2-4
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
google-chrome-stable -v
wget https://chromedriver.storage.googleapis.com/114.0.5735.16/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
sudo mv chromedriver /usr/bin/chromedriver
sudo chown root:root /usr/bin/chromedriver
sudo chmod +x /usr/bin/chromedriver
chromedriver -v
sudo apt install python3.8
python3 -v
sudo apt install python3-pip
pip3 install selenium
wget https://github.com/mozilla/geckodriver/releases/download/v0.33.0/geckodriver-v0.33.0-linux64.tar.gz
tar -xf geckodriver-v0.33.0-linux64.tar.gz
sudo mv geckodriver /usr/bin/geckodriver
sudo chown root:root /usr/bin/geckodriver
sudo chmod +x /usr/bin/geckodriver
geckodriver -v


