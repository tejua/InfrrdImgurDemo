
//  DemoProject
//
//  Created by vLinkD on 30/11/19.
//  Copyright © 2019 vLinkD. All rights reserved.
//


import Alamofire
import Foundation
import ObjectMapper
import SVProgressHUD

typealias ResponseHandler<T: Mappable> = ((_ result: NetResponse<T>, _ data: T?) -> Void)

class ApiRequest {
    private static var _mananger: SessionManager!
    static var manager: SessionManager! {
        if _mananger == nil {
            let configuration = Alamofire.SessionManager.default.session.configuration
            configuration.timeoutIntervalForRequest = 30
            configuration.timeoutIntervalForResource = 30
            _mananger = Alamofire.SessionManager(configuration: configuration)
        }
        return _mananger
    }
    
    @discardableResult
    static func checkHasInternet() -> Bool {
        let isReachable = AppDelegate.shared.reachabilityManager?.isReachable ?? true
        if !isReachable {
            SVProgressHUD.dismiss()
            MyAlert.showError(message: "No Internet")
           
        }
        return isReachable
    }
    
    static func header() -> HTTPHeaders {
        let header = ["Content-Type": "application/json", "Cache-Control": "no-cache", "Access-Token": "3bd7426754981f253a2e95ba7caca74d13a8ac89", "Authorization": "Client-ID 81eab5efdce14d1"]
        return header
    }
    
    static func GET<T: Mappable>(url: String, params: [String: Any]? = nil, handler: @escaping ResponseHandler<T>, isRoot: Bool = false) {
         self.checkHasInternet()
        self.manager.request(url,
                             method: HTTPMethod.get,
                             parameters: params,
                             encoding: URLEncoding.default,
                             headers: self.header()).responseString(queue: DispatchQueue.global(qos: .utility),
                                                                    encoding: String.Encoding.utf8) { res in
            convertToObj(res: res, url: url, params: params, handler: handler, isRoot: isRoot)
        }
    }
    
    private static func convertToObj<T: Mappable>(res: DataResponse<String>, url: String, params: [String: Any]?, handler: @escaping ResponseHandler<T>, isRoot: Bool) {
        print("\nINPUT: \(url), \nPARAMS: \(params ?? [:])\nOUTPUT: \(res.result.value ?? "nil")\n")
         let myResponse = NetResponse<T>(res, isRoot: isRoot)
        DispatchQueue.main.async {
            handler(myResponse, myResponse.data)
        }
    }
}
    
class NetResponse<T: Mappable> {
    var httpRes: DataResponse<String>!
    var root: BaseRoot<T>?
    var data: T?
    var succ: Bool = false
    
    // configs
    var showError = true
    
    var toString: String {
        return self.root?.toJSONString() ?? ""
    }
    
    init(_ res: DataResponse<String>, isRoot: Bool) {
        self.httpRes = res
        switch res.result {
        case .success:
            if let jsonString = httpRes.result.value {
                if isRoot {
                    if let root = T(JSONString: jsonString) {
                        self.data = root
                    } else {
                        // model creation failed
                    }
                } else {
                    
                }
            } else {
                // no string in response
            }
        case .failure(let error):
            // global no internet handling
            print("\(error.localizedDescription)")
        }
    }
    
    func showErrorAlert() {
        if !self.succ, self.showError, let msg = root?.errorMessage {
            MyAlert.showError(message: msg)
        }

    }
    
}

class BaseRoot<T: Mappable>: Mappable {
    var code: Int?
    var errorMessage: String?
    var successMessage: String?

    // var success: Bool = false
    var suc: String?
    var data: T?
    // var alert: GeneralAlertData?
    
    init() {}
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        suc <- map["status"]
        data <- map["data"]
        // alert <- map["alert"]
        
        successMessage <- map["message"]
        if successMessage == nil { successMessage <- map["data.message"] }
        
        code <- map["code"]
        if code == nil { code <- map["error.code"] }
        
        
        errorMessage <- map["message"]
        if errorMessage == nil { errorMessage <- map["message"] }
        
        
    }
    
    var success: Bool {
        return suc == "true"
    }
}

