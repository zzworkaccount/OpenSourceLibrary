import unittest
import warnings


from ddt import ddt, unpack, data

from data.Get_TestData.Get_Q1_Show_Data import Get_Appshow_TestData
from lib.Q3_QueryByPhone_Action import APP_QueryByPhone_Action
from tools.util import Utility


@ddt
class APP_QueryByPhone_Test(unittest.TestCase):
    def setUp(self) -> None:
        self.q = APP_QueryByPhone_Action()
        Utility.initialize_DB()
        warnings.simplefilter('ignore', ResourceWarning)

    input_data = Get_Appshow_TestData.get_appQueryByPhone_excel_data()

    @data(*input_data)
    @unpack
    def test_appshow(self,url,method,phone,casesname,expect):
        test_data = {"URL":url,"METHOD":method,"CASESNAME":casesname,"EXPECT":expect}
        para = {"phone":phone}
        res = self.q.AQ_Action(method=test_data["METHOD"],url=test_data["URL"],para=para)
        text = res.json()["data"]
        flag = False
        try:
            phone = text['phone']
            flag = True
        except TypeError:
            flag = False

        if flag:
            result = "query-pass"
        else:
            result = "query-fail"
        Utility.logger(test_data["CASESNAME"], flag, result, test_data["EXPECT"])
        self.assertEqual(result,test_data["EXPECT"])

if __name__ == '__main__':
    unittest.main()