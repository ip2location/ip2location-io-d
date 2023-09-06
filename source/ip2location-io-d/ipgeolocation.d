import std.uri;
import std.net.curl;
import std.json;
import std.conv;
import configuration;

class IPGeolocation {
	private Configuration _Config;
	private const string _BaseURL = "https://api.ip2location.io/";
	private const string _Format = "json";
	private const string _Source = "sdk-d-iplio";
	
	// Constructor
	public this(Configuration config) {
		_Config = config;
	}
	
	// Query web service for geolocation info
	public auto lookup(const string ipAddress, const string lang = "") {
		auto url = _BaseURL ~ "?key=" ~ _Config.getAPIKey().encode ~ "&ip=" ~ ipAddress.encode ~ "&format=" ~ _Format ~ "&source=" ~ _Source ~ "&source_version=" ~ _Config.getVersion();
		if (lang != "") {
			url = url ~ "&lang=" ~ lang.encode;
		}
		string content = "";
		auto client = HTTP(url); // using "HTTP" instead of just "get" due to the need to read the page content when HTTP Status <> 200
		client.onReceive = (ubyte[] data) {
			content = content ~ to!string(cast(char[])(data));
			return data.length;
		};
		client.perform();
		
		JSONValue j = parseJSON(content);
		return j;
	}
}
