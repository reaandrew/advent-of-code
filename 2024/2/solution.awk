BEGIN{
    current=0
    FS=" "
}
{
    current = 0
    for (i = 1; i<= NF; i++){
        if (current == 0){
            current = $i
        }else{
            if (current == $i){
                print "unsafe"
                break
            }
            current=$i
        }
    }
}