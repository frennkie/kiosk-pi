# kiosk-pi

### install basic tools and update os

```
curl -sSL https://github.com/frennkie/kiosk-pi/raw/master/01_install-os-basics.sh | bash
```

git clone https://github.com/frennkie/kiosk-pi.git

``` 
cd kiosk-pi
./02_install-x11-basics.sh
./03_add-user.sh
./04_setup-x11.sh
``` 


### Printing the IP on boot is set up: `/etc/rc.local`

```
# Print the IP address
_IP=$(hostname -I) || true
if [ "$_IP" ]; then
  printf "My IP address is %s\n" "$_IP"
fi
``` 

### Change boot behaviour: `/boot/config.txt` (also possible via raspi-config)

append this to remove rainbow splash on boot

```
# Suppress splash
disable_splash=1
```

### Update `/boot/cmdline.txt`

change / add:

```
console=tty3 loglevel=3 vi.global_cursor_default=0
```

