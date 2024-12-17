IP2Location.io D SDK
====================
This D libary enables user to query for an enriched data set, such as country, region, district, city, latitude & longitude, ZIP code, time zone, ASN, ISP, domain, net speed, IDD code, area code, weather station data, MNC, MCC, mobile brand, elevation, usage type, address type, advertisement category and proxy data with an IP address. It supports both IPv4 and IPv6 address lookup.

In addition, this library provides WHOIS lookup api that helps users to obtain domain information, WHOIS record, by using a domain name. The WHOIS API returns a comprehensive WHOIS data such as creation date, updated date, expiration date, domain age, the contact information of the registrant, mailing address, phone number, email address, nameservers the domain is using and much more.

This library requires API key to function. You may sign up for a free API key at https://www.ip2location.io/pricing.


Installation using dub
======================
```
"dependencies": {
    "ip2location-io-d": "~master"
}
```


Usage Example
=============
### Lookup IP Address Geolocation Data
```d
import std.stdio;
import ipgeolocation;
import configuration;

int main() {
	// Query for IP geolocation
	auto ip = "8.8.8.8";
	auto apiKey = "YOUR_API_KEY";
	auto lang = "es";
	
	auto conf = new Configuration(apiKey);
	
	auto ipl = new IPGeolocation(conf);
	
	auto result = ipl.lookup(ip, lang); // lang param only supported by Plus and Security plans, so omit if not needed
	
	if ("country_code" in result) {
		writefln("ip: %s", ("ip" in result) ? result["ip"].str : "");
		writefln("country_code: %s", ("country_code" in result) ? result["country_code"].str : "");
		writefln("country_name: %s", ("country_name" in result) ? result["country_name"].str : "");
		writefln("region_name: %s", ("region_name" in result) ? result["region_name"].str : "");
		writefln("city_name: %s", ("city_name" in result) ? result["city_name"].str : "");
		writefln("latitude: %f", ("latitude" in result) ? result["latitude"].floating : 0.0);
		writefln("longitude: %f", ("longitude" in result) ? result["longitude"].floating : 0.0);
		writefln("zip_code: %s", ("zip_code" in result) ? result["zip_code"].str : "");
		writefln("time_zone: %s", ("time_zone" in result) ? result["time_zone"].str : "");
		writefln("asn: %s", ("asn" in result) ? result["asn"].str : "");
		writefln("as: %s", ("as" in result) ? result["as"].str : "");
		writefln("isp: %s", ("isp" in result) ? result["isp"].str : "");
		writefln("domain: %s", ("domain" in result) ? result["domain"].str : "");
		writefln("net_speed: %s", ("net_speed" in result) ? result["net_speed"].str : "");
		writefln("idd_code: %s", ("idd_code" in result) ? result["idd_code"].str : "");
		writefln("area_code: %s", ("area_code" in result) ? result["area_code"].str : "");
		writefln("weather_station_code: %s", ("weather_station_code" in result) ? result["weather_station_code"].str : "");
		writefln("weather_station_name: %s", ("weather_station_name" in result) ? result["weather_station_name"].str : "");
		writefln("mcc: %s", ("mcc" in result) ? result["mcc"].str : "");
		writefln("mnc: %s", ("mnc" in result) ? result["mnc"].str : "");
		writefln("mobile_brand: %s", ("mobile_brand" in result) ? result["mobile_brand"].str : "");
		writefln("elevation: %d", ("elevation" in result) ? result["elevation"].integer : 0);
		writefln("usage_type: %s", ("usage_type" in result) ? result["usage_type"].str : "");
		writefln("address_type: %s", ("address_type" in result) ? result["address_type"].str : "");
		writefln("district: %s", ("district" in result) ? result["district"].str : "");
		writefln("ads_category: %s", ("ads_category" in result) ? result["ads_category"].str : "");
		writefln("ads_category_name: %s", ("ads_category_name" in result) ? result["ads_category_name"].str : "");
		writefln("is_proxy: %s", ("is_proxy" in result) ? result["is_proxy"].boolean : false);
		writefln("fraud_score: %d", ("fraud_score" in result) ? result["fraud_score"].integer : 0);
		
		// continent addon
		if ("continent" in result) {
			auto continent = result["continent"];
			writefln("continent => name: %s", continent["name"].str);
			writefln("continent => code: %s", continent["code"].str);
			writefln("continent => hemisphere: %s", continent["hemisphere"]);
			writefln("continent => translation: %s", continent["translation"]);
		}
		
		// country addon
		if ("country" in result) {
			auto country = result["country"];
			writefln("country => name: %s", country["name"].str);
			writefln("country => alpha3_code: %s", country["alpha3_code"].str);
			writefln("country => numeric_code: %s", country["numeric_code"].integer);
			writefln("country => demonym: %s", country["demonym"].str);
			writefln("country => flag: %s", country["flag"].str);
			writefln("country => capital: %s", country["capital"].str);
			writefln("country => total_area: %s", country["total_area"].integer);
			writefln("country => population: %s", country["population"].integer);
			writefln("country => tld: %s", country["tld"].str);
			writefln("country => translation: %s", country["translation"]);
			
			writefln("country => currency => code: %s", country["currency"]["code"].str);
			writefln("country => currency => name: %s", country["currency"]["name"].str);
			writefln("country => currency => symbol: %s", country["currency"]["symbol"].str);
			
			writefln("country => language => code: %s", country["language"]["code"].str);
			writefln("country => language => name: %s", country["language"]["name"].str);
		}
		
		// region addon
		if ("region" in result) {
			auto region = result["region"];
			writefln("region => name: %s", region["name"].str);
			writefln("region => code: %s", region["code"].str);
			writefln("region => translation: %s", region["translation"]);
		}
		
		// city addon
		if ("city" in result) {
			auto city = result["city"];
			writefln("city => name: %s", city["name"].str);
			writefln("city => translation: %s", city["translation"]);
		}
		
		// time_zone_info addon
		if ("time_zone_info" in result) {
			auto timezone = result["time_zone_info"];
			writefln("time_zone_info => olson: %s", timezone["olson"].str);
			writefln("time_zone_info => current_time: %s", timezone["current_time"].str);
			writefln("time_zone_info => gmt_offset: %d", timezone["gmt_offset"].integer);
			writefln("time_zone_info => is_dst: %s", timezone["is_dst"].boolean);
			writefln("time_zone_info => sunrise: %s", timezone["sunrise"].str);
			writefln("time_zone_info => sunset: %s", timezone["sunset"].str);
		}
		
		// geotargeting addon
		if ("geotargeting" in result) {
			writefln("geotargeting => metro: %s", result["geotargeting"]["metro"].str);
		}
		
		// proxy addon
		if ("proxy" in result) {
			auto proxy = result["proxy"];
			writefln("proxy => last_seen: %d", proxy["last_seen"].integer);
			writefln("proxy => proxy_type: %s", proxy["proxy_type"].str);
			writefln("proxy => threat: %s", proxy["threat"].str);
			writefln("proxy => provider: %s", proxy["provider"].str);
			writefln("proxy => is_vpn: %s", proxy["is_vpn"].boolean);
			writefln("proxy => is_tor: %s", proxy["is_tor"].boolean);
			writefln("proxy => is_data_center: %s", proxy["is_data_center"].boolean);
			writefln("proxy => is_public_proxy: %s", proxy["is_public_proxy"].boolean);
			writefln("proxy => is_web_proxy: %s", proxy["is_web_proxy"].boolean);
			writefln("proxy => is_web_crawler: %s", proxy["is_web_crawler"].boolean);
			writefln("proxy => is_residential_proxy: %s", proxy["is_residential_proxy"].boolean);
			writefln("proxy => is_spammer: %s", proxy["is_spammer"].boolean);
			writefln("proxy => is_scanner: %s", proxy["is_scanner"].boolean);
			writefln("proxy => is_botnet: %s", proxy["is_botnet"].boolean);
		}
	}
	else if ("error" in result) {
		writefln("Error: %s", result["error"]["error_message"]);
	}
	else {
		writeln("Error: Unknown error.");
	}
	
	return 0;
}
```

