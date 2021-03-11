package;

class MathExt {
    public static inline function clampf( value: Float, min: Float, max: Float ) : Float {
        return value < min ? min : value > max ? max : value;
    }

    public static inline function clampi( value: Int, min: Int, max: Int ) : Int {
        return value < min ? min : value > max ? max : value;
    }

	static final DegToRad = Math.PI / 180;

	public static inline function deg2rad( degrees: Float) : Float {
		return degrees * DegToRad; // 0.0174532924;
	}

	static final RadToDeg = 180 / Math.PI;

	public static inline function rad2deg( radians: Float ) : Float {
		return radians * RadToDeg; // 57.29578;
	}

    public static inline function sign( number: Float ) : Int {
        return number > 0 ? 1 : number < 0 ? -1 : 0;
    }

	public static inline function wrapf( value: Float, min: Float, max: Float ) : Float {
		final range = max - min;
		final value = (min + ((((value - min) % range) + range) % range));
		return value;
	}

	public static inline function wrapi( value: Int, min: Int, max: Int ) : Int {
		final range = max - min;
		final value = (min + ((((value - min) % range) + range) % range));
		return value;
	}

	public static inline function distanceSquared( ax: Float, ay: Float, bx: Float, by: Float ) {
		return (ax - bx) * (ax - bx) + (ay - by) * (ay - by);
	}
}
