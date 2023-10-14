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

switch case_type
    
    case 'part_1'
        %%% WRITE YOUR CODE FOR PART 1 HERE
        % I don't know how this works so for now the reciever is just a
        % short circuit
        % Surprisingly yes it is just a short circuit
        rec_bit_seq = rec_sample_seq;
        %%%
    case 'part_2'
        %%% WRITE YOUR CODE FOR PART 2 HERE
        % Decoding the repeated seq of bits 
        % a catch is that if the no of 0's = no of 1's we favor it to be 1
        samples_length = length(rec_sample_seq);
        bits_length = samples_length / fs;
        rec_bit_seq = zeros(1, bits_length);
        
        for bits_ind = 1:bits_length
            samples_index = fs * bits_ind - (fs - 1);
            window = rec_sample_seq(samples_index : samples_index + fs-1);
            window_avg = sum(window)/fs;
            rec_bit_seq(bits_ind) = (window_avg >= 0.5) * 1;
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