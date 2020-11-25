class MUM_Action:
    def __init__(self, session):
        self.session = session

    # 删除
    def do_delet(self, delet_url, delet_method):
        return self.session.request(url=delet_url, method=delet_method)

    # 查询
    def do_query(self, query_url, query_method):
        return self.session.request(url=query_url, method=query_method)

    # 修改
    def do_edit(self, edit_url, edit_method, edit_data):
        return self.session.request(url=edit_url, method=edit_method, data=edit_data)

    # 新增
    def do_add(self, add_url, add_method, add_data):
        return self.session.request(url=add_url, method=add_method, data=add_data)