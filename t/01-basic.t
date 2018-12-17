use v6.c;
use Test;
use Graphics::TinyTIFF;

plan 6;

my $tiff;

lives-ok { $tiff = TinyTIFFReader_open('../TinyTIFF/test/tinytiff_reader_test/cell.tif') };
lives-ok { TinyTIFFReader_countFrames($tiff) };
lives-ok { TinyTIFFReader_getBitsPerSample($tiff, 0) };
lives-ok { TinyTIFFReader_getHeight($tiff) };
lives-ok { TinyTIFFReader_getImageDescription($tiff) };

lives-ok { TinyTIFFReader_close($tiff) };
