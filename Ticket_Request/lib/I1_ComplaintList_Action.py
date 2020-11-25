# 投诉列表
class CL_Action:
    def __init__(self, session):
        self.session = session

    # 删除
    def do_delet(self, delet_url, delet_method):
        return self.session.request(url=delet_url, method=delet_method)