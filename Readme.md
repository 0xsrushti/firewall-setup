# 🔥 Task 4 – Setup and Use a Firewall on Linux (UFW)
**Author:** Jini Trivedi  
**Internship:** Cyber Security Internship  
**Repository:** task4-firewall-setup-jini  
**Objective:** Configure and test basic firewall rules to allow or block specific network traffic using **UFW (Uncomplicated Firewall)**.

---

## 🧱 Overview
A firewall is a network security system that monitors and controls incoming and outgoing traffic based on predetermined security rules.  
This task demonstrates how to use **UFW** on Linux to:
- Block insecure services (**Telnet – port 23**)
- Allow secure services (**SSH – port 22**)
- Test rule enforcement
- Restore firewall state after testing

---

## ⚙️ Tools & Environment
| Component | Details |
|------------|----------|
| **Operating System** | Kali Linux 2024 |
| **Firewall Tool** | UFW (Uncomplicated Firewall) |
| **Shell** | Zsh / Bash |
| **Verification Tools** | Telnet, Netcat (nc) |

---

## 🧩 Step-by-Step Implementation

### **1️⃣ Check Firewall Status**
```bash
sudo ufw status verbose

### **2️⃣ Enable Firewall**
sudo ufw enable

### **3️⃣ Allow SSH (Port 22)**
sudo ufw allow 22/tcp

### **4️⃣ Block Telnet (Port 23)**
sudo ufw deny 23/tcp

### **5️⃣ Verify All Rules**
sudo ufw status numbered

##**Example Output:**
Status: active

     To                         Action      From
     --                         ------      ----
[ 1] 22/tcp                     ALLOW IN    Anywhere
[ 2] 23/tcp                     DENY IN     Anywhere
[ 3] 22/tcp (v6)                ALLOW IN    Anywhere (v6)
[ 4] 23/tcp (v6)                DENY IN     Anywhere (v6)

### **6️⃣ Test the Firewall (Telnet Should Fail)**
telnet localhost 23
# OR
nc -vz localhost 23

### **Expected Output:**
Trying ::1...
Connection failed: Connection refused
Trying 127.0.0.1...
telnet: Unable to connect to remote host: Connection refused

### **7️⃣ Delete Test Rule (Restore Original State)**
sudo ufw delete deny 23/tcp

### **Output Example:**
Rule deleted
Rule deleted (v6)

### **8️⃣ Export Final Rules**
sudo ufw status numbered | sudo tee ufw_rules.txt

### **Example Saved Output (ufw_rules.txt):**
Status: active

     To                         Action      From
     --                         ------      ----
[ 1] 22/tcp                     ALLOW IN    Anywhere
[ 2] 22/tcp (v6)                ALLOW IN    Anywhere (v6)
