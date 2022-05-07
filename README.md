# shadowsocks-rust configuration
First install `shadowsocks-rust` (you can also build it yourself) for more info go to [the official repo](https://github.com/shadowsocks/shadowsocks-rust).
## Server configuration (`ssserver`)
* Make sure to fill the required info in the config file before running `ssserver`.

    `<SHADOWSOCKS_PORT>` : The port which `ssserver` listens to.

    `<SECRET_PASSWORD>` : The password that `ssserver` uses to authenticate users.

* Run `ssserver` using the following command:
    ```
    ssserver -c server/conf_4.json
    ```
    note: if you want to support IPv6 run the server using `server/conf_4_6.json` instead.
## Client configuration
There are 2 types of clients that can connect to the shadowsocks server:
* Socks5 local client (`sslocal --protocol socks`)
* Tunnel local client (`sslocal --protocol tunnel`)
## Socks5 client (`socks`)
* Fill the required info before running `sslocal`.

    `<SHADOWSOCKS_SERVER_PUBLIC_IP>` : shadowsocks server Public IP address.

    `<SHADOWSOCKS_PORT>` : shadowsocks server port.

    `<LOCAL_PORT>` : The local port which the local socks server listens to.

    `<SECRET_PASSWORD>` : The password required by the shadowsocks server.

* Run `sslocal` by either passing all parameters via command line:
    ```
    # Pass all parameters via command line
    sslocal --protocol socks -b "0.0.0.0:<LOCAL_PORT>" -s "<SHADOWSOCKS_SERVER_PUBLIC_IP>:<SHADOWSOCKS_PORT>" -m "chacha20-ietf-poly1305" -k "<SECRET_PASSWORD>" -U --timeout 300
    ```
    or by referring to a config file:
    ```
    sslocal -c client/socks_proxy.json
    ```
## Tunnel client (`tunnel`)
* Fill the required info before running `sslocal`.

    `<SHADOWSOCKS_SERVER_PUBLIC_IP>` : shadowsocks server Public IP address.

    `<SHADOWSOCKS_PORT>` : shadowsocks server port.

    `<LOCAL_PORT>` : The local port which the local socks server listens to.

    `<SECRET_PASSWORD>` : The password required by the shadowsocks server.

    `<FORWARD_ADDRESS>` : The destination address relative to the shadowsocks server.

    `<FORWARD_PORT>` : The destination port.

* Run `sslocal` by either passing all parameters via command line:
    ```
    # Pass all parameters via command line
    sslocal --protocol tunnel -b "0.0.0.0:<LOCAL_PORT>" -f "<FORWARD_ADDRESS>:<FORWARD_PORT>" -s "<SHADOWSOCKS_SERVER_PUBLIC_IP>:<SHADOWSOCKS_PORT>" -m "chacha20-ietf-poly1305" -k "<SECRET_PASSWORD>" -U --timeout 300
    ```
    or by referring to a config file:
    ```
    sslocal -c client/tunnel.json
    ```
## REF
There are a lot of customizations that you can make to suit your needs for more info visit the `shadowsocks-rust` [repo](https://github.com/shadowsocks/shadowsocks-rust).
