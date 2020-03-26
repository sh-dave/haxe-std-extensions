package;

class ArrayExt {
	/**
	 * Returns the first index of `a` for which `f` is true.
	 *
	 * This function returns as soon as an element is found for which a call to
	 * 	`f` returns true.
	 *
	 * If no such element is found, the result is `-1`.
	 *
	 * If `a` or `f` is null, the result is unspecified.
	 */
	public static function findIndex<T>( a: Array<T>, f: T -> Bool ) : Int {
		for (i in 0...a.length) {
			if (f(a[i])) {
				return i;
			}
		}

		return -1;
	}

	/**
	 * Swap the elements at `i` and `j`.
	 *
	 * This operation modifies `this` Array in place.
	 *
	 * If `a` is null, or `i` or `j` point to out of bounds locations,
	 *	the result is unspecified.
	 */
	public static function swap<T>( a: Array<T>, i: Int, j: Int ) {
		final tmp = a[i];
		a[i] = a[j];
		a[j] = tmp;
	}

	/**
	 * Returns the last element of `a` or `null` if the array is empty.
	 */
	public static function last<T>( a: Array<T> ) : Null<T> {
		final l = a.length;
		return l != 0 ? a[l - 1] : null;
	}
}
