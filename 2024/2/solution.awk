{
    safe = 1
    direction = ""
    current = $1

    for (i = 2; i <= NF; i++) {
        diff = ($i > current ? $i - current : current - $i)

        if (diff > 3) { print "unsafe - difference too large: " diff; safe = 0; break }
        if (diff == 0) { print "unsafe - no difference"; safe = 0; break }

        new_dir = ($i < current ? -1 : 1)
        if (direction && direction != new_dir) {
            print "unsafe - " (new_dir > 0 ? "increase after decrease" : "decrease after increase")
            safe = 0
            break
        }

        direction = new_dir
        current = $i
    }

    if (safe) print "safe"
}