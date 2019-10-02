stack = (0..5).to_a.reverse

def hanoi(disks, from, temp, to)
    if disks == 1
        move(from.pop, from, to)
        return
    end
    
end

def move(disk, from, to)
    puts "Move #{disk} from tower #{from} to tower #{to}"
end