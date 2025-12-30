# Home Assistant configuration, docs, files
## Installation
Installation methods:
- VM (buildroot, container manager, HA container, HA-AddOns containers)
- Container (you're on your own, HA Addons must be installed separately)  
  [Container Installation and Management Guide](./container.md), that's my current favorite

Deprecated methods:
- [Deprecation notice and updates](https://www.home-assistant.io/blog/2025/05/22/deprecating-core-and-supervised-installation-methods-and-32-bit-systems/)
- Core installation
  Your system in a Python environment (virtualenv), not to be confused with Container
- Supervised installation  
  Running your own operating system, then installing the Supervisor and other requirements on top of that
