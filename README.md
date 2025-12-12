# 🔥 Stale Port Cleanup

Sometimes Docker crashes or forgets to release ports, leaving behind **ghost docker-proxy processes** that keep ports like `3306`, `8080`, or any other port stuck in “address already in use” mode.  

This script helps you identify and clean these stale port bindings safely.

---

## 🚀 Why This Happens

Docker can leave ports stuck when:

- A container crashes
- A container is removed without proper cleanup
- Docker restarts unexpectedly
- System shutdown interrupts Docker
- You previously mapped a port like `3306:3306`

When this happens, the port stays busy even though **no container is using it**.  
This script fixes that.

---

## 🛠️ How It Works

1. Checks what process is using the port  
2. Detects ghost `docker-proxy` processes  
3. Kills them safely  
4. Restarts Docker to refresh all port mappings  

---

## 📌 Manual Steps (If You Want to Do It Yourself)

### **1. Check what’s using the port**
```bash
sudo ss -ltnp | grep <port_number>
```
Example Output
users:(("docker-proxy",pid=2550,fd=7))
2. Kill the ghost process
```bash
sudo kill -9 <pid_number>
```
3. Restart Docker
```bash
sudo systemctl restart docker
```
