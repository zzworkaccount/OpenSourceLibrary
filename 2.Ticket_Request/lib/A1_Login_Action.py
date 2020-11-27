# 登录动作

class L_Action:

    def __init__(self , session):
        self.session = session



    def do_login(self , login_url , login_method , login_data):
        return self.session.request(url=login_url , method=login_method, data=login_data)



