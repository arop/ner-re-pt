#!/bin/bash
# -*- coding: utf8 -*-
#
# web.py
# José Devezas <joseluisdevezas@gmail.com>

from bs4 import BeautifulSoup

def html_to_text(html):
    soup = BeautifulSoup(html, "html5lib")

    for script in soup(["script", "style"]):
        script.extract()

    text = ' '.join(soup.strings)

    lines = [line.strip() for line in text.splitlines()]
    chunks = [phrase.strip() for line in lines for phrase in line.split(' ')]
    text = ' '.join(chunk for chunk in chunks if chunk)

    return text
