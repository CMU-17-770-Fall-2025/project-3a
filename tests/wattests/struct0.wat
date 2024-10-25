;; Function reference types and struct.new
(module
  (type $point (struct (field $x i32) (field $y i32) (field $z i32)))
  (type $func_rettype_struct (func (result (ref $point))))
  (type $main_type (func (result i32)))
  (func $dummy (type $func_rettype_struct)
    (struct.new $point 
      (i32.const 1)
      (i32.const 2)
      (i32.const 3)
    )
  )
  (func $main (type $main_type)
    call $dummy
    struct.get $point $y
  )
  (export "main" (func $main))
)