### Lookup Domain Information
```d
import std.stdio;
import domainwhois;
import configuration;

int main() {
	auto apiKey = "YOUR_API_KEY";
	auto conf = new Configuration(apiKey);
	auto domain = "locaproxy.com";
	auto whois = new DomainWhois(conf);
	
	auto result = whois.lookup(domain);
	
	if ("domain" in result) {
		writefln("domain: %s", result["domain"].str);
		writefln("domain_id: %s", result["domain_id"].str);
		writefln("status: %s", result["status"].str);
		writefln("create_date: %s", result["create_date"].str);
		writefln("update_date: %s", result["update_date"].str);
		writefln("expire_date: %s", result["expire_date"].str);
		writefln("domain_age: %s", result["domain_age"].integer);
		writefln("whois_server: %s", result["whois_server"].str);
		writefln("nameservers: %s", result["nameservers"]);
		
		auto registrar = result["registrar"];
		writefln("registrar => iana_id: %s", registrar["iana_id"].str);
		writefln("registrar => name: %s", registrar["name"].str);
		writefln("registrar => url: %s", registrar["url"].str);
		
		auto registrant = result["registrant"];
		writefln("registrant => name: %s", registrant["name"].str);
		writefln("registrant => organization: %s", registrant["organization"].str);
		writefln("registrant => street_address: %s", registrant["street_address"].str);
		writefln("registrant => city: %s", registrant["city"].str);
		writefln("registrant => region: %s", registrant["region"].str);
		writefln("registrant => zip_code: %s", registrant["zip_code"].str);
		writefln("registrant => country: %s", registrant["country"].str);
		writefln("registrant => phone: %s", registrant["phone"].str);
		writefln("registrant => fax: %s", registrant["fax"].str);
		writefln("registrant => email: %s", registrant["email"].str);
		
		auto admin = result["admin"];
		writefln("admin => name: %s", admin["name"].str);
		writefln("admin => organization: %s", admin["organization"].str);
		writefln("admin => street_address: %s", admin["street_address"].str);
		writefln("admin => city: %s", admin["city"].str);
		writefln("admin => region: %s", admin["region"].str);
		writefln("admin => zip_code: %s", admin["zip_code"].str);
		writefln("admin => country: %s", admin["country"].str);
		writefln("admin => phone: %s", admin["phone"].str);
		writefln("admin => fax: %s", admin["fax"].str);
		writefln("admin => email: %s", admin["email"].str);
		
		auto tech = result["tech"];
		writefln("tech => name: %s", tech["name"].str);
		writefln("tech => organization: %s", tech["organization"].str);
		writefln("tech => street_address: %s", tech["street_address"].str);
		writefln("tech => city: %s", tech["city"].str);
		writefln("tech => region: %s", tech["region"].str);
		writefln("tech => zip_code: %s", tech["zip_code"].str);
		writefln("tech => country: %s", tech["country"].str);
		writefln("tech => phone: %s", tech["phone"].str);
		writefln("tech => fax: %s", tech["fax"].str);
		writefln("tech => email: %s", tech["email"].str);
		
		auto billing = result["billing"];
		writefln("billing => name: %s", billing["name"].str);
		writefln("billing => organization: %s", billing["organization"].str);
		writefln("billing => street_address: %s", billing["street_address"].str);
		writefln("billing => city: %s", billing["city"].str);
		writefln("billing => region: %s", billing["region"].str);
		writefln("billing => zip_code: %s", billing["zip_code"].str);
		writefln("billing => country: %s", billing["country"].str);
		writefln("billing => phone: %s", billing["phone"].str);
		writefln("billing => fax: %s", billing["fax"].str);
		writefln("billing => email: %s", billing["email"].str);
	}
	else if ("error" in result) {
		writefln("Error: %s", result["error"]["error_message"]);
	}
	else {
		writeln("Error: Unknown error.");
	}
	
	return 0;
}
```

