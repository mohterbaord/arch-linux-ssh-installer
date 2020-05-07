# Arch Linux SSH Installer

## Getting Installer
```bash
$ git clone https://github.com/mohterbaord/arch-linux-ssh-installer.git
$ cd ./arch-linux-ssh-installer/
```

## Usage

### 1. ArchISO side preparing

#### 1.1. Connect to network

##### 1.1.a. Desktop (Ethernet):
```
root@archiso ~ # systemctl start dhcpd.service
```

##### 1.1.b. Laptop (Wi-Fi):
```
root@archiso ~ # wifi-menu
```

#### 1.2. Set password for `root`
```
root@archiso ~ # passwd root
```

#### 1.3. Start `sshd`
```
root@archiso ~ # systemctl start sshd.service
```

#### 1.4. Find out your IP if you do not know it
```
root@archiso ~ # ifconfig
```

#### 1.5. Deal with block devices you have
```
root@archiso ~ # lsblk
```

### 2. Writing `settings.conf`

Fill in `settings.conf`:
* The value `SSH_HOST` can be obtained via `ifconfig` output (see #1.4)

### 3. Running the Installer
```
$ make install
```
