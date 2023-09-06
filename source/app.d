import std.stdio;
import ipgeolocation;
import domainwhois;
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
	
	auto domain = "locaproxy.com";
	auto whois = new DomainWhois(conf);
	
	auto result2 = whois.lookup(domain);
	
	if ("domain" in result2) {
		writefln("domain: %s", result2["domain"].str);
		writefln("domain_id: %s", result2["domain_id"].str);
		writefln("status: %s", result2["status"].str);
		writefln("create_date: %s", result2["create_date"].str);
		writefln("update_date: %s", result2["update_date"].str);
		writefln("expire_date: %s", result2["expire_date"].str);
		writefln("domain_age: %s", result2["domain_age"].integer);
		writefln("whois_server: %s", result2["whois_server"].str);
		writefln("nameservers: %s", result2["nameservers"]);
		
		auto registrar = result2["registrar"];
		writefln("registrar => iana_id: %s", registrar["iana_id"].str);
		writefln("registrar => name: %s", registrar["name"].str);
		writefln("registrar => url: %s", registrar["url"].str);
		
		auto registrant = result2["registrant"];
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
		
		auto admin = result2["admin"];
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
		
		auto tech = result2["tech"];
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
		
		auto billing = result2["billing"];
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
	else if ("error" in result2) {
		writefln("Error: %s", result2["error"]["error_message"]);
	}
	else {
		writeln("Error: Unknown error.");
	}
	
	writefln("Punycode: %s", whois.getPunycode("täst.de"));
	writefln("NormalText: %s", whois.getNormalText("xn--tst-qla.de"));
	writefln("DomainName: %s", whois.getDomainName("https://www.example.com/exe"));
	writefln("DomainExtension: %s", whois.getDomainExtension("example.com"));
	
	return 0;
}
