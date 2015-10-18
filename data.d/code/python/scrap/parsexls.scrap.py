#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""JUNK"""

from time import sleep
from getpass import getpass
import os
import sys
import re
import smtplib
from datetime import date
from random import randint

import xlrd

from ref.myinfo.gmail import TAKA16, DAILY
from dateutil import WEEKDAY_JDIC


def gmail_setup():
    r"""SUMMARY

    gmail_setup()

    @Return:
    """
    server = smtplib.SMTP('smtp.gmail.com', 587)
    server.ehlo()
    server.starttls()
    return server

class MyGmail(object):
    r"""
    """

    def __init__(self, from_=None, to=None, passwd=None):
        r"""

        @Arguments:
        - `passwd`:
        """
        self.FROM = from_
        self.TO = to
        self._passwd = passwd
        self._server = smtplib.SMTP('smtp.gmail.com', 587)
        self._server.ehlo()
        self._server.starttls()

    def login(self, user, passwd=None, delpass=True):
        r"""SUMMARY

        login(passwd=None)

        @Arguments:
        - `passwd`:

        @Return:
        """
        if passwd:
            self._passwd = passwd
        if not self._passwd:
            self._passwd = getpass('Input password: ')
        self._server.login(user, self._passwd)
        if delpass:
            self.delpassword()

    def delpassword(self, ):
        r"""SUMMARY

        delpassword()

        @Return:
        """
        self._passwd = None

    def setfrom(self, from_):
        r"""SUMMARY

        setfrom(from_)

        @Arguments:
        - `from_`:

        @Return:
        """
        self.FROM = from_

    def setto(self, to):
        r"""SUMMARY

        setto(to)

        @Arguments:
        - `to`:

        @Return:
        """
        self.TO = to

    def send(self, msg, from_=None, to=None):
        r"""SUMMARY

        send()

        @Return:
        """
        if from_:
            self.setfrom(from_)
        if to:
            self.setto(to)
        self._server.sendmail(self.FROM, self.TO, msg)


#### smtp setup
USER = TAKA16
FROM = TAKA16
TO = [DAILY] # list
MSGFMT = 'From: {0[FROM]}\nTO: {0[TO]}\nSubject: {0[SUBJECT]}\n\n{0[BODY]}'

mygmail = MyGmail(FROM, TO)
mygmail.login(USER, passwd='Taka83 a76.')
MAILFORM = {'FROM': FROM,
            'TO': TO[0], }

SUBJECT_FMT = u'【exported from xls】{}'.encode('utf-8')
BODY_FMT = ('DATE: {0[DATE]}({0[WEEKDAY]})\n'
            '天気: {0[WEATHER]}\n'
            '会った人: {0[MET]}\n'
            '内容: {0[BODY]}\n'
            '他: {0[ETC]}')

XLS_FILE = '/tmp/sdf.xls'
DATE_COLL = 0
WEEKDAY_COLL = 1
WEATHER_COLL = 2
MET_COLL = 3
BODY_COLL = 4
ETC_COLL = 5

try:
    BOOK = xlrd.open_workbook(XLS_FILE)
except IOError, err:
    print('Failed open {}'.format(XLS_FILE))

SHEET = BOOK.sheet_by_index(2)


for i in xrange(1, SHEET.nrows):
    met = SHEET.cell_value(rowx=i, colx=MET_COLL).encode('utf-8')
    body = SHEET.cell_value(rowx=i, colx=BODY_COLL).encode('utf-8')
    etc = SHEET.cell_value(rowx=i, colx=ETC_COLL).encode('utf-8')
    if not (met or body or etc):
        continue
    dic = {'DATE': '',
           'WEEKDAY': '',
           'WEATHER': '',
           'MET': met,
           'BODY': body,
           'ETC': etc}
    datetpl = xlrd.xldate_as_tuple(SHEET.cell_value(rowx=i, colx=DATE_COLL), 0)
    # Ailias dayinst == day instance
    dayinst = date(year=datetpl[0], month=datetpl[1], day=datetpl[2])
    dic['DATE'] = dayinst.strftime('%Y/%m/%d')
    dic['WEEKDAY'] = WEEKDAY_JDIC.get(dayinst.weekday()).encode('utf-8')
    dic['WEATHER'] = SHEET.cell_value(rowx=i, colx=WEATHER_COLL).encode('utf-8')
    # mygmail.send(MSGFMT.format(dic))
    body_text = BODY_FMT.format(dic)
    msgdic = {'FROM': mygmail.FROM,
              'TO': ', '.join(mygmail.TO),
              'SUBJECT': SUBJECT_FMT.format(dic.get('DATE')),
              'BODY': body_text}
    msg = MSGFMT.format(msgdic)
    print(dic.get('DATE'))
    mygmail.send(msg)
    sleep(randint(1, 4))
