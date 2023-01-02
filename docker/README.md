关于







###3.

server { # 这是我们的服务器块。每当nginx收到客户端的请求时，它都会根据目标服务器名称、端口和其他相关信息确定应该处理哪个服务器块，匹配的服务器块决定nginx如何处理和响应请求。
    listen 443 ssl;
    listen [::]:443 ssl;        # 这意味着只有进入端口443的请求才能匹配此服务器块。
    server_name heimdall.*;     # 只有与heimdall.*匹配的目标地址才能匹配此服务器块。
    include /config/nginx/ssl.conf;   # 此指令在这里注入我们的ssl.conf文件的内容，该文件包含所有ssl相关设置（证书位置、使用的密码等）。
    client_max_body_size 0;           # 移除了上传的大小限制（默认为 1MB）。
    #启用ldap auth，在ldap.conf中填写ldap详细信息
    #include /config/nginx/ldap.conf; # 默认情况下已注释（禁用）。启用后，它将注入ldap.conf的内容，这是LDAP身份验证的必要设置。
    # enable for Authelia
    #include /config/nginx/authelia-server.conf;# 默认情况下已注释（禁用）。启用后，它将注入authelia-server.conf的内容，这是Authelia集成的必要设置。
location / {  # 位置块用于子文件夹或路径。匹配服务器块后，nginx将查看请求的子文件夹或路径，以匹配所选服务器块中的一个位置块。我们示例中的此特定块用于/因此它将匹配此地址的任何子文件夹或路径。
        #为http auth启用接下来的两行
        #auth_basic "Restricted";
        #auth_basic_user_file /config/nginx/.htpasswd;# 默认情况下已注释（禁用）。启用后，它将使用.htpasswd在允许访问之前执行用户/通行证身份验证。
        #启用ldap auth的下两行
        #auth_request /auth;
        #error_page 401 =200 /login;#  默认情况下已注释（禁用）。启用后，它将在允许访问之前使用LDAP身份验证。
        # 启用Authelia
        #include /config/nginx/authelia-location.conf;# 默认情况下已注释（禁用）。启用后，它将在允许访问之前使用Authelia身份验证。
        include /config/nginx/proxy.conf;# 注入proxy.conf的内容，其中包含代理连接中常见的各种指令和标头。
        resolver 127.0.0.11 valid=30s;# 当下一行将容器名称用作地址时，告诉nginx使用docker dns解析IP地址。
        set $upstream_app heimdall;
        set $upstream_port 443;
        set $upstream_proto https;
        proxy_pass $upstream_proto://$upstream_app:$upstream_port;
# 这是一个有点棘手的部分。通常，我们可以输入指令proxy_pass https://heimdall:443;并期望nginx通过其用作dns主机名的容器名称连接到Heimdall。虽然它大部分时间都有效，但nginx有一个烦人的习惯。在start期间，nginx检查proxy_pass语句中使用的所有dns主机名，如果其中任何一个无法访问，则拒绝启动。我们真的不希望一个停止的代理容器来阻止我们的网络服务器启动，所以我们用了一个技巧。
# 如果proxy_pass语句包含variable而不是dns hostname，nginx不会在开始时检查它是否可以访问。因此，我们在这里设置了3个变量，一个名为upstream_app，值为heimdall，一个名为$upstream_port，内部heimdall端口443，另一个名为$upstream_proto，值设置为https。我们使用这些变量作为proxy_pass指令中的地址。这样，如果heimdall容器因任何原因停机，nginx仍然可以启动。当使用变量而不是主机名时，我们还必须将解析器设置为上一行中的docker dns。
    }
 }



# 如果代理容器与SWAG不在用户定义的桥接网络中（可能在远程主机上，可以使用主机网络或macvlan），我们可以将$upstream_app的值更改为IP地址：set $upstream_app 192.168.1.10;
