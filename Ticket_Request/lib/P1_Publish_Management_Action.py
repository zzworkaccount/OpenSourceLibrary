from tools.service import Service


class PM_Action:
    def __init__(self , session):
        self.session = session

    def publish_Action(self, method, url, data):
        res = self.session.request(method=method,url=url,data=data)
        return res
if __name__ == '__main__':
    pass