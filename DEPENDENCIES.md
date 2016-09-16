
# Para compilar..
# Dependencies: Ubuntu 14.xx/16.xx
sudo apt install libglew1.13 libglew-dev
sudo apt install freeglut3 freeglut3-dev
sudo apt install libwxgtk2.8-0 libwxgtk2.8-dev
# Compilando:
make

# Para atualizar a GUI
sudo add-apt-repository -y ppa:wxformbuilder/release
sudo apt-get update
sudo apt-get install wxformbuilder


# Outras libs..
sudo apt-get install libwxgtk3.0-0 libwxgtk-media3.0-0