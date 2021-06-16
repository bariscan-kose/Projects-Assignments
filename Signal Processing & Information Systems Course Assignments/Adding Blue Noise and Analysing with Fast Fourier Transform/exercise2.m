clear all;
%Read the signal
[voice,fs]=audioread('SoundTest.m4a');
plot(voice);
sound(voice,fs);
voice=voice';
time=0:1/fs:(length(voice)-1)/fs;
subplot(3,2,1);
plot(time,voice);
title('original voice')

%Frequency Spectrum

voice_freq=fftshift(fft(voice));
freq= -fs/2:fs/(length(voice_freq)-1):fs/2;
subplot(3,2,2)
plot(freq,abs(voice_freq));
title('Frequency Spectrum of the signal')

%Noise
%{
%White NOise 

whiteNoise=wgn(length(time),1,-30);
subplot(3,2,3);
plot(time,whiteNoise)
whiteNoise_freq=fftshift(fft(whiteNoise));
subplot(3,2,4)
title('Frequency spectrum of WN')
plot(freq,abs(whiteNoise_freq));
%}
%Pink Noise
%{
pink=dsp.ColoredNoise('Color','pink','SamplesPerFrame',length(voice));
pinkNoise=pink();
pinkNoise=pinkNoise'/max(pinkNoise)/10;
subplot(3,2,3);
plot(time,pinkNoise)
title('Pink Noise')
subplot(3,2,4)
pinkNoise_freq=fftshift(fft(pinkNoise));
plot(freq,abs(pinkNoise_freq));
title('Frequency spectrum of PN')
%}

%Blue Noise 
blue=dsp.ColoredNoise('Color','blue','SamplesPerFrame',length(voice));
blueNoise=blue();
blueNoise=blueNoise'/max(blueNoise)/10;
subplot(3,2,3);
plot(time,blueNoise)
title('Blue Noise')
subplot(3,2,4)
blueNoise_freq=fftshift(fft(blueNoise));
plot(freq,abs(blueNoise_freq));
title('Frequency spectrum of BN')

%Adding PN to Voice
pVoice=voice+blueNoise;
subplot(3,2,5)
plot(time,pVoice)
title('Voice+Blue Noise')

subplot(3,2,6)
pVoice_freq=fftshift(fft(pVoice));
plot(freq,abs(pVoice_freq));
title('Voice+Blue Noise Frequency Spectrum')

