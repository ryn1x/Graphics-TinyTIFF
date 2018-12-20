NAME
====

Graphics::TinyTIFF - Perl6 bindings to [a slightly modified] TinyTIFF

DEPENDANCIES
============

Unix
```
git clone https://github.com/ryn1x/TinyTIFF.git
cd TinyTIFF
mkdir build
cd build
cmake ..
make
sudo make install
```

Windows
```
git clone https://github.com/ryn1x/TinyTIFF.git
cd TinyTIFF
mkdir build
cd build
cmake ..
cmake -DCMAKE_WINDOWS_EXPORT_ALL_SYMBOLS=TRUE -DBUILD_SHARED_LIBS=TRUE -G "Visual Studio 15 2017 win64" ..
build generated ".sln" file with visual studio
```

INSTALL
======

zef install Graphics::TinyTIFF


SYNOPSIS
========

    use Graphics::TinyTIFF;

### sub TinyTIFFReader_open

```perl6
sub TinyTIFFReader_open(
    str $filename is rw
) returns NativeCall::Types::Pointer
```

open tiff file for reading

### sub TinyTIFFReader_getSampleData

```perl6
sub TinyTIFFReader_getSampleData(
    NativeCall::Types::Pointer $,
    Blob $ is rw,
    uint16 $
) returns int32
```

read data from current frame into supplied buffer

### sub TinyTIFFReader_close

```perl6
sub TinyTIFFReader_close(
    NativeCall::Types::Pointer $
) returns Mu
```

close the tiff file

### sub TinyTIFFReader_getBitsPerSample

```perl6
sub TinyTIFFReader_getBitsPerSample(
    NativeCall::Types::Pointer $,
    int32 $
) returns uint16
```

return bits per sample of current frame

### sub TinyTIFFReader_getWidth

```perl6
sub TinyTIFFReader_getWidth(
    NativeCall::Types::Pointer $
) returns uint32
```

return width of current frame

### sub TinyTIFFReader_getHeight

```perl6
sub TinyTIFFReader_getHeight(
    NativeCall::Types::Pointer $
) returns uint32
```

return height of current frame

### sub TinyTIFFReader_countFrames

```perl6
sub TinyTIFFReader_countFrames(
    NativeCall::Types::Pointer $
) returns uint32
```

return number of frames

### sub TinyTIFFReader_getSampleFormat

```perl6
sub TinyTIFFReader_getSampleFormat(
    NativeCall::Types::Pointer $
) returns uint16
```

return sample format of current frame

### sub TinyTIFFReader_getSamplesPerPixel

```perl6
sub TinyTIFFReader_getSamplesPerPixel(
    NativeCall::Types::Pointer $
) returns uint16
```

return samples per pixel of current frame

### sub TinyTIFFReader_getImageDescription

```perl6
sub TinyTIFFReader_getImageDescription(
    NativeCall::Types::Pointer $
) returns str
```

return image descrition of current frame

### sub TinyTIFFReader_hasNext

```perl6
sub TinyTIFFReader_hasNext(
    NativeCall::Types::Pointer $
) returns int32
```

retun non-zero if another frame exists

### sub TinyTIFFReader_readNext

```perl6
sub TinyTIFFReader_readNext(
    NativeCall::Types::Pointer $
) returns int32
```

read the next frame from a multi-frame tiff

### sub TinyTIFFReader_success

```perl6
sub TinyTIFFReader_success(
    NativeCall::Types::Pointer $
) returns int32
```

return non-zero if no error in last function call

### sub TinyTIFFReader_wasError

```perl6
sub TinyTIFFReader_wasError(
    NativeCall::Types::Pointer $
) returns int32
```

return non-zero if error in last function call

### sub TinyTIFFReader_getLastError

```perl6
sub TinyTIFFReader_getLastError(
    NativeCall::Types::Pointer $
) returns str
```

return last error message

### sub TinyTIFFWriter_open

```perl6
sub TinyTIFFWriter_open(
    str $filename is rw,
    uint16 $bits-per-sample,
    uint32 $width,
    uint32 $height
) returns NativeCall::Types::Pointer
```

create a new tiff file

### sub TinyTIFFWriter_getMaxDescriptionTextSize

```perl6
sub TinyTIFFWriter_getMaxDescriptionTextSize() returns int32
```

get max size for image descrition

### sub TinyTIFFWriter_writeImageDouble

```perl6
sub TinyTIFFWriter_writeImageDouble(
    NativeCall::Types::Pointer $,
    Blob $ is rw
) returns Mu
```

writes row-major image data to a tiff file

### sub TinyTIFFWriter_writeImageFloat

```perl6
sub TinyTIFFWriter_writeImageFloat(
    NativeCall::Types::Pointer $,
    Blob $ is rw
) returns Mu
```

writes row-major image data to a tiff file

### sub TinyTIFFWriter_writeImageVoid

```perl6
sub TinyTIFFWriter_writeImageVoid(
    NativeCall::Types::Pointer $,
    Blob $ is rw
) returns Mu
```

writes row-major image data to a tiff file

### sub TinyTIFFWriter_close

```perl6
sub TinyTIFFWriter_close(
    NativeCall::Types::Pointer $,
    str $image-description is rw
) returns Mu
```

close the tiff and write image description to first frame

COPYRIGHT AND LICENSE
=====================

Copyright 2018 ryn1x

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

