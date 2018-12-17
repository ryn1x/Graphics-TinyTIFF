use v6.c;
use Test;
use NativeCall;
use Graphics::TinyTIFF;

my TinyTIFFReaderFile $tiff;
my $width;
my $height;
my $size;
my @sample-data;

plan 8;

lives-ok { $tiff = TinyTIFFReader_open('../TinyTIFF/test/tinytiff_reader_test/cell.tif') };
lives-ok { TinyTIFFReader_countFrames($tiff) };
lives-ok { TinyTIFFReader_getBitsPerSample($tiff, 0) };
lives-ok { $width = TinyTIFFReader_getWidth($tiff) };
lives-ok { $height = TinyTIFFReader_getHeight($tiff) };
#lives-ok { TinyTIFFReader_getImageDescription($tiff) }; // TODO fix this
lives-ok { TinyTIFFReader_getLastError($tiff) };

$size = $width * $height;
@sample-data := buf8.allocate($size);

lives-ok { TinyTIFFReader_getSampleData($tiff, @sample-data, 0) };
lives-ok { TinyTIFFReader_close($tiff) };

#dd @sample-data;

