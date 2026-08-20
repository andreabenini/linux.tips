# Configuration Hints

## Force to a fixed resolution
- Tag: `<video/>`,`<model/>`
- Add `<resolution/>` tag in it
  ```xml
  <video>
    <model type="virtio" heads="1" primary="yes" device="virtio-vga">
      <resolution x="1920" y="1080"/>
    </model>
  </video>
  ```
- Only add the `<resolution/>` tag, leave everything else as it is
