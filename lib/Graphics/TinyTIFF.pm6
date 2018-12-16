use v6.c;
use NativeCall;

unit module Graphics::TinyTIFF:ver<0.0.1>;

sub tiff-open( str is rw) returns Pointer
                          is native('tinytiff') 
                          is symbol('_Z19TinyTIFFReader_openPKc')
                          is export { * }
