import requests



class APP_QueryByPhone_Action:
    def __init__(self):
        self.session = requests.session()

    def AQ_Action(self, method, url, para):
        res = self.session.request(method=method, url=url, params=para)
        return res
