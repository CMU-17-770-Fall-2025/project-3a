;; ref.test0
;; Array for anyref, arrayref
(module
  (type $i32_array (array i32))
  (type $custom_struct (struct (field $a i32) (field $b (ref null $i32_array)) (field $c f64)))
  (type $func_rettype_struct (func (result (ref $custom_struct))))
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
    (ref.test anyref (struct.get $custom_struct $b (local.get $st)))
    (ref.test arrayref (struct.get $custom_struct $b (local.get $st)))
    i32.add
  )
  (export "main" (func $main))
)