### Convert Normal Text to Punycode
```d
import std.stdio;
import domainwhois;
import configuration;

int main() {
	auto conf = new Configuration("");
	auto whois = new DomainWhois(conf);
	writefln("Punycode: %s", whois.getPunycode("täst.de"));
	return 0;
}
```

### Convert Punycode to Normal Text
```d
import std.stdio;
import domainwhois;
import configuration;

int main() {
	auto conf = new Configuration("");
	auto whois = new DomainWhois(conf);
	writefln("NormalText: %s", whois.getNormalText("xn--tst-qla.de"));
	return 0;
}
```

### Get Domain Name
```d
import std.stdio;
import domainwhois;
import configuration;

int main() {
	auto conf = new Configuration("");
	auto whois = new DomainWhois(conf);
	writefln("DomainName: %s", whois.getDomainName("https://www.example.com/exe"));
	return 0;
}
```

### Get Domain Extension
```d
import std.stdio;
import domainwhois;
import configuration;

int main() {
	auto conf = new Configuration("");
	auto whois = new DomainWhois(conf);
	writefln("DomainExtension: %s", whois.getDomainExtension("example.com"));
	
	return 0;
}
```


Response Parameter
============
### IP Geolocation Lookup function
| Parameter | Type | Description |
|---|---|---|
|ip|string|IP address.|
|country_code|string|Two-character country code based on ISO 3166.|
|country_name|string|Country name based on ISO 3166.|
|region_name|string|Region or state name.|
|city_name|string|City name.|
|latitude|double|City latitude. Defaults to capital city latitude if city is unknown.|
|longitude|double|City longitude. Defaults to capital city longitude if city is unknown.|
|zip_code|string|ZIP/Postal code.|
|time_zone|string|UTC time zone (with DST supported).|
|asn|string|Autonomous system number (ASN).|
|as|string|Autonomous system (AS) name.|
|isp|string|Internet Service Provider or company's name.|
|domain|string|Internet domain name associated with IP address range.|
|net_speed|string|Internet connection type. DIAL = dial-up, DSL = broadband/cable/fiber/mobile, COMP = company/T1|
|idd_code|string|The IDD prefix to call the city from another country.|
|area_code|string|A varying length number assigned to geographic areas for calls between cities.|
|weather_station_code|string|The special code to identify the nearest weather observation station.|
|weather_station_name|string|The name of the nearest weather observation station.|
|mcc|string|Mobile Country Codes (MCC) as defined in ITU E.212 for use in identifying mobile stations in wireless telephone networks, particularly GSM and UMTS networks.|
|mnc|string|Mobile Network Code (MNC) is used in combination with a Mobile Country Code (MCC) to uniquely identify a mobile phone operator or carrier.|
|mobile_brand|string|Commercial brand associated with the mobile carrier.|
|elevation|integer|Average height of city above sea level in meters (m).|
|usage_type|string|Usage type classification of ISP or company.|
|address_type|string|IP address types as defined in Internet Protocol version 4 (IPv4) and Internet Protocol version 6 (IPv6).|
|continent.name|string|Continent name.|
|continent.code|string|Two-character continent code.|
|continent.hemisphere|array|The hemisphere of where the country located. The data in array format with first item indicates (north/south) hemisphere and second item indicates (east/west) hemisphere information.|
|continent.translation|object|Translation data based on the given lang code.|
|district|string|District or county name.|
|country.name|string|Country name based on ISO 3166.|
|country.alpha3_code|string|Three-character country code based on ISO 3166.|
|country.numeric_code|string|Three-character country numeric code based on ISO 3166.|
|country.demonym|string|Native of the country.|
|country.flag|string|URL of the country flag image.|
|country.capital|string|Capital of the country.|
|country.total_area|integer|Total area in km2.|
|country.population|integer|Population of the country.|
|country.currency|object|Currency of the country.|
|country.language|object|Language of the country.|
|country.tld|string|Country-Code Top-Level Domain.|
|country.translation|object|Translation data based on the given lang code.|
|region.name|string|Region or state name.|
|region.code|string|ISO3166-2 code.|
|region.translation|object|Translation data based on the given lang code.|
|city.name|string| City name.|
|city.translation|object|Translation data based on the given lang code.|
|time_zone_info.olson|string|Time zone in Olson format.|
|time_zone_info.current_time|string|Current time in ISO 8601 format.|
|time_zone_info.gmt_offset|integer|GMT offset value in seconds.|
|time_zone_info.is_dst|boolean|Indicate if the time zone value is in DST.|
|time_zone_info.sunrise|string|Time of sunrise. (hh:mm format in local time, i.e, 07:47)|
|time_zone_info.sunset|string|Time of sunset. (hh:mm format in local time, i.e 19:50)|
|geotargeting.metro|string|Metro code based on zip/postal code.|
|ads_category|string|The domain category code based on IAB Tech Lab Content Taxonomy.|
|ads_category_name|string|The domain category based on IAB Tech Lab Content Taxonomy. These categories are comprised of Tier-1 and Tier-2 (if available) level categories widely used in services like advertising, Internet security and filtering appliances.|
|is_proxy|boolean|Whether is a proxy or not.|
|fraud_score|integer|Potential risk score (0 - 99) associated with IP address. A higher IP2Proxy Fraud Score indicates a greater likelihood of fraudulent activity and a lower reputation.|
|proxy.last_seen|integer|Proxy last seen in days.|
|proxy.proxy_type|string|Type of proxy.|
|proxy.threat|string|Security threat reported.|
|proxy.provider|string|Name of VPN provider if available.|
|proxy.is_vpn|boolean|Anonymizing VPN services.|
|proxy.is_tor|boolean|Tor Exit Nodes.|
|proxy.is_data_center|boolean|Hosting Provider, Data Center or Content Delivery Network.|
|proxy.is_public_proxy|boolean|Public Proxies.|
|proxy.is_web_proxy|boolean|Web Proxies.|
|proxy.is_web_crawler|boolean|Search Engine Robots.|
|proxy.is_residential_proxy|boolean|Residential proxies.|
|proxy.is_spammer|boolean|Email and forum spammers.|
|proxy.is_scanner|boolean|Network security scanners.|
|proxy.is_botnet|boolean|Malware infected devices.|

