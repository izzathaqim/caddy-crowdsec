## caddy-crowdsec
<br/>

**This docker image build caddy with some additional modules.**

Module include :
- [caddy-crowdsec-bouncer](https://github.com/hslatman/caddy-crowdsec-bouncer)
- [caddy-combine-ip-ranges](https://github.com/fvbommel/caddy-combine-ip-ranges)
- [caddy-cloudflare-ip](https://github.com/WeidiDeng/caddy-cloudflare-ip)
- [caddy-cloudflare-dns](https://github.com/caddy-dns/cloudflare)
<br/>

### Usage

**caddy-crowdsec-bouncer**

```
{
    #global option
    order crowdsec first
    crowdsec {
        api_url <crowdsec_url>
        api_key <crowdsec_api_key>
        ticker_interval 30s
        #disable_streaming
        #enable_hard_fails
    }
}

example.com {
    crowdsec
    reverse_proxy 10.10.10.10:8081
}
```
---
<br/>

**caddy-dns-cloudflare**

For global option

```
{
    acme_dns cloudflare <api_token>
}
```
Per site config

```
example.com {
    tls {
        dns cloudflare <api_token>
    }
}
```
---
<br/>

**caddy-cloudflare-ip**

```
{
    #global options
    servers {
        trusted_proxies cloudflare {
            Interval 12h
            timeout 15s
        }
}
```
---
<br/>

**caddy-combine-ip-ranges**

```
{
    #global option
    servers {
        trusted_proxies combine {
            static 10.10.10.10
            cloudflare {
                interval 12h
                timeout 15s
            }
        }
    }
}

```

