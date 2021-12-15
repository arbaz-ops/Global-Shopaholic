//
//  NEWSANDUPDATES+INSTAEMBEDED.swift
//  Global Shopaholic
//
//  Created by Ahsan on 6/14/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation
import WebKit
extension NewsAndUpdatesVC{
    
    
    func loadInstaNews(){
        
        let htmlStart = "<HTML><HEAD><meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, shrink-to-fit=no\"></HEAD><BODY>"
             let htmlEnd = "</BODY></HTML>"
             let htmlString = "\(htmlStart)\(instaLink)\(htmlEnd)"
        let script = """
                                var script = document.createElement('script');
                                script.src = 'https://platform.instagram.com/en_US/embeds.js';
                                document.getElementsByTagName('head')[0].appendChild(script);
                             """
                
                let userScript = WKUserScript(source: script, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
                
                myView.configuration.userContentController.addUserScript(userScript)
                
        myView.loadHTMLString(htmlString, baseURL: URL(string: "https://instagram.com"))
        }
}
