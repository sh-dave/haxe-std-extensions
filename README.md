# haxe-std-extensions

Just some extensions i'm sick of writing over and over.


## Array

```
findIndex<T>( a: Array<T>, f: T -> Bool ) : Int;

swap<T>( a: Array<T>, i: Int, i: Int );
```

## haxe.ds.ArraySort

```
sortRange<T>( a: Array<T>, cmp: T->T->Int, pos: Int, ?len: Int );
```
