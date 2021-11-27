# Iptables for Turkey server

Adjusts incoming networks on your server only by location in Turkey.

## Installation

This only works on linux distributions. Change the package download command in the code content to your own distribution. "apt. eopkg. pacman"

```bash
git clone https://github.com/mhykoI/iptables-ayarlar-.git
cd iptables-ayarlar-
chmod +x iptables.sh
bash iptables.sh
```

## Usage

If you want to open it again to other countries other than Turkey. by typing iptables -F and iptables -X, you open incoming networks to all countries.

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
