package haxe.ds;

class ArraySortExt {
	/**
		Sorts Array `a` according to the comparison function `cmp`, where
			`cmp(x,y)` returns 0 if `x == y`, a positive Int if `x > y` and a
		negative Int if `x < y`.

		This operation modifies Array `a` in place.

		This operation is stable: The order of equal elements is preserved.

		If `a` or `cmp` are null, the result is unspecified.
	**/
	static public inline function sortRange<T>( a: Array<T>, cmp: T->T->Int, pos: Int, ?len: Int ) {
		@:privateAccess haxe.ds.ArraySort.rec(a, cmp, pos, len == null ? a.length : pos + len);
	}
}
