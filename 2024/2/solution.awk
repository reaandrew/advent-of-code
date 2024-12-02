{
    safe=1
    for (i = 1; i<= NF; i++){
        if (current == ""){
            current = $i
            continue
        }

        current=$i
    }
    if(safe==1){
        print "safe"
    }
}