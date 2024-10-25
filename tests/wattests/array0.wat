;; array.new and len
(module
  (type $i32_array (array i32))
  (type $func_rettype_array (func (result (ref $i32_array))))
  (type $main_type (func (result i32)))
  (func $dummy (type $func_rettype_array)
    (array.new $i32_array (i32.const 1) (i32.const 3))    
  )
  (func $main (type $main_type)
    call $dummy
    array.len
  )
  (export "main" (func $main))
)
