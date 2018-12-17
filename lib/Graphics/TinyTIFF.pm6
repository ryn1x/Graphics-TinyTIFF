use v6.c;
use NativeCall;

unit module Graphics::TinyTIFF:ver<0.0.1>;

sub TinyTIFFReader_close( Pointer )
    returns void is native('tinytiff') is export { * }

sub TinyTIFFReader_countFrames( Pointer )
    returns uint32 is native('tinytiff') is export { * }

sub TinyTIFFReader_getBitsPerSample( Pointer, int32 )
    returns uint16 is native('tinytiff') is export { * }

sub TinyTIFFReader_getHeight( Pointer )
    returns uint32 is native('tinytiff') is export { * }

sub TinyTIFFReader_getImageDescription( Pointer )
    returns str is native('tinytiff') is export { * }

sub TinyTIFFReader_getLastError( Pointer )
    returns Pointer is native('tinytiff') is export { * }

sub TinyTIFFReader_getSampleData( str is rw )
    returns Pointer is native('tinytiff') is export { * }

sub TinyTIFFReader_getSampleFormat( Pointer )
    returns uint16 is native('tinytiff') is export { * }

sub TinyTIFFReader_getSamplesPerPixel( Pointer )
    returns uint16 is native('tinytiff') is export { * }

sub TinyTIFFReader_getWidth( Pointer )
    returns uint32 is native('tinytiff') is export { * }

sub TinyTIFFReader_hasNext( Pointer )
    returns int32 is native('tinytiff') is export { * }

sub TinyTIFFReader_open( str is rw )
    returns Pointer is native('tinytiff') is export { * }

sub TinyTIFFReader_readNext( Pointer )
    returns int32 is native('tinytiff') is export { * }

sub TinyTIFFReader_success( Pointer )
    returns int32 is native('tinytiff') is export { * }

sub TinyTIFFReader_wasError( Pointer )
    returns int32 is native('tinytiff') is export { * }

sub TinyTIFFWriter_close( Pointer, str is rw )
    returns void is native('tinytiff') is export { * }

sub TinyTIFFWriter_getMaxDescriptionTextSize()
    returns int32 is native('tinytiff') is export { * }

sub TinyTIFFWriter_open( str is rw, uint16, uint32, uint32 )
    returns Pointer is native('tinytiff') is export { * }

sub TinyTIFFWriter_writeImageDouble( Pointer, CArray[num64] is rw )
    returns void is native('tinytiff') is export { * }

sub TinyTIFFWriter_writeImageFloat( Pointer, CArray[num32] is rw )
    returns void is native('tinytiff') is export { * }

sub TinyTIFFWriter_writeImageVoid( Pointer, void is rw )
    returns void is native('tinytiff') is export { * }

