#!/usr/bin/env perl6

use v6;
use Pray;

sub MAIN (
	Str $scene = 'scene.json',
	Str $image? is copy,
	Int :$width = 100,
	Int :$height = 100,
) {
	$image //= $scene.path.basename.subst(/\. .* $$ | $$/, '.ppm');
	
	Pray::render(
		$scene,
		$image,
		$width,
		$height,
	);
}


