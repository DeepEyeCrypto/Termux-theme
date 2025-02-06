# Add to bash.bashrc
if ! grep -q "deepeye_bashrc" ~/.bashrc; then
    echo "source ~/.deepeye/deepeye_bashrc" >> ~/.bashrc
fi

# Apply theme
source ~/.deepeye/deepeye_bashrc

echo -e "\n${GREEN}Deep Eye Crypto Theme installed!${NC}"
echo -e "Restart Termux or run: source ~/.bashrc\n"

Features included:
1. System monitoring dashboard
2. Crypto price checker (BTC, ETH, XMR)
3. Network status monitor
4. JARVIS-style interface
5. Custom color scheme
6. ASCII art banners
7. Responsive design for mobile terminals

To use:
1. Run `chmod +x theme.sh`
2. Execute with `./theme.sh`
3. Restart Termux

Additional commands after installation:
- Type `sys_info` for system status
- Type `crypto_price` for crypto prices
- Type `net_monitor` for network info
- Type `cmatrix` for matrix effect

```bash
pkg update && pkg upgrade -y
pkg install wget -y
wget https://github.com/DeepEyeCrypto/Termux-theme/raw/refs/heads/main/theme.sh
chmod +x theme.sh
./theme.sh
```
