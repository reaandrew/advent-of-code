function defrag(data,   arr){
    split(data, chars, "")
    # Get the length of the array
    n = length(arr)

    # Bubble Sort with two pointers
    for (i = 1; i <= n; i++) {
        left = 1
        right = 2

        while (right <= n - i + 1) {
            if (arr[left] > arr[right]) {
                # Swap arr[left] and arr[right]
                temp = arr[left]
                arr[left] = arr[right]
                arr[right] = temp
            }
            # Move pointers forward
            left++
            right++
        }
    }

    output=""
    for (k = 1; k <= n; k++) {
        output = output "" arr[k]
    }
    return output
}