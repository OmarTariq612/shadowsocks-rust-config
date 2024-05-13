# shadowsocks configuration

To generate a password that can be accepted by both versions use the following command:

```
openssl rand -base64 <key_size>
```

* The `<key_size>` depends on the used encryption method, I'm using `2022-blake3-aes-128-gcm` so the appropriate `<key_size>` is 16.

* Use the generated key as the `password` or the `psk` (depending on the naming of the used version).

## Server configuration

* Fill the required configurations before running the server.

    `<SHADOWSOCKS_PORT>` : The port the server listens to.

    `<SECRET_PASSWORD>` : The password the server uses to authenticate users.

* Run
    * Rust:
        ```
        ssserver -c server/rust/server.json
        ```

    * Go:
        ```
        shadowsocks-go -confPath server/go/server.json
        ```

## Client configuration

### Socks5 client:

* Fill the required configuration before running the client

    `<SHADOWSOCKS_SERVER_PUBLIC_IP>` : shadowsocks server Public IP address.

    `<SHADOWSOCKS_PORT>` : shadowsocks server port.

    `<LOCAL_PORT>` : The local port which the local socks server listens to.

    `<SECRET_PASSWORD>` : The password required by the shadowsocks server.

* Run
    * Rust:
        ```
        sslocal -c client/rust/encrypted_socks.json
        ```

    * Go:
        ```
        shadowsocks-go -confPath client/go/encrypted_socks.json
        ```

### Tunnel client:

* Fill the required configuration before running the client

    `<SHADOWSOCKS_SERVER_PUBLIC_IP>` : shadowsocks server Public IP address.

    `<SHADOWSOCKS_PORT>` : shadowsocks server port.

    `<LOCAL_PORT>` : The local port which the local socks server listens to.

    `<SECRET_PASSWORD>` : The password required by the shadowsocks server.

    `<FORWARD_ADDRESS>` : The destination address relative to the shadowsocks server.

    `<FORWARD_PORT>` : The destination port.

* Run
    * Rust:
        ```
        sslocal -c client/rust/tunnel.json
        ```

    * Go:
        ```
        shadowsocks-go -confPath client/go/tunnel.json
        ```

## Ref

* The rust version: https://github.com/shadowsocks/shadowsocks-rust?tab=readme-ov-file#configuration
* The go version: https://github.com/database64128/shadowsocks-go/tree/main/docs
* shadowsocks specs: https://github.com/Shadowsocks-NET/shadowsocks-specs
