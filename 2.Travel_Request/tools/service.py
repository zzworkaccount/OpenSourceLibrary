
from tools.util import Utility

#封装操作软件的工具类
class Service:


    # 系统后台
    @classmethod
    def get_session(cls):
        contents = Utility.get_json(Utility.get_root_path()+"\\conf\\Base_conf\\base.conf")[0]
        url = f"{contents['PROTOCOL']}://{contents['IP']}:{contents['PORT']}/{contents['PROGRAM']}"
        data = {"username": "admin", "password": "123456", "captcha": "123"}
        import requests
        session = requests.session()
        session.post(url, data)
        return session


    # 影院后台
    @classmethod
    def get_session_tm(cls):
        contents = Utility.get_json(Utility.get_root_path() + "\\conf\\Base_conf\\base.conf")[1]
        url = f"{contents['PROTOCOL']}://{contents['IP']}:{contents['PORT']}/{contents['PROGRAM']}"
        data = {"cTelephone": "18708133599", "cPassword": "19910713", "captcha": "123"}
        import requests
        session = requests.session()
        res = session.post(url, data)
        return session


    # app
    @classmethod
    def get_session_app(cls):
        contents = Utility.get_json(Utility.get_root_path()+"\\conf\\Base_conf\\base.conf")[2]
        url = f"{contents['PROTOCOL']}://{contents['IP']}:{contents['PORT']}/{contents['PROGRAM']}"
        data = {'phone':"18808246076","pwd":"123456"}
        import requests
        session = requests.session()
        res = session.post(url, data)
        return session

