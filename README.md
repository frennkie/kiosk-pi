# kiosk-pi

## install basic tools and update os

Run `either` this script (which will install vim and git)

```
curl -sSL https://github.com/frennkie/kiosk-pi/raw/master/01_install-os-basics.sh | bash
```

`OR` this one (which will **not** install vim and git)

```
curl -sSL https://github.com/frennkie/kiosk-pi/raw/master/01s_install-os-basics.sh | bash
```


### get complete git repo

```
git clone https://github.com/frennkie/kiosk-pi.git
```

`OR`

```
wget https://raw.githubusercontent.com/frennkie/kiosk-pi/master/02_install-x11-basics.sh
wget https://raw.githubusercontent.com/frennkie/kiosk-pi/master/03_add-user.sh
wget https://raw.githubusercontent.com/frennkie/kiosk-pi/master/04_setup-x11.sh
wget https://raw.githubusercontent.com/frennkie/kiosk-pi/master/kiosk.sh
wget https://raw.githubusercontent.com/frennkie/kiosk-pi/master/screen_off.sh
wget https://raw.githubusercontent.com/frennkie/kiosk-pi/master/screen_on.sh
```

### run the scripts

``` 
cd kiosk-pi
./02_install-x11-basics.sh
./03_add-user.sh
./04_setup-x11.sh
``` 

### Basic setup done!

## Customize

### What is run is configured in `/home/kiosk/kiosk.sh`

### Printing the IP on boot is set up in `/etc/rc.local`

```
# Print the IP address
_IP=$(hostname -I) || true
if [ "$_IP" ]; then
  printf "My IP address is %s\n" "$_IP"
fi
``` 

### Change boot behaviour in `/boot/config.txt` (also possible via raspi-config)

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

