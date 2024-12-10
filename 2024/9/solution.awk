{
    data = uncompress($0)
    packed_data = defrag(data)
    sum = checksum(packed_data)
    print sum
}