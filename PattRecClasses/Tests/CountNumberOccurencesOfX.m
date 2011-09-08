function sum = CountNumberOccurencesOfX( sequence, x )
    sum = 0;
    for i=1:length(sequence)
        if(sequence(i) == x)
            sum = sum + 1;
        end
    end
end
