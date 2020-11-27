#   视频

class Book:

    def __init__(self):
        from appium import webdriver
        capability = {
            "platformName": "Android",
            "platformVersion":'9',
            "deviceName": "CSXDU17621001803",
            "appPackage": " com.kuaishou.nebula",
            "appActivity": "com.yxcorp.gifshow.webview.KwaiWebViewActivity",
            "noReset": "True"
        }
        self.driver = webdriver.Remote('http://localhost:4723/wd/hub', capability)
        self.driver.implicitly_wait(10)


    def demo(self):
        pass
