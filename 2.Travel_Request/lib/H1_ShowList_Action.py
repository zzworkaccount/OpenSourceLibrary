import requests
from tools.service import Service


class SL_Action:

    def __init__(self , session):
        self.session = session

    def showlist_Action(self,method,url,para):
        res = self.session.request(url=url , method=method,params=para)
        return res
