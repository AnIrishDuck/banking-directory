A directory of OFX connection information, compiled and verified from multiple
publicly available sources.

**I make no warranties about the accuracy of the information herein. Keep your
banking login credentials safe. Before sending them to an unknown domain,
verify that bad actors are not on the other side. See below for more
information. Open an issue if you have questions or concerns.**

# Verification

You should verify that the SSL information listed matches that of your bank,
and that the domain name and country / state of jurisdiction look correct.

If there is no SSL information present, you should verify that the endpoint
provided is operated by your bank, or by a party they have contracted. There
are several ways to do this.

## First-Party Domain Verification

If you're lucky, your bank is handling OFX through its own domain. Ideally, the
domain listed is a [subdomain](https://en.wikipedia.org/wiki/Subdomain) of your
bank domain (i.e. ofx.bank.com, and your bank's domain is bank.com or
www.bank.com).

If this is the case and no SSL information is present, your bank probably just
hasn't gone through the trouble of getting an extended-validation SSL
certificate.

Verify that the domain in the `url` field is a subdomain of a domain that you
know is controlled by your bank. You can find your bank's domain by checking
recent bills, or other trusted bank communications. They should have their
website listed.

If this domain matches the domain in the `url` field, you can be confident that
the party you are contacting is indeed your bank.

## Third-Party Domain Verification

If the domain listed under `url` doesn't look like your bank's domain, they
probably have hired a third party to handle their online banking services. This
is very common. There are several such organizations in business today.

You should verify that the listed organization has a relationship with your
bank. If you're lucky, there will be a mention or link to this third party on
your bank's website.

Find your bank's website by looking at a recent bill or other trusted
communication. Now it's time to do some quick detective work. Example search:

```
"fundsxpress site: 1880bank.com"
```

If you're lucky, you'll find a page like (note: the HTTPS here is **VERY**
important, it's what verifies your connection has not been tampered with):

```
https://1880bank.com/personal-mobile-online-banking/online-banking/
```

Which has a direct link to fundsxpress.com. This is pretty compelling evidence
of a business relationship, but you'll have to decide your own comfort level.

If you come up empty, more digging will be needed. Do some research to find the
entity that controls the domain listed. For example, "fundsxpress.com" is
obviously controlled by First Data. A quick google search turns up (ctrl-f to
find the link to fundsxpress.com on this page):

```
https://www.firstdata.com/en_us/products/financial-institutions/online-banking.html
```

First Data is a [large, publicly traded company]
(https://en.wikipedia.org/wiki/First_Data) that handles online financial
services for many banks. This might be enough verification for you, or you
might want to call your bank and verify that First Data is responsible for
handling their online banking services.

If you contact your bank's customer service, you're probably not going to get
someone knowledgeable about the intricacies of their OFX system. Keep that in
mind, and be polite.

# Contributing

Contributions are welcome. If you have connection information about banks that
are not listed, or corrections to any of the listed banks, please open a pull
request or file an issue.

Note that we expect you to go through the verification steps above before any
pull requests are accepted. Please post verification details on the relevant PR.

If you know your financial institution supports online banking, but it is not
listed here, feel free to file an issue with as much information as you can
about the institution. I want to keep track of what is missing from this
directory.
