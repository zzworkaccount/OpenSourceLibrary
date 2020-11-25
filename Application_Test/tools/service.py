
class Service:

    def get_driver(self):
        from appium import webdriver
        capability = {
            "platformName": "Android",
            "platformVersion": '7.1.2',
            "deviceName": "127.0.0.1:62001",
            "appPackage": "com.mobivans.onestrokecharge",
            "appActivity": "com.stub.stub01.Stub01",
            'unicodeKeyboard': "True",
            "noReset": "True"
        }
        driver = webdriver.Remote('http://localhost:4723/wd/hub', capability)
        return driver





