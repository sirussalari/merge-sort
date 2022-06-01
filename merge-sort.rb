class Sort
    @@unsorted = []
    @@n = 0
    @@completed = []

    def self.merge_sort(arr, left_half = [], right_half = [])
        if @@unsorted.empty?
            @@unsorted = arr
        end

        half = arr.length.to_f / 2

        if @@n < half
            left_half.push(arr[@@n])
            @@n += 1
            self.merge_sort(arr, left_half, right_half)
        
        elsif arr[@@n]
            right_half.push(arr[@@n])
            @@n += 1
            self.merge_sort(arr, left_half, right_half)

        else
            if !left_half.empty?
                if left_half.length > 1
                    @@n = 0
                    self.merge_sort(left_half)
                else
                    if right_half.length == 1
                        self.sort(left = left_half, right = right_half)
                        @@n = @@completed.length
                        self.merge_sort(@@unsorted)
                    else
                        self.sort(left = left_half, right = [])
                        @@n = @@completed.length
                        self.merge_sort(@@unsorted)
                    end
                end

            else
                if right_half.length > 1
                    @@n = 0
                    self.merge_sort(right_half)
                end
            end

            return @@completed
        end
    end

    def self.sort(sorted = [], x = 0, y = 0, left, right)
        if left[x] or right[y]
            if !left[x]
                sorted.push(right[y])
                y += 1
            elsif !right[y]
                sorted.push(left[x])
                x += 1
            else
                if left[x] < right[y]
                    sorted.push(left[x])
                    x += 1
                
                elsif right[y] < left[x]
                    sorted.push(right[y])
                    y += 1
                
                else
                    sorted.push(left[x])
                    sorted.push(right[y])
                    x += 1
                    y += 1
                end
            end

            self.sort(sorted, x, y, left, right)
        
        else
            if @@completed.empty?
                for num in sorted
                    @@completed.push(num)
                end
                
            elsif left != @@completed
                self.sort(left = @@completed, right = sorted)
            else
                @@completed = sorted
            end
        end
    end
end