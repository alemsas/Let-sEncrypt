
#!/bin/bash
echo "Updating"
apt update && apt upgrade -y


echo "Install curl and socat"
apt install curl socat -y

echo "Download and install the Acme"
curl https://get.acme.sh | sh
echo " Set Default Provider to Let's Encrypt"

~/.acme.sh/acme.sh --set-default-ca --server letsencrypt


echo "Enter Your Domain:"
read domain_name
echo "Enter Your Mail Address"
read mail_addr


echo "Register your account for a free SSL certificate"
~/.acme.sh/acme.sh --register-account -m  $mail_addr

echo "Register your account for a free SSL certificate"
~/.acme.sh/acme.sh --issue -d $domain_name --standalone

echo "Change Location Your Certificate"
~/.acme.sh/acme.sh --installcert -d $domain_name --key-file /root/private.key --fullchain-file /root/cert.crt
