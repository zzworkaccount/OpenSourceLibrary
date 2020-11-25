class ACL_Action:
    def __init__(self, session):
        self.session = session

    # 新增
    def do_add(self, add_url, add_method, add_data):
        return self.session.request(url=add_url, method=add_method, data=add_data)


    # 删除
    def do_delet(self, delet_url, delet_method):
        return self.session.request(url=delet_url, method=delet_method)