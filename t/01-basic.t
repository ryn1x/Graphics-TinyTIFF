use v6.c;
use Test;
use Graphics::TinyTIFF;

my TinyTIFFReaderFile $tiff;
my $sample-data;

plan 7;

lives-ok { $tiff = TinyTIFFReader_open('../TinyTIFF/test/tinytiff_reader_test/cell.tif') };
lives-ok { dd TinyTIFFReader_countFrames($tiff) };
lives-ok { dd TinyTIFFReader_getBitsPerSample($tiff, 0) };
lives-ok { dd TinyTIFFReader_getHeight($tiff) };
lives-ok { dd TinyTIFFReader_getImageDescription($tiff) };
lives-ok { dd TinyTIFFReader_getLastError($tiff) };
lives-ok { dd TinyTIFFReader_getSampleData($tiff, $sample-data, 0) };

# lives-ok { TinyTIFFReader_close($tiff) };

