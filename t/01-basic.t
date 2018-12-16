use v6.c;
use Test;
use Graphics::TinyTIFF;

plan 1;

lives-ok { tiff-open('../TinyTIFF/test/tinytiff_reader_test/cell.tif') };
