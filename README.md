# **42 Brew**

42 (Paris)

### **Description**

**42 Brew** sets properly your **Homebrew** config, cloning it directly from the **[official repo](https://github.com/Homebrew/brew)**.

### **Usage**

Inside the **42 clusters** you can easily run:

+ to [set](set.sh)

```sh
curl -fsSL https://rawgit.com/gcamerli/42brew/master/set.sh | zsh
```

+ to [unset](unset.sh)

```sh
curl -fsSL https://rawgit.com/gcamerli/42brew/master/unset.sh | zsh
```

### **Packages**

A personal selection of useful **brew** packages:

+ tig
+ figlet
+ ttygif
+ valgrind
+ gdb

### **Note**

Homebrew data (`Temp` and `Cache`) are moved to `/tmp`, leaving your `$HOME` cleaner.

### **Credits**

+ [@kube](https://github.com/kube)

### **GPL License**

This work is licensed under the terms of **[GNU General Public License v3.0](https://www.gnu.org/licenses/gpl.html)**.
