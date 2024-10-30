;; array.get/set test
;; Params: i32 -- Number of elements in arrays
;;         i32 -- Dot-product offset
(module
  (type $i32_array (array (mut i32)))
  (type $func_rettype_array (func (param i32) (result (ref $i32_array))))
  (type $main_type (func (param i32 i32) (result i32)))
  (func $arr_init (type $func_rettype_array)
    (local $counter i32)
    (local $arr (ref $i32_array))
    (local.set $arr (array.new $i32_array (i32.const 1) (local.get 0)))
    (local.set $counter (local.get 0))
    (loop
      (array.set $i32_array (local.get $arr) (local.get $counter) (i32.sub (local.get 0) (local.get $counter)))
      (br_if 0 (local.tee $counter (i32.sub (local.get $counter) (i32.const 1))))
    )
    local.get $arr
  )
  (func $main (type $main_type)
    (local $arr1 (ref $i32_array))
    (local $arr2 (ref $i32_array))
    (local $counter i32)
    (local $total i32)
    (local.set $arr1 (call $arr_init (local.get 0)))
    (local.set $arr2 (call $arr_init (i32.add (local.get 0) (local.get 1))))
    (local.set $counter (i32.sub (local.get 0) (i32.const 1)))
    (local.set $total (i32.const 0))
    (loop
      (array.get $i32_array (local.get $arr1) (local.get $counter))
      (array.get $i32_array (local.get $arr2) (i32.add (local.get 1) (local.get $counter)))
      i32.add
      local.get $total
      i32.add
      local.set $total
      (br_if 0 (i32.ge_s 
                (local.tee $counter (i32.sub (local.get $counter) (i32.const 1))) 
                (i32.const 0)))
    )
    local.get $total
  )
  (export "main" (func $main))
)
