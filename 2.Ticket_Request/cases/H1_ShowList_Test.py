import unittest
import warnings

from data.Get_TestData.Get_H1_LMT_Data import Get_LM_TestData
from ddt import ddt, unpack, data
from lib.H1_ShowList_Action import SL_Action


# 演出列表
from tools.service import Service
from tools.util import Utility


@ddt
class ShowList_Test(unittest.TestCase):

    def setUp(self) -> None:
        self.s = SL_Action(Service.get_session())
        Utility.initialize_DB()
        warnings.simplefilter('ignore', ResourceWarning)


    input_data = Get_LM_TestData.get_LMT_showlist_data()

    @data(*input_data)
    @unpack
    def test_showlist(self,url,method,currrentpage,keyword,casename,expect):
        test_data = {"URL":url,"Method":method,"EXPECT":expect}
        para = {"currentPage":currrentpage,"keyword":keyword}
        res = self.s.showlist_Action(method=test_data["Method"],url=test_data["URL"],para=para)
        text = res.json()
        if len(text["data"]["list"]) == 0:
            resutl = 'query-fail'
        else:
            resutl = 'query-pass'
        Utility.logger(casename,len(text["data"]["list"]),resutl,expect)
        self.assertEqual(resutl, test_data["EXPECT"])


if __name__ == '__main__':
    unittest.main()