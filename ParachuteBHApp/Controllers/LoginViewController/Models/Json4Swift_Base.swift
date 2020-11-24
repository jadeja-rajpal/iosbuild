/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Json4Swift_Base : Codable {
	let login : String?
	let id : Int?
	let node_id : String?
	let url : String?
	let repos_url : String?
	let events_url : String?
	let hooks_url : String?
	let issues_url : String?
	let members_url : String?
	let public_members_url : String?
	let avatar_url : String?
	let description : String?

	enum CodingKeys: String, CodingKey {

		case login = "login"
		case id = "id"
		case node_id = "node_id"
		case url = "url"
		case repos_url = "repos_url"
		case events_url = "events_url"
		case hooks_url = "hooks_url"
		case issues_url = "issues_url"
		case members_url = "members_url"
		case public_members_url = "public_members_url"
		case avatar_url = "avatar_url"
		case description = "description"
	}
    
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		login = try values.decodeIfPresent(String.self, forKey: .login)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		node_id = try values.decodeIfPresent(String.self, forKey: .node_id)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		repos_url = try values.decodeIfPresent(String.self, forKey: .repos_url)
		events_url = try values.decodeIfPresent(String.self, forKey: .events_url)
		hooks_url = try values.decodeIfPresent(String.self, forKey: .hooks_url)
		issues_url = try values.decodeIfPresent(String.self, forKey: .issues_url)
		members_url = try values.decodeIfPresent(String.self, forKey: .members_url)
		public_members_url = try values.decodeIfPresent(String.self, forKey: .public_members_url)
		avatar_url = try values.decodeIfPresent(String.self, forKey: .avatar_url)
		description = try values.decodeIfPresent(String.self, forKey: .description)
	}

}

struct LoanDataStore: Codable {
    var loans: [Json4Swift_Base]
}
