function rec_bit_seq = DecodeBitsFromSamples(rec_sample_seq,case_type,fs)
%
% Inputs:
%   rec_sample_seq: The input sample sequence to the channel
%   case_type:      The sampling frequency used to generate the sample sequence
%   fs:             The bit flipping probability
% Outputs:
%   rec_sample_seq: The sequence of sample sequence after passing through the channel
%
% This function takes the sample sequence after passing through the
% channel, and decodes from it the sequence of bits based on the considered
% case and the sampling frequence

if (nargin <= 2)
    fs = 1;
end
pointer = 1;
switch case_type
    
    case 'part_1'
        %%% WRITE YOUR CODE FOR PART 1 HERE
            rec_bit_seq=rec_sample_seq;
        %%%
    case 'part_2'
        %%% WRITE YOUR CODE FOR PART 2 HERE
        L=length(rec_sample_seq);
        counter_zeros=0;
        counter_ones=0;
            for i=1:fs:L
                for j=0:1:fs-1
                    if rec_sample_seq(i+j)==0
                        counter_zeros=counter_zeros+1;
                    else
                        counter_ones=counter_ones+1;
                    end
                end
                if counter_ones>=counter_zeros
                    rec_bit_seq(pointer)=1;
                else
                    rec_bit_seq(pointer)=0;
                end
                counter_ones=0;
                counter_zeros=0;
                pointer=pointer+1;
            end
        %%%
    case 'part_3'
        %%% WRITE YOUR CODE FOR PART 3 HERE
        samples_length = length(rec_sample_seq);
        bits_length = samples_length / fs;
        rec_bit_seq = zeros(1, bits_length);
        
        for bits_ind = 1:bits_length
            samples_index = fs * bits_ind - (fs - 1);
            rec_bit_seq(bits_ind) = rec_sample_seq(samples_index);
        end
        %%%
end