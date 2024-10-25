;; Overallocate GC trigger
(module
  (type $f64_array (array f64))
  (type $func_rettype_array (func (result f64)))
  (type $main_type (func (result f64)))

  (func $dummy (result f64)
    (array.new $f64_array (f64.const 3.14) (i32.const 2147483648))
    (array.get $f64_array (i32.const 5))
  )

  (func $main (type $main_type)
    (local $counter i32)
    (local $acc f64)

    (local.set $counter (i32.const 1000000000))
    (local.set $acc (f64.const 0))

    (loop
      (local.set $acc (f64.add (local.get $acc) (call $dummy)))
      (local.set $counter (i32.sub (local.get $counter) (i32.const 1)))
      (br_if 0 (local.get $counter))
    )

    local.get $acc
  )
  (export "main" (func $main))
)
