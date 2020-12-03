


# 添加演出
import json

from tools.service import Service


class AS_Action:

    def __init__(self , session):
        self.session = session

    def AddShow_Action(self,url , method,para):
        res = self.session.request(url=url , method=method,params=para)
        return res







if __name__ == '__main__':
    pass
    # url = "http://192.172.4.60:9000/adminservice/login.do"
    # data =  {"username":"admin","password":"123456","captcha":"123"}
    # AS_Action().login_do_Action(url,data)
    url = "http://192.172.4.60:9000/showservice/addShowInfo"
    data = '"headImg":"","title":"%E5%A4%A7%E9%BB%84%E8%9C%82&showInfo.showTime=2020-11-20+00%3A00%3A00&showInfo.showAddress=%E6%88%90%E9%83%BD%E5%B8%82&showInfo.showLength=120&showInfo.showType=1&showInfo.statue=0&showInfo.showDetails=%E5%8C%BA%E5%88%86%E6%96%B9%E6%B3%95&ticket1.level=1&ticket1.price=11&ticket1.stock=1&ticket2.level=2&ticket2.price=12&ticket2.stock=2&ticket3.level=3&ticket3.price=121&ticket3.stock=2"'