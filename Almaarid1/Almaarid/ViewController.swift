//
//  ViewController.swift
//  Almaarid
//
//  Created by Ahmed on 11/7/18.
//  Copyright © 2018 elryad. All rights reserved.
//

import NVActivityIndicatorView
import Photos
import UIKit
import WebKit
class ViewController: UIViewController, UIWebViewDelegate, WKNavigationDelegate {
    @IBOutlet var ButtomConstrain: NSLayoutConstraint!
    @IBOutlet var backBtn: UIButton!
    @IBOutlet var forwardBtn: UIButton!
    @IBOutlet var BackView: UIView!
    @IBOutlet var HomeView: UIView!
    @IBOutlet var activityIndicator: NVActivityIndicatorView!
    @IBOutlet var homeBtn: RoundButtonCorners!
    @IBOutlet var WebView: WKWebView!

    ///
    var lastContentOffset: CGFloat = 30
    //

    override func viewDidLoad() {
        super.viewDidLoad()
        checkBackForwardList()
        WebView.scrollView.delegate = self
        WebView.navigationDelegate = self
        WebView.scrollView.bounces = false
    }

//    func changeStatusBarColor() {
//        if let statusbar = UIApplication.shared.value(forKey: "statusBar") as? UIView {
//            statusbar.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
//        }
//    }

    override func viewDidAppear(_ animated: Bool) {
        WebView.load(URLRequest(url: URL(string: "http://almaarid-now.com.sa/")!))
    }

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        HomeView.alpha = 1.0
        checkConnection()
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print(error.localizedDescription)
        print("fail load frame")
        BackView.isHidden = true
        activityIndicator.stopAnimating()
    }

    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
//        if CheckInternet.Connection() == false {
        Alert(Message: error.localizedDescription)
//        }
        print(error.localizedDescription)
        print("Start")
    }

    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        // checkConnection()
        checkBackForwardList()
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        BackView.isHidden = true
        activityIndicator.stopAnimating()
    }

    func checkBackForwardList() {
        UIView.animate(withDuration: 0.4) {
            if self.WebView.backForwardList.forwardItem == nil {
                self.forwardBtn.tintColor = #colorLiteral(red: 0.8999999762, green: 0.8999999762, blue: 0.8999999762, alpha: 1)
            } else if self.WebView.backForwardList.forwardItem != nil {
                self.forwardBtn.tintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
            }

            if self.WebView.backForwardList.backItem == nil {
                self.backBtn.tintColor = #colorLiteral(red: 0.8999999762, green: 0.8999999762, blue: 0.8999999762, alpha: 1)
            } else if self.WebView.backForwardList.backItem != nil {
                self.backBtn.tintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
            }
        }
    }

    // Check connection
    func checkConnection() {
        if CheckInternet.Connection() == false {
            if Locale.current.languageCode == "ar" {
                Alert(Message: "تحقق من الاتصال بالانترنت")
            } else if Locale.current.languageCode == "en" {
                Alert(Message: "The Internet connection appears to be offline.")
            }
        } else {
            BackView.isHidden = false
            activityIndicator.startAnimating()
        }
    }

    func Alert(Message: String) {
        let alert = UIAlertController(title: "", message: Message, preferredStyle: UIAlertController.Style.alert)
        if Locale.current.languageCode == "ar" {
            let action = UIAlertAction(title: "موافق", style: .default) { _ in
                self.BackView.isHidden = true
                self.activityIndicator.stopAnimating()
            }
            alert.addAction(action)
        } else if Locale.current.languageCode == "en" {
            let action = UIAlertAction(title: "OK", style: .default) { _ in
                self.BackView.isHidden = true
                self.activityIndicator.stopAnimating()
            }
            alert.addAction(action)
        }
        BackView.isHidden = true
        activityIndicator.stopAnimating()
        present(alert, animated: true, completion: nil)
    }

    // Reload pages
    func reload() {
        if CheckInternet.Connection() {
            if WebView.url != nil {
                WebView.reload()
            } else {
                WebView.load(URLRequest(url: URL(string: "https://almaarid-now.com.sa/")!))
            }
        }
    }

    // IBACTION
    @IBAction func backButton(_ sender: Any) {
        checkConnection()
        WebView.goBack()
    }

    @IBAction func HomeButton(_ sender: Any) {
        checkConnection()
        WebView.load(URLRequest(url: URL(string: "https://almaarid-now.com.sa/")!))
    }

    @IBAction func ForwardButton(_ sender: Any) {
        checkConnection()
        WebView.goForward()
    }

    @IBAction func refresh(_ sender: Any) {
        reload()
    }
}

extension ViewController: UIScrollViewDelegate {
    // this delegate is called when the scrollView (i.e your UITableView) will start scrolling
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        lastContentOffset = scrollView.contentOffset.y
    }

    // while scrolling this delegate is being called so you may now check which direction your scrollView is being scrolled to
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if lastContentOffset < scrollView.contentOffset.y {
            // did move up
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
                self.HomeView.alpha = 0.0
            })
        } else if lastContentOffset > scrollView.contentOffset.y {
            // did move down
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
                self.HomeView.alpha = 1.0
            })
        } else {
            // didn't move
        }
    }

    //
}
