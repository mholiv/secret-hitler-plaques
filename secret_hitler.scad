// This work is licensed under a  Creative Commons Attribution-ShareAlike 4.0 International License.
// See https://creativecommons.org/licenses/by-sa/4.0/
// Designed By Caitlin Campbell 

// How wide you want your tag to be
tag_width = 150;
// How deep you want the color text to be.
text_depth = 1;

// How refined we want to keep out curved edges
$fn = 50;


// In order to produce a set of stls suitable for a Prusa MMU2 unit do the following.
// 1. Set the title_text
// 2. Comment out one of the module calls (either title() or plack())
// 3. Render and export the stl
// 4. Swap what module is commented and what one is not.
// 5. Render and export the stl
// Repeat the above for each title you want.


title_text = "Alt-Kanzler";

//title();
plack();


// ------ Don't comment anything below this line ------

module plack() {
	difference() {
		rotate([0,-90,0])
		minkowski() {
			linear_extrude(tag_width)
			polygon([[0,0],[0,30],[25,15]]);
			
			sphere(2.5);
		}

		translate([-tag_width/2,15,-2.5+(text_depth)])
		rotate([180,0,0])
		linear_extrude(text_depth)
		text(title_text, font="GermaniaOne", halign="center", valign="center", size=20);
	}
}

module title() {
	translate([-tag_width/2,15,-2.5+(text_depth)])
	rotate([180,0,0])
	linear_extrude(text_depth)
	text(title_text, font="GermaniaOne", halign="center", valign="center", size=20);
}