```json
{
  "ip": "8.8.8.8",
  "country_code": "US",
  "country_name": "United States of America",
  "region_name": "California",
  "city_name": "Mountain View",
  "latitude": 37.405992,
  "longitude": -122.078515,
  "zip_code": "94043",
  "time_zone": "-07:00",
  "asn": "15169",
  "as": "Google LLC",
  "isp": "Google LLC",
  "domain": "google.com",
  "net_speed": "T1",
  "idd_code": "1",
  "area_code": "650",
  "weather_station_code": "USCA0746",
  "weather_station_name": "Mountain View",
  "mcc": "-",
  "mnc": "-",
  "mobile_brand": "-",
  "elevation": 32,
  "usage_type": "DCH",
  "address_type": "Anycast",
  "continent": {
    "name": "North America",
    "code": "NA",
    "hemisphere": [
      "north",
      "west"
    ],
    "translation": {
      "lang": "es",
      "value": "Norteamérica"
    }
  },
  "district": "Santa Clara County",
  "country": {
    "name": "United States of America",
    "alpha3_code": "USA",
    "numeric_code": 840,
    "demonym": "Americans",
    "flag": "https://cdn.ip2location.io/assets/img/flags/us.png",
    "capital": "Washington, D.C.",
    "total_area": 9826675,
    "population": 331002651,
    "currency": {
      "code": "USD",
      "name": "United States Dollar",
      "symbol": "$"
    },
    "language": {
      "code": "EN",
      "name": "English"
    },
    "tld": "us",
    "translation": {
      "lang": "es",
      "value": "Estados Unidos de América (los)"
    }
  },
  "region": {
    "name": "California",
    "code": "US-CA",
    "translation": {
      "lang": "es",
      "value": "California"
    }
  },
  "city": {
    "name": "Mountain View",
    "translation": {
      "lang": null,
      "value": null
    }
  },
  "time_zone_info": {
    "olson": "America/Los_Angeles",
    "current_time": "2023-09-03T18:21:13-07:00",
    "gmt_offset": -25200,
    "is_dst": true,
    "sunrise": "06:41",
    "sunset": "19:33"
  },
  "geotargeting": {
    "metro": "807"
  },
  "ads_category": "IAB19-11",
  "ads_category_name": "Data Centers",
  "is_proxy": false,
  "fraud_score": 0,
  "proxy": {
    "last_seen": 3,
    "proxy_type": "DCH",
    "threat": "-",
    "provider": "-",
    "is_vpn": false,
    "is_tor": false,
    "is_data_center": true,
    "is_public_proxy": false,
    "is_web_proxy": false,
    "is_web_crawler": false,
    "is_residential_proxy": false,
    "is_spammer": false,
    "is_scanner": false,
    "is_botnet": false
  }
}
```

