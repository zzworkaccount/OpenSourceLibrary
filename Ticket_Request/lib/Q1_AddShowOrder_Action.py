import requests


class APP_ADShow_Action:
    def __init__(self):
        self.session =  requests.session()

    def APP_AD_Action(self,method,url,para):
        res = self.session.request(method=method,url=url,data=para)
        return res