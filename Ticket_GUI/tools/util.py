#封装不操作软件的工具类
class Utility:

    PROJECT_NAME = 'WoniuTicket_GUI'

    # 获取当前文件的绝对路径
    @classmethod
    def get_file_path(cls):
        import os
        file_path = os.path.abspath('')
        return file_path

    #读取json文件
    @classmethod
    def get_json(cls,path):
        import json
        with open(path,encoding="utf-8") as op:
            contents = json.load(op)
        return contents

    # 读取yaml文件
    @classmethod
    def get_yaml(cls,path):
        import yaml
        with open(path,encoding="utf-8") as op:
            # 忽略yaml不推荐使用的警告
            yaml.warnings({'YAMLLoadWarning': False})
            contents = yaml.load(op)
        return contents

    # 传入元素json文件路径，从json文件中读取元素信息，返回列表套字典
    @classmethod
    def get_ele_json(self , ele_path):
        ele_dict = Utility.get_json(ele_path)
        return ele_dict

    # 传入元素字典，处理成元素定位方式列表，和元素值列表
    @classmethod
    def get_element_value(cls , ele_dict):
        ele_data = []
        ele_method_list = []
        ele_path_list = []
        sun_ele = []
        for ele_values in ele_dict.values():
            ele_data.append(ele_values)
        for i in ele_data:
            ele_method , ele_path = i.split('=' , 1)
            ele_method_list.append(ele_method)
            ele_path_list.append(ele_path)
        sun_ele.append(ele_method_list)
        sun_ele.append(ele_path_list)
        return sun_ele

    # 从Excel表格中获取数据
    @classmethod
    def get_excel(cls,conf):
        import xlrd
        test_info = []
        workbook = xlrd.open_workbook(cls.get_root_path()+"\\data\\Save_TestData\\"+conf['EXCELNAME'])
        contents = workbook.sheet_by_name(conf['SHEETNAME'])
        for i in range(conf['START_ROW'],conf['END_ROW']):
            cases_name = contents.cell(i,conf['CASESNAME']).value
            test_data = contents.cell(i,conf['TESTDATA_COL']).value
            expect = contents.cell(i,conf['EXPECT_COL']).value
            temp = test_data.split('\n')
            list = []
            for j in temp:
                if '=' in j:
                    list.append(j.split('=')[1])
            list.append(expect)
            list.append(cases_name)
            test_info.append(tuple(list))
        return test_info

    # 从Excel表格中获取数据
    @classmethod
    def get_excel_sss(cls, conf):
        import xlrd
        test_info = []
        workbook = xlrd.open_workbook(cls.get_root_path() + "\\data\\Save_TestData\\" + conf['EXCELNAME'])
        contents = workbook.sheet_by_name(conf['SHEETNAME'])
        for i in range(conf['START_ROW'], conf['END_ROW']):
            test_data = contents.cell(i, conf['TESTDATA_COL']).value
            expect = contents.cell(i, conf['EXPECT_COL']).value
            temp = test_data.split('\n')
            list = []
            for j in temp:
                list.append(j.split('=')[1])
            list.append(expect)
            test_info.append((tuple(list),))
        return test_info

    # 创建数据库连接
    @classmethod
    def getConn(cls):
        import pymysql
        contents = cls.get_json(cls.get_root_path()+'\\conf\\Base_conf\\base.conf')
        return pymysql.connect(contents[0]['HOSTNAME'],
                               contents[0]['DBUSER'], contents[0]['DBPASS'],
                               contents[0]['DBNAME'], charset='utf8')

    # 查询一条记录
    @classmethod
    def query_one(cls, sql):
        conn = cls.getConn()
        cur = conn.cursor()
        try:
            cur.execute(sql)
            result = cur.fetchone()
        except Exception as e:
            result = None
        finally:
            cur.close()
            conn.close()
        return result

    # 查询多条记录
    @classmethod
    def query_all(cls, sql):
        conn = cls.getConn()
        cur = conn.cursor()
        try:
            cur.execute(sql)
            result = cur.fetchall()
        except Exception as e:
            result = None
        finally:
            cur.close()
            conn.close()
        return result


    @classmethod
    def get_root_path(self):
        import os
        current_path = os.path.abspath(__file__)
        root_path = current_path[:current_path.index(self.PROJECT_NAME)+len(self.PROJECT_NAME)]
        return root_path
