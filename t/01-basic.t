use v6.c;
use Test;
use Graphics::TinyTIFF;

my TinyTIFFReaderFile $tiff;
my $sample-data := buf8.allocate(191*159);

plan 7;

lives-ok { $tiff = TinyTIFFReader_open('../TinyTIFF/test/tinytiff_reader_test/cell.tif') };
lives-ok { TinyTIFFReader_countFrames($tiff) };
lives-ok { TinyTIFFReader_getBitsPerSample($tiff, 0) };
lives-ok { TinyTIFFReader_getHeight($tiff) };
lives-ok { TinyTIFFReader_getImageDescription($tiff) };
lives-ok { TinyTIFFReader_getLastError($tiff) };
lives-ok { TinyTIFFReader_getSampleData($tiff, $sample-data, 0) };

# lives-ok { TinyTIFFReader_close($tiff) };

