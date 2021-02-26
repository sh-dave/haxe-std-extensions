package;

import haxe.ds.Option;

class ArrayExt {
	public static inline function clear<T>( a: Array<T> ) {
		a.splice(0, a.length);
	}

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
	 * Returns the last element of `a` or `None` if the array is empty.
	 */
	public static function last<T>( a: Array<T> ) : Option<T> {
		final l = a.length;
		return l != 0 ? Some(a[l - 1]) : None;
	}

	// in place shuffle
	public static function shuffle<T>( arr: Array<T>, rng: Void -> Float ) : Array<T> {
		if (arr != null) {
			for (i in 0...arr.length) {
				final j = _rint(0, arr.length - 1, rng);
				final a = arr[i];
				final b = arr[j];
				arr[i] = b;
				arr[j] = a;
			}
		}

		return arr;
	}

	public static function rangedShuffle<T>( arr: Array<T>, first: Int, last: Int, rng: Void -> Float ) : Array<T> {
		if (arr != null) {
			final n = last - first;

			for (i in first...n) {
				final j = _rint(first, n - 1, rng);
				final a = arr[i];
				final b = arr[j];
				arr[i] = b;
				arr[j] = a;
			}
		}

		return arr;
	}

    public static inline function addUnique<T>( array: Array<T>, item: T ) : Null<T> {
        if (array.indexOf(item) == -1) {
            array.push(item);
            return item;
        } else {
            return null;
        }
    }

    public static inline function addUnique_cb<T>( array: Array<T>, item: T, callback: T -> Void ) : Null<T> {
        if (array.indexOf(item) == -1) {
            array.push(item);

            if (callback != null) {
                callback(item);
            }

            return item;
        } else {
            return null;
        }
    }

    public static function remove<T>( array: Array<T>, item: T ) : Null<T> {
        final index = array.indexOf(item);

        if (index != -1) {
            array.splice(index, 1);
            return item;
        }

        return null;
    }

    public static function remove_cb<T>( array: Array<T>, item: T, callback: T -> Void ) : Null<T> {
        final index = array.indexOf(item);

        if (index != -1) {
            array.splice(index, 1);

            if (callback != null) {
                callback(item);
            }

            return item;
        }

        return null;
    }

	static inline function _rint( from: Int, to: Int, rng: Void -> Float ):Int {
		return from + Math.floor(((to - from + 1) * rng()));
	}
}
