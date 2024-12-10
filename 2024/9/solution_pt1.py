import sys
import unittest


def uncompress(data):
    result = []
    position=0
    for index, value in enumerate(data):
        if index % 2 == 0:
            result += [position]*int(value)
            position+=1
        else:
            result += ['.'] * int(value)
    return result

def compact(data):
    left = 0
    right = len(data)-1

    while left < right:
        if data[left] == ".":
            if data[right] != ".":
                temp=data[left]
                data[left]=data[right]
                data[right]=temp
                right-=1
                left+=1
            else:
                right-=1
        else:
            left += 1
    return data

def checksum(data):
    return sum(index * int(value) for index, value in enumerate(data) if value != ".")

if __name__ == '__main__':
    data=list(sys.argv[1])
    data=uncompress(data)
    data=compact(data)
    print(checksum(data))

class TestPart1(unittest.TestCase):

    def test_uncompress(self):
        input="2333133121414131402"
        expected="00...111...2...333.44.5555.6666.777.888899"
        actual=uncompress(input)
        self.assertEqual(expected, ".".join(map(str,actual)))

    def test_compact(self):
        input="00...111...2...333.44.5555.6666.777.888899"
        expected="0099811188827773336446555566.............."
        actual=compact(list(input))
        self.assertEqual(expected, "".join(map(str,actual)))

    def test_checksum(self):
        input="0099811188827773336446555566.............."
        expected=1928
        actual=checksum(list(input))
        self.assertEqual(expected, actual)