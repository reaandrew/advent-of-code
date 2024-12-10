import sys
import unittest

def uncompress(data):
    result = []
    position = 0
    for index, value in enumerate(data):
        if index % 2 == 0:
            result += [position]*int(value)
            position += 1
        else:
            result += ['.'] * int(value)
    return result

def compact(data):
    files = []
    i = 0
    while i < len(data):
        if data[i] != '.' and isinstance(data[i], int):
            file_id = data[i]
            start = i
            while i < len(data) and data[i] == file_id:
                i += 1
            length = i - start
            files.append((file_id, start, length))
        else:
            i += 1

    files.sort(key=lambda f: f[0], reverse=True)

    for (file_id, start, length) in files:
        target_pos = find_leftmost_space(data, length, start)
        if target_pos is not None:
            for j in range(start, start + length):
                data[j] = '.'
            for j in range(target_pos, target_pos + length):
                data[j] = file_id

    return data

def find_leftmost_space(data, length, limit):
    count = 0
    start_index = None
    for i in range(limit):
        if data[i] == '.':
            if start_index is None:
                start_index = i
            count += 1
            if count >= length:
                return start_index
        else:
            count = 0
            start_index = None
    return None

def checksum(data):
    return sum(index * value for index, value in enumerate(data) if value != ".")

if __name__ == '__main__':
    data = list(sys.argv[1])
    data = uncompress(data)
    data = compact(data)
    print(checksum(data))

class TestPart2(unittest.TestCase):

    def test_compact(self):
        data =  uncompress("2333133121414131402")
        expected = "00992111777.44.333....5555.6666.....8888.."
        actual = compact(data)
        self.assertEqual(expected, "".join(map(str,actual)))

    def test_find_leftmost_space(self):
        # Test input: data with some free space
        data = [
            0, 0, '.', '.', '.', 1, 1, 1, '.', '.', '.', 2, '.', '.', 3, 3, 3, '.', 4, 4, '.', 5, 5, 5, 5
        ]
        length = 3
        limit = 10
        expected_output = 2  # The span starts at index 2
        result = find_leftmost_space(data, length, limit)

        self.assertEqual(expected_output, result)
