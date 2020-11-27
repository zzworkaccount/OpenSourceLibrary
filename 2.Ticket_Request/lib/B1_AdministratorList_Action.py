
# 管理员列表
class AL_Action:

    def __init__(self, session):
        self.session = session

    # 新增
    def do_add(self, add_url, add_method, add_data):
        return self.session.request(url=add_url, method=add_method, data=add_data)

    # 刷新
    def do_refresh(self, refresh_url, refresh_method):
        return self.session.request(url=refresh_url, method=refresh_method)

    # 修改
    def do_edit(self, edit_url, edit_method, edit_data):
        return self.session.request(url=edit_url, method=edit_method, data=edit_data)

    # 删除
    def do_delet(self, delet_url, delet_method):
        return self.session.request(url=delet_url, method=delet_method)

    # 查询
    def do_query(self, query_url, query_method):
        return self.session.request(url=query_url, method=query_method)


    # 查询角色
    def do_query_roles(self , query_roles_url, query_roles_method):
        return self.session.request(url=query_roles_url, method=query_roles_method)


    # 分配角色
    def do_assign_roles(self , assign_roles_url, assign_roles_method):
        return self.session.request(url=assign_roles_url, method=assign_roles_method)


    # 批量删除
    def do_batches_delete(self , batches_delete_url, batches_delete_method):
        return self.session.request(url=batches_delete_url, method=batches_delete_method)


    # 批量停用
    def do_batches_disabled(self , bbatches_disabled_url, batches_disabled_method):
        return self.session.request(url=bbatches_disabled_url, method=batches_disabled_method)


    # 批量启用
    def do_batches_enabled(self , batches_enabled_url, batches_enabled_method):
        return self.session.request(url=batches_enabled_url, method=batches_enabled_method)

