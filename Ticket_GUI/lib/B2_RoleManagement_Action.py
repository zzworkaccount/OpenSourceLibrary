import time
from tools.service import Service

class Role_Action:
    def __init__(self):
        self.driver = Service.get_driver()
        self.driver.implicitly_wait(10)

    #点击系统管理
    def click_SystemManagement_button(self , centent_list):
        SystemManagement_button = self.driver.find_element(centent_list[0][0], centent_list[1][0])
        SystemManagement_button.click()

    #点击角色管理
    def click_RoleManagement_button(self , centent_list):
        RoleManagement_button = self.driver.find_element(centent_list[0][0], centent_list[1][1])
        RoleManagement_button.click()

    #点击添加角色
    def click_addrole_button(self , centent_list):
        self.driver.switch_to.frame(self.driver.find_element_by_xpath
                            ("//iframe[contains(@src,'/adminservice/Role_Management.do')]"))
        addrole_button = self.driver.find_element(centent_list[0][0], centent_list[1][2])
        addrole_button.click()

    #输入角色名
    def input_role(self , centent_list , username):
        self.driver.switch_to.frame(self.driver.find_element_by_xpath
                            ("//iframe[contains(@src,'/adminservice/toRoleAddPage.do')]"))

        role_ele = self.driver.find_element(centent_list[0][0], centent_list[1][3])
        Service.input_send(role_ele, username)

    #输入备注
    def input_remarks(self , centent_list , remarks):
        remarks_ele = self.driver.find_element(centent_list[0][0], centent_list[1][4])
        Service.input_send(remarks_ele, remarks)

    #点击立刻提交
    def click_Submit_button(self , centent_list):
        #self.driver.switch_to.frame(self.driver.find_element_by_xpath("//iframe[contains(@src,'/adminservice/toRoleAddPage.do')]"))
        Submit_button = self.driver.find_element(centent_list[0][0], centent_list[1][5])
        Submit_button.click()

    #完成添加动作
    def do_SystemManagement(self, centent_data, username, remarks):
        Service.Lose_login(self.driver)
        self.click_SystemManagement_button(centent_data)
        self.click_RoleManagement_button(centent_data)
        self.click_addrole_button(centent_data)
        time.sleep(3)
        self.input_role(centent_data,username)
        time.sleep(1)
        self.input_remarks(centent_data, remarks)
        time.sleep(1)
        self.click_Submit_button(centent_data)
        self.driver.refresh()
        self.driver.switch_to.frame(self.driver.find_element_by_xpath
                                    ("//iframe[contains(@src,'/adminservice/Role_Management.do')]"))

    #点击删除
    def click_delete_button(self , centent_list):
        self.driver.switch_to.frame(self.driver.find_element_by_xpath
                                    ("//iframe[contains(@src,'/adminservice/Role_Management.do')]"))
        ele_list1 = self.driver.find_elements_by_xpath \
                         ('/html/body/div/div[2]/div[2]/div[2]/table/tbody//td[3]/div')
        delete_button = self.driver.find_element(centent_list[0][0], centent_list[1][6])
        delete_button.click()
        return ele_list1

    #确认删除
    def confirm_delete_button(self , centent_list):
        confirm_button = self.driver.find_element(centent_list[0][0], centent_list[1][7])
        confirm_button.click()

    # 完成删除动作
    def do_delete(self, centent_data):
        Service.Lose_login(self.driver)
        self.click_SystemManagement_button(centent_data)
        self.click_RoleManagement_button(centent_data)
        time.sleep(3)
        self.click_delete_button(centent_data)
        time.sleep(2)
        self.confirm_delete_button(centent_data)


