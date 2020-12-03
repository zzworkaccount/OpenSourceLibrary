import time
from tools.service import Service

class Film_management:
    def __init__(self):
        self.driver = Service.get_driver()
        self.driver.implicitly_wait(10)

    #点击影片管理
    def click_Film_management_button(self , centent_list):
        Film_management_button = self.driver.find_element(centent_list[0][0], centent_list[1][0])
        Film_management_button.click()

    #点击演员管理
    def click_Actor_management_button(self , centent_list):
        Actor_management_button = self.driver.find_element(centent_list[0][0], centent_list[1][1])
        Actor_management_button.click()

    #点击增加演员
    def click_add_performer_button(self , centent_list):
        self.driver.switch_to.frame(self.driver.find_element_by_xpath
                                    ("//iframe[contains(@src,'MovieActor.do')]"))
        add_performer_button = self.driver.find_element(centent_list[0][0], centent_list[1][2])
        add_performer_button.click()

    # 输入角色名
    def input_username(self, centent_list, username):
        self.driver.switch_to.frame(self.driver.find_element_by_xpath
                                    ("//iframe[contains(@src,'/movieservice/toMovieActorAddPage.do')]"))
        username_ele = self.driver.find_element(centent_list[0][0], centent_list[1][3])
        Service.input_send(username_ele, username)

    #输入身份
    def input_identity(self , centent_list , identity):
        identity_ele = self.driver.find_element(centent_list[0][0], centent_list[1][4])
        Service.input_send(identity_ele, identity)

    #点击立刻添加
    def click_click_add_button(self , centent_list):
        click_add_button = self.driver.find_element(centent_list[0][0], centent_list[1][5])
        click_add_button.click()

    #点击编辑
    def click_edit_button(self , centent_list):
        self.driver.switch_to.frame(self.driver.find_element_by_xpath
                                    ("//iframe[contains(@src,'MovieActor.do')]"))
        click_edit_button = self.driver.find_element(centent_list[0][0], centent_list[1][6])
        click_edit_button.click()

    #再次点击编辑
    def again_click_edit_button(self , centent_list):
        self.driver.switch_to.frame(self.driver.find_element_by_xpath
                                    ("//iframe[contains(@src,'/movieservice/toMovieActorEdit.do')]"))
        click_edit_button = self.driver.find_element(centent_list[0][0], centent_list[1][7])
        click_edit_button.click()

    #修改姓名
    def edit_name(self,centent_list,username):
        self.driver.switch_to.frame(self.driver.find_element_by_xpath
                                    ("//iframe[contains(@src,'/movieservice/tomovieActorEditOne.do')]"))
        username_ele = self.driver.find_element(centent_list[0][0], centent_list[1][8])
        username_ele.clear()
        Service.input_send(username_ele, username)

    #修改身份
    def edit_identity(self, centent_list, identity):
        edit_identity_ele = self.driver.find_element(centent_list[0][0], centent_list[1][10])
        edit_identity_ele.clear()
        Service.input_send(edit_identity_ele, identity)

    #点击立刻修改
    def click_alter_button(self , centent_list):
        Actor_management_button = self.driver.find_element(centent_list[0][0], centent_list[1][9])
        Actor_management_button.click()

    #添加动作
    def do_FilmManagement(self,centent_data, username,identity):
        Service.Lose_TBM_login(self.driver)
        self.click_Film_management_button(centent_data)
        self.click_Actor_management_button(centent_data)
        time.sleep(3)
        self.click_add_performer_button(centent_data)
        time.sleep(3)
        self.input_username(centent_data,username)
        self.input_identity(centent_data, identity)
        self.click_click_add_button(centent_data)
        self.driver.refresh()
        self.click_edit_button(centent_data)
        self.driver.switch_to.frame(self.driver.find_element_by_xpath
                                    ("//iframe[contains(@src,'/movieservice/toMovieActorEdit.do')]"))

    #编辑动作
    def do_edit_FM(self, centent_data, username, identity):
        Service.Lose_TBM_login(self.driver)
        self.click_Film_management_button(centent_data)
        self.click_Actor_management_button(centent_data)
        time.sleep(3)
        self.click_edit_button(centent_data)
        time.sleep(3)
        self.again_click_edit_button(centent_data)
        time.sleep(2)
        self.edit_name(centent_data, username)
        self.edit_identity(centent_data, identity)
        self.click_alter_button(centent_data)
        time.sleep(2)
        self.driver.refresh()
        self.click_edit_button(centent_data)
        self.driver.switch_to.frame(self.driver.find_element_by_xpath
                                    ("//iframe[contains(@src,'/movieservice/toMovieActorEdit.do')]"))

    # 编辑失败动作
