function uncompress(input,   chars,fileindex,n,output,i,j){
    fileindex=0
    n = split(input, chars, "")
    output=""
    for (i = 1; i < n+1; i++){
        if (i %2 == 1){
            for(j = 0; j < chars[i]; j++){
                output = output "" fileindex
            }
            fileindex++
        }else{
            for(j = 0; j < chars[i]; j++){
                output = output "" "."
            }
        }
    }
    return output
}