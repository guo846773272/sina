//
//  GMYHTTPSessionManager.swift
//  sina
//
//  Created by GMY on 2017/3/15.
//  Copyright © 2017年 Mingk. All rights reserved.
//

import UIKit
import AFNetworking

class GMYHTTPSessionManager: AFHTTPSessionManager {
    static let shareManager : GMYHTTPSessionManager = {
        let sessionManager = GMYHTTPSessionManager()
        sessionManager.responseSerializer.acceptableContentTypes?.insert("text/plain")
        sessionManager.responseSerializer.acceptableContentTypes?.insert("text/html")
        
        return sessionManager
    }()
    
    @discardableResult func gmy_get(URLString: String, parameters: Any?, progress downloadProgress: ((Progress) -> Swift.Void)?, success: ((URLSessionDataTask, Any?) -> Swift.Void)?, failure: ((URLSessionDataTask?, Error) -> Swift.Void)?) -> URLSessionDataTask? {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        let successCallback = { (dataTask: URLSessionDataTask, responseObject: Any?) in
            if (success != nil) {
                success!(dataTask, responseObject)
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
        }
        
        let failureCallback = { (dataTask: URLSessionDataTask?, error: Error) in
            if (failure != nil) {
                failure!(dataTask, error)
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
        }
        
        guard let dataTask = get(URLString, parameters: parameters, progress: downloadProgress, success: successCallback, failure: failureCallback) else {
            return nil
        }
        
        return dataTask
    }
    
    @discardableResult func gmy_post(URLString: String, parameters: Any?, progress downloadProgress: ((Progress) -> Swift.Void)?, success: ((URLSessionDataTask, Any?) -> Swift.Void)?, failure: ((URLSessionDataTask?, Error) -> Swift.Void)?) -> URLSessionDataTask? {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        let successCallback = { (dataTask: URLSessionDataTask, responseObject: Any?) in
            if (success != nil) {
                success!(dataTask, responseObject)
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
        }
        
        let failureCallback = { (dataTask: URLSessionDataTask?, error: Error) in
            if (failure != nil) {
                failure!(dataTask, error)
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
        }
        
        guard let dataTask = post(URLString, parameters: parameters, progress: downloadProgress, success: successCallback, failure: failureCallback) else {
            return nil
        }
        
        return dataTask
    }
}
