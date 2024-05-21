Linux and Mac users - Joey Jr via terminal/shell

I've coded a short script to make joey access easier through the shell. 

to use, you need to make it executable, to do this type

chmod +x joey.sh

you'll need su access to write to the joey drive. You'll use the script like this:

Set Joey's mode to AUTO:
sudo ./joey.sh MODE AUTO

Set Joey's mode to GBA multicart block 0
sudo ./joey.sh MODE GBAM0

Update Joey's firmware:
sudo ./joey.sh MODE UPDATE FIRMWARE.JR

Update Joey's ROMLIST.RAW file
sudo ./joey.sh ROMLIST ROMLIST.RAW

Flash a ROM to a cart eg POKECRYSTAL.GBC 
sudo ./joey.sh ROM POKECYSTAL.GBC

Write a save file to a cart:
sudo ./joey.sh SRAM POKEGREEN.SAV
or
sudo ./joey.sh EEPROM POKEGREEN.SAV
or
sudo ./joey.sh FLASH POKEGREEN.SAV

You'll need to ensure you use the correct save type for the cart. We'll automate this in a future update. EEPROM type and Flash size are still defined in romlist

ROM and save dumping can still be done using the usual drag and drop, its really only for flashing and save writing that this script needs to be used. You can also use dd to get the rom from the joey, this isn't in the script but the seek address for rom read are the same as rom write.
