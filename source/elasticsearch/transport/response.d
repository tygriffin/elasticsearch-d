﻿module elasticsearch.transport.response;

import elasticsearch.parameters;
import std.regex;

import vibe.data.json;

struct Response {
	private static auto JsonRegex = ctRegex!(`json`, "i");
	int status; // Response status code
	string responseBody; // Response body
	Parameters headers; // Response headers

	@property bool bodyIsJson() {
		return cast(bool)matchFirst(headers.get("content-type"), JsonRegex);
	}

	@property Json jsonBody() {
		return parseJsonString(responseBody);
	}
}
