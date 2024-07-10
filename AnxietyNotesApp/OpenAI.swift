import Foundation

class OpenAI {
    
    private let apiKey = "sk-proj-WB4oANiUGsyZKTBqk53OT3BlbkFJOssrfDMnfHQSnqyfu3BW" // ages 5$
    private let baseURL = URL(string: "https://api.openai.com/v1/")!
    
    func send(text: String, completion: @escaping (String) -> Void) {
        guard let url = URL(string: "chat/completions", relativeTo: baseURL) else {
            print("Invalid URL")
            return
        }

        let requestData: [String: Any] = [
            "model": "gpt-3.5-turbo",
            "messages": [
                ["role": "user", "content": text]
            ],
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
        guard let httpBody = try? JSONSerialization.data(withJSONObject: requestData) else {
            print("Failed to serialize JSON")
            return
        }
        
        request.httpBody = httpBody
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            if let decodedResponse = try? JSONDecoder().decode(CompletionResponse.self, from: data) {
                completion(decodedResponse.choices.first?.message.content ?? "")
            } else {
                let responseString = String(data: data, encoding: .utf8) ?? "Unable to decode response data"
                print("Response: \(responseString)")
            }
        }.resume()
    }
}



struct CompletionResponse: Decodable {
    let choices: [Choice]
}

struct Choice: Decodable {
    let message: ChoiceMessage
}

struct ChoiceMessage: Decodable {
    let role: String
    let content: String
}
