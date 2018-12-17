use v6.c;
use NativeCall;

unit module Graphics::TinyTIFF:ver<0.0.1>;

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

sub TinyTIFFReader_close( TinyTIFFReaderFile is rw )
    is native('tinytiff') is export { * }

sub TinyTIFFReader_countFrames( TinyTIFFReaderFile is rw )
    returns uint32 is native('tinytiff') is export { * }

sub TinyTIFFReader_getBitsPerSample( TinyTIFFReaderFile is rw, int32 )
    returns uint16 is native('tinytiff') is export { * }

sub TinyTIFFReader_getHeight( TinyTIFFReaderFile is rw )
    returns uint32 is native('tinytiff') is export { * }

sub TinyTIFFReader_getImageDescription( TinyTIFFReaderFile is rw )
    returns Pointer is native('tinytiff') is export { * }

sub TinyTIFFReader_getLastError( TinyTIFFReaderFile is rw )
    returns str is native('tinytiff') is export { * }

sub TinyTIFFReader_getSampleData( TinyTIFFReaderFile is rw, Pointer is rw, uint16 )
    returns int32 is native('tinytiff') is export { * }

sub TinyTIFFReader_getSampleFormat( TinyTIFFReaderFile is rw )
    returns uint16 is native('tinytiff') is export { * }

sub TinyTIFFReader_getSamplesPerPixel( TinyTIFFReaderFile is rw )
    returns uint16 is native('tinytiff') is export { * }

sub TinyTIFFReader_getWidth( TinyTIFFReaderFile is rw )
    returns uint32 is native('tinytiff') is export { * }

sub TinyTIFFReader_hasNext( TinyTIFFReaderFile is rw )
    returns int32 is native('tinytiff') is export { * }

sub TinyTIFFReader_open( str is rw )
    returns TinyTIFFReaderFile is native('tinytiff') is export { * }

sub TinyTIFFReader_readNext( TinyTIFFReaderFile is rw )
    returns int32 is native('tinytiff') is export { * }

sub TinyTIFFReader_success( TinyTIFFReaderFile is rw )
    returns int32 is native('tinytiff') is export { * }

sub TinyTIFFReader_wasError( TinyTIFFReaderFile is rw )
    returns int32 is native('tinytiff') is export { * }

sub TinyTIFFWriter_close( Pointer, str is rw )
    is native('tinytiff') is export { * }

sub TinyTIFFWriter_getMaxDescriptionTextSize()
    returns int32 is native('tinytiff') is export { * }

sub TinyTIFFWriter_open( str is rw, uint16, uint32, uint32 )
    returns Pointer is native('tinytiff') is export { * }

sub TinyTIFFWriter_writeImageDouble( Pointer, CArray[num64] is rw )
    is native('tinytiff') is export { * }

sub TinyTIFFWriter_writeImageFloat( Pointer, CArray[num32] is rw )
    is native('tinytiff') is export { * }

sub TinyTIFFWriter_writeImageVoid( Pointer, void is rw )
    is native('tinytiff') is export { * }

