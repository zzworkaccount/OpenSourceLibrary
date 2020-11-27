# 程序入口，生成测试报告
import unittest
from BeautifulReport import BeautifulReport
from tools.util import Utility

if __name__ == '__main__':
    suite_tests = unittest.defaultTestLoader.discover\
        (Utility.get_root_path()+"\\cases", pattern="*Test.py")
    BeautifulReport \
        (suite_tests).report(filename='Ticket测试报告', description='Ticket测试报告',
                             report_dir=Utility.get_root_path()+'\\report\\report_info')