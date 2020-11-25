import requests
# 用户列表
from requests import session


class UL_Action:
    def __init__(self, session):
        self.s = session

    def login(self):
        pass
        # data = {"username":"admin","password":"123456","captcha":"1"}
        # self.s.post("http://192.168.2.160:9000/adminservice/login.do", data)

    def doGet(self, url):
        res = self.s.get(url)
        return res.text

    def doPost(self, url, data):
        res = self.s.post(url, data=data)
        return res.text

    def doPut(self, url, data):
        res = self.s.put(url, data)
        return res.content

    def doDelete(self, url):
        res = self.s.delete(url)
        return res.content