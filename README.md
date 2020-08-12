# Viterbi-Algorithm
This is about the implementation of (2,1,4) Convolutional Encoder and Viterbi Decoder using Verilog VHDL. 

## *Why Viterbi Algorithm?*

Convolutional coding is a coding scheme used in communication systems including deep space communications and wireless communications. It provides an alternative approach to block codes for transmission over a noisy channel. The block codes can be applied only for the block of data. The convolutional coding has an advantage over the block codes in that it can be applied to a continuous data stream as well as to blocks of data. IS-95, a wireless digital cellular standard for CDMA (Code Division Multiple Access), employs convolutional coding. A third generation wireless cellular standard, under preparation, plans to adopt turbo coding, which stems from the convolutional coding. The Viterbi decoding algorithm was proposed and analyzed by Viterbi in 1967. It is widely used as a decoding technique for convolutional codes as well as the bit detection method in storage devices. Viterbi decoders currently find their use in more than one billion cell phones. The algorithm works by forming trellis structure, which is eventually traced back for decoding the received information. Convolutional encoding with Viterbi decoding is a powerful method for forward error correction. The Viterbi algorithm essentially performs maximum likelihood decoding. However, it reduces the computational complexity by using trellis structure. Below Figure shows the convolutional encoder and Viterbi decoder, which is used in the digital communication system. Here, X is the input data steam, which is given into the convolutional encoder and it produces the encoded data stream (Y). The encoded data stream (Y) is given to the channel in the presence of noise. Hence, it produces the noise added encoded data stream (R). Finally, data stream (R) is given to the Viterbi decoder that produces the estimated data stream (Z) applied at the input.

![algovit](https://user-images.githubusercontent.com/65102010/90029266-4e202e80-dcd8-11ea-8a0a-b88a77d66ee7.png)

## *Convolutional Encoder*

Convolutional codes are very suitable to protecting the digital data transmission from random errors due to any noise source. It achieves error free transmission by adding sufficient redundancy to the source symbols. Convolutional codes are usually described using two parameters: the code rate and the constraint length. The code rate is expressed as a ratio of number of input symbols (k) into the channel encoder to the number of output symbols (n) by the channel encoder in a given cycle. Then, the code rate is expressed as, r = k/n bits/symbol The constraint length (K) denotes the length of the convolutional encoder. Convolutional encoder increases the length of the message sequence by adding redundant bits in order to increase the likelihood of detecting the transmitted sequence even if errors have occurred during transmission. Below Figure shows the convolutional encoder of constraint length (K) = 7 and code rate (r) = 1/2. A convolutional encoder generates redundant bits by using modulo-2 convolutions. Hence, it is called as Convolutional encoder. If n modulo-2 adders are used, then it produces n outputs for each bit. 

![encoder](https://user-images.githubusercontent.com/65102010/90027487-38116e80-dcd6-11ea-8d00-7995bf7681de.png)

## *Trellis Structure*

The Viterbi algorithm has been known as a maximum likelihood decoding algorithm for convolutional codes. Let us consider a simple example for illustrating the principle of Viterbi algorithm. Assume that a car that has 3 states forward, stop and reverse with the condition that a transition from forward to reverse is not allowed. In other words, it implies that the car first enter the stop state and then enter the reverse state. Hence, when we receive the information through the processes of forward, reverse and stop, we can safely interpret it as – forward, stop and reverse as this is a “maximum likelihood sequence”. The Viterbi algorithm uses the trellis diagram to compute the path metric value (accumulated distance) from the received sequence to the possible transmitted sequences. The total number of such trellis paths increases exponentially with the number of stages in the trellis. It causes potential complexity and memory problems. The Viterbi decoding algorithm has been classified into hard decision decoding and soft decision decoding. If the received signal is converted into two levels, either zero or one, it is called hard decision. If the input signal is quantized and processed for more than two levels, it is called soft decision. The soft decision decoding is expensive and require large amount of memory than hard decision decoding. Hence, this work focuses on the hard decision decoding. Figure 4 shows the trellis diagram for hard decision Viterbi decoding. When a sequence of data is received from the channel, it is desirable to estimate the original sequence that has been sent. The process of identifying such a sequence can be done using a diagram called ‘trellis’, which is shown in below figure. The detection of the original stream can be described as finding the most probable path through the trellis. In the trellis diagram each node specifies an individual state at a given time and indicates a possible pattern of recently received data bits. The transition to a new state at the next timing cycle is indicated by each branch.

![trellis_structure](https://user-images.githubusercontent.com/65102010/90031774-3dbd8300-dcdb-11ea-9f51-37d7d770f89e.png)

## *Viterbi Decoder*

Viterbi algorithm is used in the Viterbi decoder for decoding a bit stream that has been encoded using FEC based on a Convolutional code. Below Figure shows the block diagram of Viterbi decoder. It consists of the following functional units, namely, Branch Metric Unit, Path Metric Unit, Survivor Memory unit.

![Viterbi_decoder](https://user-images.githubusercontent.com/65102010/90032462-04d1de00-dcdc-11ea-94bd-e80f4813695b.png)

### (A) Branch Metric Unit

The comparison between received code symbol and expected code symbol is done by branch metric unit. It also counts the number of differing bits. It is the smallest unit in the Viterbi decoder. The measured value of the BMU can be the Hamming distance in case of the hard input decoding or the Euclidean distance in case of the soft input decoding.

### (B) Path Metric Unit

The partial path metric of each branch is computed by the use of two adders. The partial path metric is compared by the comparator and an appropriate branch is selected by the selector. The selector selects the smaller value and stored that value as the new path metric for each state. The corresponding bit decision is transferred to the SMU.

### (C) Survivor Memory Unit

The Survivor Memory Unit receives the bit decision from the PMU. This will produces the decoded sequence. After finishing the SMU, it is important to perform the trace back module. When the trellis diagram is finished, the trace-back module will search the maximum likelihood path from the final state which is state0 to the beginning state which is state0. Each time, the trace-back block just left shifts one bit of the binary state number and add one bit from the survivor path metric to compute the previous state. It stores the path information in the form of an array of recursive pointers. By doing this, the most likelihood path is found.

## *Implementation*

The Convolutional encoder and Viterbi decoder are implemented using Verilog HDL and the code has been developed under full-custom design. This implementation is complicated when using Verilog HDL compared to VHDL. The Convolutional encoder encodes the given input sequence by modulo-2 adders. The Viterbi decoder decodes the original input sequence by using Viterbi algorithm. The design flow of the Viterbi decoder is shown in below figure. From the trellis structure, we calculate the branch metric value and load that value. These values are added and compared. Then, the smallest value found in the process is the new path metric value. If all the states and the trellis stages are finished, then the trace back module is performed. It produces the decoded data (original input data).

![terbi-Decoding-Flowchart](https://user-images.githubusercontent.com/65102010/90033620-4adb7180-dcdd-11ea-9bcf-6eac619b7047.png)
