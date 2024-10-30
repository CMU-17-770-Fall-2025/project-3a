;; ref.test1
;; Null (array) for (ref array), anyref
(module
  (type $i32_array (array i32))
  (type $custom_struct (struct (field $a i32) (field $b (ref null $i32_array)) (field $c f64)))
  (type $func_rettype_struct (func (result (ref $custom_struct))))
  (type $func_rettype_array (func (param i32) (result (ref $i32_array))))
  (type $main_type (func (param i32 i32) (result i32)))
  (func $struct_init (type $func_rettype_struct)
    (struct.new $custom_struct
      (i32.const 5)
      (ref.null $i32_array)
      (f64.const 4)
    )
  )
  (func $main (type $main_type)
    (local $st (ref $custom_struct))
    (local.set $st (call $struct_init))
    (ref.test (ref array) (struct.get $custom_struct $b (local.get $st)))
    (ref.test anyref (struct.get $custom_struct $b (local.get $st)))
    i32.add
  )
  (export "main" (func $main))
)
