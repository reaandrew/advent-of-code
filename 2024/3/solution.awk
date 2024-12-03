{
    if ( match($0,/mul\(([0-9]+),([0-9]+)\)/, arr) ){
        print arr[1] * arr[2]
    }else{
        print "corrupt"
    }
}