### Domain WHOIS Lookup function
| Parameter | Type | Description |
|---|---|---|
|domain|string|Domain name.|
|domain_id|string|Domain name ID.|
|status|string|Domain name status.|
|create_date|string|Domain name creation date.|
|update_date|string|Domain name updated date.|
|expire_date|string|Domain name expiration date.|
|domain_age|integer|Domain name age in day(s).|
|whois_server|string|WHOIS server name.|
|registrar.iana_id|string|Registrar IANA ID.|
|registrar.name|string|Registrar name.|
|registrar.url|string|Registrar URL.|
|registrant.name|string|Registrant name.|
|registrant.organization|string|Registrant organization.|
|registrant.street_address|string|Registrant street address.|
|registrant.city|string|Registrant city.|
|registrant.region|string|Registrant region.|
|registrant.zip_code|string|Registrant ZIP Code.|
|registrant.country|string|Registrant country.|
|registrant.phone|string|Registrant phone number.|
|registrant.fax|string|Registrant fax number.|
|registrant.email|string|Registrant email address.|
|admin.name|string|Admin name.|
|admin.organization|string|Admin organization.|
|admin.street_address|string|Admin street address.|
|admin.city|string|Admin city.|
|admin.region|string|Admin region.|
|admin.zip_code|string|Admin ZIP Code.|
|admin.country|string|Admin country.|
|admin.phone|string|Admin phone number.|
|admin.fax|string|Admin fax number.|
|admin.email|string|Admin email address.|
|tech.name|string|Tech name.|
|tech.organization|string|Tech organization.|
|tech.street_address|string|Tech street address.|
|tech.city|string|Tech city.|
|tech.region|string|Tech region.|
|tech.zip_code|string|Tech ZIP Code.|
|tech.country|string|Tech country.|
|tech.phone|string|Tech phone number.|
|tech.fax|string|Tech fax number.|
|tech.email|string|Tech email address.|
|billing.name|string|Billing name.|
|billing.organization|string|Billing organization.|
|billing.street_address|string|Billing street address.|
|billing.city|string|Billing city.|
|billing.region|string|Billing region.|
|billing.zip_code|string|Billing ZIP Code.|
|billing.country|string|Billing country.|
|billing.phone|string|Billing phone number.|
|billing.fax|string|Billing fax number.|
|billing.email|string|Billing email address.|
|nameservers|array|Name servers|

