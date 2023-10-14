function sample_seq = GenerateSamples(bit_seq,fs)
%
% Inputs:
%   bit_seq:    Input bit sequence
%   fs:         Number of samples per bit
% Outputs:
%   sample_seq: The resultant sequence of samples
%
% This function takes a sequence of bits and generates a sequence of
% samples as per the input number of samples per bit

sample_seq = zeros(size(bit_seq*fs));
L=length(bit_seq);
pointer=1;
counter=0;
%%% WRITE YOUR CODE FOR PART 2 HERE
for i =1:1:L
    num=bit_seq(i);
    while counter<10
        sample_seq(pointer)=num;
        counter=counter+1;
        pointer=pointer+1;
    end
    counter=0;
end
%%%