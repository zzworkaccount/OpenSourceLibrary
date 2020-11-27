#封装不操作软件的工具类
class Utility:

    PROJECT_NAME = 'WoniuTicket_Request'


    #读取json文件
    @classmethod
    def get_json(cls,path):
        import json
        with open(path,encoding="utf-8") as op:
            contents = json.load(op)
        return contents


    # 获取公共项目路径
    @classmethod
    def get_url_head(cls , uri , row=0):
        url_path = Utility.get_json(Utility.get_root_path() + "\\conf\\Base_conf\\base.conf")[row]
        url = url_path["PROTOCOL"] + "://" + url_path["IP"] + ":" + url_path["PORT"] + uri
        return url


    # 从Excel表格中获取数据
    @classmethod
    def get_excel(cls, conf , row=0):
        import xlrd
        workbook = xlrd.open_workbook(cls.get_root_path() + "\\data\\Save_TestData\\" + conf['EXCELNAME'])
        contents = workbook.sheet_by_name(conf['SHEETNAME'])
        testinfo = []
        for i in range(conf['START_ROW'], conf['END_ROW']):
            testdata = contents.cell(i, conf['TESTDATA_COL']).value
            expect = contents.cell(i, conf['EXPECT_COL']).value
            url_body = contents.cell(i, conf['URL_COL']).value
            method = contents.cell(i, conf['METHOD_COL']).value
            casesname = contents.cell(i, conf['CASESNAME']).value
            temp = testdata.split('\n')
            dict = {}
            url = cls.get_url_head(url_body , row)
            dict['url'] = url
            dict['method'] = method
            for t in temp:
                if "=" in t:
                    dict[t.split('=')[0]] = t.split('=')[1]
            dict['casesname'] = casesname
            dict['expect'] = expect
            testinfo.append(list(dict.values()))
        return testinfo


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


    # 获取项目跟路径
    @classmethod
    def get_root_path(self):
        import os
        current_path = os.path.abspath(__file__)
        root_path = current_path[:current_path.index(self.PROJECT_NAME)+len(self.PROJECT_NAME)]
        return root_path


    # 重置数据库
    @classmethod
    def initialize_DB(cls):
        path = cls.get_root_path()+'\wts.sql'
        import os
        os.system(f"mysql -h192.172.4.60 -u root -p123456 --default-character-set=utf8 wts <{path}")


    # 获取当前系统时间
    @classmethod
    def get_ctime(cls):
        import time
        ctime = time.strftime('%Y-%m-%d_%H-%M-%S', time.localtime())
        return ctime


    # 自定义日志
    @classmethod
    def logger(cls , casesname , centent , restul , expect):
        import time
        import sys
        temp = sys.stdout
        sys.stdout = open(cls.get_root_path()+'\\report\\report_log\\log.txt', 'a' , encoding='utf-8')
        ctime = time.strftime('%Y-%m-%d  %H:%M:%S', time.localtime())
        print("INFO   " + ctime + f" [{casesname}-->{centent}] 实际：{restul}：预期：{expect}")
        sys.stdout = temp
        print("INFO   " + ctime + f" [{casesname}-->{centent}] 实际：{restul}：预期：{expect}")

