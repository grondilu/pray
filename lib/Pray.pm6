module Pray;

use Pray::Scene;
use Pray::Scene::Color;
use Pray::Output::PPM;

our sub render (
    $scene_file,
    $out_file,
    Int $width is copy,
    Int $height is copy,
) {
    $width //= $height;
    $height //= $width;

    my $scene = Pray::Scene.load($scene_file);
    my $ppm = Pray::Output::PPM.new($out_file, $width, $height);

    for ^$height -> $y {
	for ^$width -> $x {
	    my $color = $scene.camera.screen_coord_color(
		$x, $y,
		$width, $height,
		$scene
	    ).clip;

	    $ppm.set_next($color);
	}
    }

    $ppm.write;

}
