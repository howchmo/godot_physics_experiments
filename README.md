# godot_physics_experiments

Here is a link to a video:
https://youtu.be/M7v_e_5LYxY

This experiment attempts to combine `path` and `pathfollow` with rigid body physics using Godot.  It was built originally in Godot 3 which was not appearing to work right with frictionless materials and inertia handling.  It is published here in Godot 4.  Beta 5 works well but Beta 7 does not.

It creates spherical rigid body collision shapes that run inside an extruded square tunnel following a `path`: a 3D curve.  The `path` collision shape has a zero friction physics material applied.  The "cars" are rectangular boxes that leverage `get_closest_offset()` function in the curve to match up the rigid bodies on the `path`.  You can see that there are some offset issues and issues when traversing the `path`'s origin.

I shoould probably file an issue with the developers ;-)
