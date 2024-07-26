## Welcome to MQTT Secured Send-Receive!

Concept: We establish a pub and sub. Check for internet connectivity. If the internet is disabled, the messages being sent get saved in a file. Once connection re-established, the saved messages get sent back before the current real-time messages.

This allows for 0 Data-Loss.

Note: This program requires some installs & only runs on linux systems. (For windows users, run it with WSL2).

**$ sudo {replace with package manager name} install -y mosquitto mosquitto-clients**

If you're running a system that uses systemd, run the following:

**$ sudo systemctl restart mosquitto**

Take full responsibilities for the actions you do.