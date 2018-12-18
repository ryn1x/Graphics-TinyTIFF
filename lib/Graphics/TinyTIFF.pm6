use v6.c;
use NativeCall;

unit module Graphics::TinyTIFF:ver<0.0.1>;

#struct TinyTIFFReaderFrame {
    #uint32_t width;
    #uint32_t height;
    #uint16_t compression;

    #uint32_t rowsperstrip;
    #uint32_t* stripoffsets;
    #uint32_t* stripbytecounts;
    #uint32_t stripcount;
    #uint16_t samplesperpixel;
    #uint16_t* bitspersample;
    #uint16_t planarconfiguration;
    #uint16_t sampleformat;
    #uint32_t imagelength;

    #char* description;
#};

class TinyTIFFReaderFrame is repr('CStruct') is export {
    has uint32         $.width;
    has uint32         $.height;
    has uint16         $.compression;
    has uint32         $.rowsperstrip;
    has CArray[uint32] $.stripoffsets;
    has CArray[uint32] $.stripbytecounts;
    has uint32         $.stripcount;
    has uint16         $.samplesperpixel;
    has CArray[uint16] $.bitspersample;
    has uint16         $.planarconfiguration;
    has uint16         $.sampleformat;
    has uint32         $.imagelength;
    has str            $.description;
}

#struct TinyTIFFReaderFile {
    #HANDLE hFile;
    #FILE* file;
    #char lastError[TIFF_LAST_ERROR_SIZE];
    #int wasError;
    #uint8_t systembyteorder;
    #uint8_t filebyteorder;
    #uint32_t firstrecord_offset;
    #uint32_t nextifd_offset;
    #uint64_t filesize;
    #TinyTIFFReaderFrame currentFrame;
#};

class TinyTIFFReaderFile is repr('CStruct') is export {
    has Pointer $.hFile; # HANDLE
    has Pointer $.file;  # FILE
    has str     $.lastError;
    has int32   $.wasError;
    has uint8   $.systembyteorder;
    has uint8   $.filebyteorder;
    has uint32  $.firstrecord_offset;
    has uint32  $.nextifd_offset;
    has uint64  $.filesize;

    has TinyTIFFReaderFrame $.currentFrame;
}

#struct TinyTIFFFile {
    #HANDLE hFile;
    #FILE* file;
    #uint32_t lastIFDOffsetField;
    #long int lastStartPos;
    #uint32_t lastIFDDATAAdress;
    #uint16_t lastIFDCount;
    #uint8_t* lastHeader;
    #int lastHeaderSize;
    #uint32_t pos;
    #uint32_t width;
    #uint32_t height;
    #uint16_t bitspersample;
    #uint32_t descriptionOffset;
    #uint32_t descriptionSizeOffset;
    #uint64_t frames;
    #uint8_t byteorder;
#};

class TinyTIFFFile is repr('CStruct') is export {
    has Pointer       $.hFile; # HANDLE
    has Pointer       $.file;  # FILE
    has uint32        $.lastIFDOffsetField;
    has int64         $.lastStartPos;
    has uint32        $.lastIFDDATAAdress;
    has uint16        $.lastIFDCount;
    has CArray[uint8] $.lastHeader;
    has int32         $.lastHeaderSize;
    has uint32        $.pos;
    has uint32        $.width;
    has uint32        $.height;
    has uint16        $.bitspersample;
    has uint32        $.descriptionOffset;
    has uint32        $.descriptionSizeOffset;
    has uint64        $.frames;
    has uint8         $.byteorder;
}

#| close the tiff file
sub TinyTIFFReader_close( TinyTIFFReaderFile is rw )
    is native('tinytiff') is export { * }

#| return number of frames
sub TinyTIFFReader_countFrames( TinyTIFFReaderFile is rw )
    returns uint32 is native('tinytiff') is export { * }

#| return bits per sample of current frame
sub TinyTIFFReader_getBitsPerSample( TinyTIFFReaderFile is rw, int32 )
    returns uint16 is native('tinytiff') is export { * }

#| return height of current frame
sub TinyTIFFReader_getHeight( TinyTIFFReaderFile is rw )
    returns uint32 is native('tinytiff') is export { * }

#| return image descrition of current frame
sub TinyTIFFReader_getImageDescription( TinyTIFFReaderFile is rw )
    returns str is native('tinytiff') is export { * }

#| return last error message
sub TinyTIFFReader_getLastError( TinyTIFFReaderFile is rw )
    returns str is native('tinytiff') is export { * }

#| read data from current frame into supplied buffer
sub TinyTIFFReader_getSampleData( TinyTIFFReaderFile is rw, Blob is rw, uint16 )
    returns int32 is native('tinytiff') is export { * }

#| return sample format of current frame
sub TinyTIFFReader_getSampleFormat( TinyTIFFReaderFile is rw )
    returns uint16 is native('tinytiff') is export { * }

#| return samples per pixel of current frame
sub TinyTIFFReader_getSamplesPerPixel( TinyTIFFReaderFile is rw )
    returns uint16 is native('tinytiff') is export { * }

#| return width of current frame
sub TinyTIFFReader_getWidth( TinyTIFFReaderFile is rw )
    returns uint32 is native('tinytiff') is export { * }

#| retun non-zero if another frame exists
sub TinyTIFFReader_hasNext( TinyTIFFReaderFile is rw )
    returns int32 is native('tinytiff') is export { * }

#| open tiff file for reading
sub TinyTIFFReader_open( str $filename is rw )
    returns TinyTIFFReaderFile is native('tinytiff') is export { * }

#| read the next frame from a multi-frame tiff
sub TinyTIFFReader_readNext( TinyTIFFReaderFile is rw )
    returns int32 is native('tinytiff') is export { * }

#| return non-zero if no error in last function call
sub TinyTIFFReader_success( TinyTIFFReaderFile is rw )
    returns int32 is native('tinytiff') is export { * }

#| return non-zero if error in last function call
sub TinyTIFFReader_wasError( TinyTIFFReaderFile is rw )
    returns int32 is native('tinytiff') is export { * }

#| close the tiff and write image description to first frame
sub TinyTIFFWriter_close( TinyTIFFFile is rw, str $image-description is rw )
    is native('tinytiff') is export { * }

#| get max size for image descrition
sub TinyTIFFWriter_getMaxDescriptionTextSize()
    returns int32 is native('tinytiff') is export { * }
  
#| create a new tiff file
sub TinyTIFFWriter_open( str $filename is rw, uint16 $bits-per-sample, uint32 $width, uint32 $height )
    returns TinyTIFFFile is rw is native('tinytiff') is export { * }

#| writes row-major image data to a tiff file
sub TinyTIFFWriter_writeImage( TinyTIFFFile $tiff, Blob $image-data ) {
    given $image-data {
        when buf32 { TinyTIFFWriter_writeImageDouble: $tiff, $image-data }
        when buf64 { TinyTIFFWriter_writeImageDouble: $tiff, $image-data }
        default    { TinyTIFFWriter_writeImageDouble: $tiff, $image-data }
    }
}

# for num64
sub TinyTIFFWriter_writeImageDouble( TinyTIFFFile is rw, Blob is rw )
    is native('tinytiff') { * }

# for num32
sub TinyTIFFWriter_writeImageFloat( TinyTIFFFile is rw, Blob is rw )
    is native('tinytiff') { * }

# for other
sub TinyTIFFWriter_writeImageVoid( TinyTIFFFile is rw, Blob is rw )
    is native('tinytiff') { * }