```json
{
    "domain": "locaproxy.com",
    "domain_id": "1710914405_DOMAIN_COM-VRSN",
    "status": "clientTransferProhibited https://icann.org/epp#clientTransferProhibited",
    "create_date": "2012-04-03T02:34:32Z",
    "update_date": "2021-12-03T02:54:57Z",
    "expire_date": "2024-04-03T02:34:32Z",
    "domain_age": 3863,
    "whois_server": "whois.godaddy.com",
    "registrar": {
        "iana_id": "146",
        "name": "GoDaddy.com, LLC",
        "url": "https://www.godaddy.com"
    },
    "registrant": {
        "name": "Registration Private",
        "organization": "Domains By Proxy, LLC",
        "street_address": "DomainsByProxy.com",
        "city": "Tempe",
        "region": "Arizona",
        "zip_code": "85284",
        "country": "US",
        "phone": "+1.4806242599",
        "fax": "+1.4806242598",
        "email": "Select Contact Domain Holder link at https://www.godaddy.com/whois/results.aspx?domain=LOCAPROXY.COM"
    },
    "admin": {
        "name": "Registration Private",
        "organization": "Domains By Proxy, LLC",
        "street_address": "DomainsByProxy.com",
        "city": "Tempe",
        "region": "Arizona",
        "zip_code": "85284",
        "country": "US",
        "phone": "+1.4806242599",
        "fax": "+1.4806242598",
        "email": "Select Contact Domain Holder link at https://www.godaddy.com/whois/results.aspx?domain=LOCAPROXY.COM"
    },
    "tech": {
        "name": "Registration Private",
        "organization": "Domains By Proxy, LLC",
        "street_address": "DomainsByProxy.com",
        "city": "Tempe",
        "region": "Arizona",
        "zip_code": "85284",
        "country": "US",
        "phone": "+1.4806242599",
        "fax": "+1.4806242598",
        "email": "Select Contact Domain Holder link at https://www.godaddy.com/whois/results.aspx?domain=LOCAPROXY.COM"
    },
    "billing": {
        "name": "",
        "organization": "",
        "street_address": "",
        "city": "",
        "region": "",
        "zip_code": "",
        "country": "",
        "phone": "",
        "fax": "",
        "email": ""
    },
    "nameservers": ["vera.ns.cloudflare.com", "walt.ns.cloudflare.com"]
}
```


LICENCE
=====================
See the LICENSE file.
