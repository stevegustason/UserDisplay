//
//  DownloadView.swift
//  UserDisplay
//
//  Created by Steven Gustason on 4/30/23.
//

import SwiftUI

extension URLSession {
    func decode<T: Decodable>(
        _ type: T.Type = T.self,
        from url: URL,
        keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys,
        dataDecodingStrategy: JSONDecoder.DataDecodingStrategy = .deferredToData,
        dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .iso8601
    ) async throws  -> T {
        let (data, _) = try await data(from: url)

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = keyDecodingStrategy
        decoder.dataDecodingStrategy = dataDecodingStrategy
        decoder.dateDecodingStrategy = dateDecodingStrategy

        let decoded = try decoder.decode(T.self, from: data)
        return decoded
    }
}

struct DownloadView: View {
    @Binding var users: [User]
    
    func download(users: [User]) async {
        do {
            // Set our URL. We force unwrap it because it was hand-typed and will always be correct.
            let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
            // Decode the type
            self.users = try await URLSession.shared.decode(from: url)
            // Print a message to know we've succeeded
            print("Downloaded \(users.count) users")
        } catch {
            print("Download error: \(error.localizedDescription)")
        }
    }
    
    var body: some View {
        Button("Download") {
            Task {
                await download(users: users)
            }
        }
    }
}

struct DownloadView_Previews: PreviewProvider {
    @State static var users = [User]()
    
    static var previews: some View {
        DownloadView(users: $users)
    }
}
