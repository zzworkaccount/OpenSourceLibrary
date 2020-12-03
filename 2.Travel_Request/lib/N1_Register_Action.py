class Register_Action:
    def __init__(self, session):
        self.session = session

    # 新增
    def do_add(self, add_url, add_method, add_data):
        return self.session.request(url=add_url, method=add_method, data=add_data)