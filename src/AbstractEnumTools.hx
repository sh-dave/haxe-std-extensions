package;

// https://code.haxe.org/category/macros/enum-abstract-values.html

#if macro
import haxe.macro.Context;
import haxe.macro.Expr;
using haxe.macro.Tools;
#end

class AbstractEnumTools {
  public static macro function getValues(typePath:Expr):Expr {
    var type = Context.getType(typePath.toString());

    switch (type.follow()) {
      case TAbstract(_.get() => ab, _) if (ab.meta.has(":enum")):
        var valueExprs = [];
        for (field in ab.impl.get().statics.get()) {
          if (field.meta.has(":enum") && field.meta.has(":impl")) {
            var fieldName = field.name;
            valueExprs.push(macro $typePath.$fieldName);
          }
        }
        return macro $a{valueExprs};

      default:
        throw new Error(type.toString() + " should be @:enum abstract", typePath.pos);
    }
  }
}
