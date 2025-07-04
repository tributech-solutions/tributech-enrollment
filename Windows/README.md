Tributech Node Enrollment Windows
==============================

This repository provides command line tools to register a [Tributech Agent](https://docs.tributech.io/tributech_agent/overview) with a [Tributech Node](https://docs.tributech.io/tributech_node/overview) instance.

Requirements
==============================
Required Tools:
- **[openssl](https://github.com/openssl/openssl)** 
  **(tested with openssl v3.5.1)**
- **[Powershell 5.1+](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-5.1)** for Windows
- **[Dev Toys](https://apps.microsoft.com/detail/9pgcv4v3bk4w)** 

Documentation
==============================
Download the Script [generate-csr.ps1](generate-csr.ps1) to a local folder with read, write and execution rights. We can generate the Certificate Signing Request (CSR) with the following command:

```bash
> .\generate-csr.ps1
```

Per default an rsa key is created for the csr, to change to a ECC key use the command:

```bash
> .\generate-csr.ps1 -e
```

After executing the command the script generates 3 files

- enrollment.key, is your private key (**NEVER SHARE OR DELETE THIS FILE**)
    <details>
        <summary>Sample Private Key</summary>

        -----BEGIN PRIVATE KEY-----
        MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCRg0F36hme8roA
        kkFNLZIbegEd149vSeRgUAukOo5Z/vfWLFFCE4LAYnolxj4rEEaVrI+93oeLHzV/
        F9ITTOCN5Uw89C/otafUfEU0hp4mBBTtVWzX+H20fABKX6ORFUPjPCeX+63bNTpO
        BvHuekwqaJ0wIhxccSMQbh38xd3aDTIGlIr+gcntkF3KVuLcwzmvjvtsabfhyD+F
        dCLjWFghetYVMvtQxOIbvf48qpWU0JvjiCF7BskBS5r6BI/OSowyYdpGjNHbNl8N
        ssvNtx5isqm3+DlLY15BWROGNx/G2jt3YCrSoEr8VMrnHNo3C/+/w2IDcVqJH0Vb
        vyZupceTAgMBAAECggEAAPk+WmWMF1arbO6Nlk0cQafO0xrKoGV/rC9M7KPhqPN+
        SAYS4xzLTqs6Av+xEcuxlTXK3mvbP1CNpJSNuMhWZkym9m9x1J5GibLtKZ1O+JUl
        aLMeH9HPUYJU5CqApytbwWz5HNi3wJQ6GCSOwNg7ozsA9j38L5goMmdyNutCAT/7
        w+uP7ftRiQ0eWOJ1+sbg45XXrn0WCa5FNdv8yLfd1qI6UWjHPMuxaJWSWxIQsnQV
        pCpWDvTF+6jZQ/MAgrsNIH+nBvB/hu98DaHKsMIN6WeNrUaeST1aBBDauK88XEBq
        IW659odzfOMXCgnTgoKk/dP85jsdMPkTLpnnomCKBQKBgQDMaAUmwkniovSsCRV/
        2i3TFOmHTKal1P99FT3e7N8uP1dA/KnzeIyLrUriWM8pvjx/dwheCP8fY1aA51W6
        yo25BA/9yGPTAwhZZFtRFbmtImMpxgls3eWRcch+heGJjUn9zjaddGUENMnK6Ej0
        62tOiJXzO9QFTwDyvKtDljiD/wKBgQC2Pb+kuGy6agtC1Fdb3Zg5FpIIN9Vx7j8L
        VrNon2XdZ4Ak7LGFB0HZ6xqybflUxFDq8jRSTs7G2Lp5D1DcwptWzPPaZVVibCsc
        Ee8U0Kiw6Q0wpZLQA3MkbiT+WyQ6kwR8zSZm+r4KKGjj5c1yFrP09A0wxLAPaUBi
        ksRZxxpsbQKBgDfLeQSAaiyb8I95F05D3thMUAZnjOGdR3P8NVxBahY0ofuSPE3C
        LRL/ZX5tYXbyf48HjdglOoZ11inve342RgMnsbnDVkRGAqRr+WUjugAhb9H6RZ5a
        34wY8/JdVxf14imOfWfzWpOQWTiyuR9pl2vjapLvVMtyKj8X8uPLAHg/AoGBAJLo
        B/ri6FMFdPp0bc+SPEmY1jNlvtxOr+eWBp4KEHWAH56kZx3TkdP3X9gCKwGYF5qt
        kFvhR3Kn9vnrzMWI4uv/33toQIJMrBu+oTnoUnP6CjXy4vxoK4NsfsnD8tp89Rsd
        zR0qd9N8a8F62Dhl8L8/lPqBM2PY9pv/r+SnSbepAoGAceOJSoqJek/IJDuD/HhA
        QG+erZaGjYF7U9yoaOF6M+ZYlGkRe06WFdetpb2hVIdaBXZkfugvHMAIQFOQQg7M
        cMBi+7QlTCBpK3vPRg4aGdlFcuEoaf9tDVg0NUL1TkW9q1iGTvL5orWmNUOo//Sb
        mNjS/+zMIpjZY2TqFQQk3A4=
        -----END PRIVATE KEY-----
    </details>
- enrollment.csr, required to complete the for the enrollment process
    <details>
        <summary>Sample CSR</summary>

        -----BEGIN CERTIFICATE REQUEST-----
        MIIC7zCCAdcCAQAwZjELMAkGA1UEBhMCQVQxFjAUBgNVBAgMDVVwcGVyIEF1c3Ry
        aWExDTALBgNVBAcMBExpbnoxDzANBgNVBAoMBmN1c3RvbTEfMB0GA1UEAwwWZW5y
        b2xsbWVudC1jZXJ0LWN1c3RvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoC
        ggEBAJGDQXfqGZ7yugCSQU0tkht6AR3Xj29J5GBQC6Q6jln+99YsUUITgsBieiXG
        PisQRpWsj73eh4sfNX8X0hNM4I3lTDz0L+i1p9R8RTSGniYEFO1VbNf4fbR8AEpf
        o5EVQ+M8J5f7rds1Ok4G8e56TCponTAiHFxxIxBuHfzF3doNMgaUiv6Bye2QXcpW
        4tzDOa+O+2xpt+HIP4V0IuNYWCF61hUy+1DE4hu9/jyqlZTQm+OIIXsGyQFLmvoE
        j85KjDJh2kaM0ds2Xw2yy823HmKyqbf4OUtjXkFZE4Y3H8baO3dgKtKgSvxUyucc
        2jcL/7/DYgNxWokfRVu/Jm6lx5MCAwEAAaBEMEIGCSqGSIb3DQEJDjE1MDMwDwYD
        VR0TAQH/BAUwAwIBADALBgNVHQ8EBAMCBaAwEwYDVR0lBAwwCgYIKwYBBQUHAwIw
        DQYJKoZIhvcNAQELBQADggEBAB/aKV6175ILzRLJ7pB+ITfMdKwHD/p34KseGoYh
        jOdrX9X6jewucgrjOm+2oG4ioDv+hVTikYokfInPeTRK5REiQq8COxPbp0HMvxQt
        lXRyMD2OaJkHEgDn/y1PJhxN4arHeGAdRlaKvFhALdVw/6XnL8RYyuxZEHeQJ/89
        cSQ+hGy6ewV11CGKTE9jA4Gt/jzJCLzUBqMqT8yU+BJdxnB5naHhpZqlx9Ks26Gd
        zBBTiRw7GEcqxxeJ/AibDRWG02QYWcCgzIuDDGI+HWQ2iGxv339Qb+3keM094Cdr
        Nt03ru8v3nnnczOMtyyvl6maMpr9+PLAMUMQnuRTzxcQH3w=
        -----END CERTIFICATE REQUEST-----
    </details>
- enrollment.cnf, can be ignored

Upload the _enrollment.csr_ this file to the Tributech UI or Tributech Node API to receive your certificate. 
Open the returned json file named `certificate.json` and save content of the entry _clientCertificate_ (everything between the two quotation marks, including the -----BEGIN CERTIFICATE----- and -----END CERTIFICATE-----) 

![No Json Example Found](./images/json.png "Certificate String")

and copy the content into the Windows Program **[Dev Toys](https://apps.microsoft.com/detail/9pgcv4v3bk4w)** > _Text_ > _Escape / Unescape_ this will convert the \n into new lines.

![No Text Escape Example Found](./images/text-escape.png "Escaping newlines")

Furthermore, copy the returned output into **[Dev Toys](https://apps.microsoft.com/detail/9pgcv4v3bk4w)** > _Encoders/Decoders_ > Base64 Text this will result in one line of a base64 string.

![No Base64 Encoding Example Found](./images/base64encoder.png "Base64 encoding")

Save the output into the _.env_ file as variable named __ENROLLMENT_CERT_BASE64__

The final .env file should contain this two entries (shortened example):
```yml
# .env file
ENROLLMENT_CERT_BASE64=LS0tLS1CR...VEUgS0VZLS0tLS5=
```

Next we do the same for `enrollment.key` but we dont need to escape the Text because its already in the correct format:
Copy the full content of `enrollment.key` into **[Dev Toys](https://apps.microsoft.com/detail/9pgcv4v3bk4w)** > _Encoders/Decoders_ > Base64 Text this will result in one line of a base64 string.


![No Base64 key Encoding Example Found](./images/base64encoder-key.png "Base64 key encoding")


Create the base64 encoded key string and save the output into the _.env_ file as variable named __ENROLLMENT_KEY_BASE64__.

The final .env file should contain this two entries (shortened example):
```yml
# .env file
AGENT_ID=00000000-0000-0000-0000-000000000001
NODE_URL=https://my-node.tributech-node.com
ENROLLMENT_CERT_BASE64=LS0tLS1CR...VEUgS0VZLS0tLS5=
ENROLLMENT_KEY_BASE64=LS0tLS1CRU...VEUgS0VZLS0tLS0K
```

Now we can reference the two values in the `docker-compose.yml` by setting the corresponding environment variables accordingly, e.g. `docker-compose.yml`:

```yml
# docker-compose.yml file
services:
    image: ${DOCKER_REGISTRY-tributech.azurecr.io/}tributech-agent:${AGENT_TAG:-latest}
    depends_on:
      - mosquitto-server-simulated
    environment:
      - MqttOptions__MQTTHost=mosquitto-server-simulated
      - EdgeDeviceOptions__AgentID=${AGENT_ID:?"The variable AGENT_ID needs to be configured in the .env file."}
      - EdgeDeviceOptions__NodeUrl=${NODE_URL:?"The variable NODE_URL needs to be configured in the .env file."}
      - EnrollmentOptions__EnrollmentCertBase64=${ENROLLMENT_CERT_BASE64:?"The variable ENROLLMENT_CERT_BASE64 needs to be configured in the .env file"}
      - EnrollmentOptions__EnrollmentKeyBase64=${ENROLLMENT_KEY_BASE64:?"The variable ENROLLMENT_KEY_BASE64 needs to be configured in the .env file"}
    ...
```

Now we can startup the agent in the docker compose environment and wait for a Tributech Node User to approve this agent.

Tributech Environment Documentation
-----------
* [Tributech Node](https://docs.tributech.io/tributech_node/overview)
* [Tributech Agent](https://docs.tributech.io/tributech_agent/overview)
 
License
==============================
Tributech-Enrollment is licensed under the Apache License 2.0, which means that
you are free to get and use it for commercial and non-commercial
purposes as long as you fulfill its conditions.

See the [LICENSE.txt](../LICENSE.txt) file for more details.

Support
==============================
There are various ways to get in touch. The correct channel depends on
your requirement. See the [SUPPORT](../SUPPORT.md) file for more details.
