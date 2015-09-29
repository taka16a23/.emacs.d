#!/usr/bin/env python
# -*- coding: utf-8 -*-

def psychologist():
    """SUMMARY

    @Return:
    """
    print('Please tell me your problems')
    while 1:
        answer = (yield)
        if answer is not None:
            if answer.endswith('?'):
                print("Don't ask")
            elif 'good' in answer:
                print("that's good")
            elif 'bad' in answer:
                print("Don't be negative")


def _main():
    free = psychologist()
    free.next()
    free.send('I feel bad')

if __name__ == '__main__':
    _main()
