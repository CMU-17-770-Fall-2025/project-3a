;; ref.test4
;; Struct reference testing
(module
  (type $i32_array (array i32))
  (type $gen_struct (struct))
  (type $custom_struct (struct (field $a i32) (field $b (ref null $i32_array)) (field $c f64)))
  (type $func_rettype_struct (func (result (ref $custom_struct))))
  (type $func_rettype_array (func (param i32) (result (ref $i32_array))))
  (type $main_type (func (result i32)))
  (func $struct_init (type $func_rettype_struct)
    (struct.new $custom_struct
      (i32.const 5)
      (array.new $i32_array (i32.const 4) (i32.const 16))
      (f64.const 4)
    )
  )
  (func $main (type $main_type)
    (local $st (ref $custom_struct))
    (local.set $st (call $struct_init))

    (i32.shl (ref.test (ref struct) (local.get $st)) (i32.const 0))
    (i32.shl (ref.test structref (local.get $st)) (i32.const 1))
    (i32.shl (ref.test nullref (local.get $st)) (i32.const 2))
    (i32.shl (ref.test (ref struct) (ref.null $custom_struct)) (i32.const 3))
    (i32.shl (ref.test structref (ref.null $custom_struct)) (i32.const 4))
    (i32.shl (ref.test (ref struct) (struct.new $gen_struct)) (i32.const 5))
    i32.add
    i32.add
    i32.add
    i32.add
    i32.add
  )
  (export "main" (func $main))
)
