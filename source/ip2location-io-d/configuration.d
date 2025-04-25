class Configuration {
	private const string _apiVersion = "1.1.0";
	private string _apiKey = "";
	
	// constructor
	public this(string apiKey) {
		_apiKey = apiKey;
	}
	
	// get version of API
	public string getVersion() {
		return _apiVersion;
	}
	
	// get API key
	public string getAPIKey() {
		return _apiKey;
	}
}
