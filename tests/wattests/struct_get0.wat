;; Checks if intersects line intersects point
(module
  (type $3d_point (struct (field $x i16) (field $y i16) (field $z i16)))
  (type $3d_line (struct (field $x i16) (field $z i16)))

  (type $main_type (func (result i32)))
  (func $main (type $main_type)
    (local $lc_p (ref $3d_point))
    (local $lc_l (ref $3d_line))

    (struct.new $3d_point
      (i32.const 66)
      (i32.const 23)
      (i32.const 3425)
    )
    local.set $lc_p

    (struct.new $3d_line
      (i32.const 66)
      (i32.const 3425)
    )
    local.set $lc_l

    (struct.get_u 
      $3d_point $x
      (local.get $lc_p)
    )
    (struct.get_u 
      $3d_line $x
      (local.get $lc_l)
    )
    i32.eq

    (struct.get_u 
      $3d_point $z
      (local.get $lc_p)
    )
    (struct.get_u 
      $3d_line $z
      (local.get $lc_l)
    )
    i32.eq
    i32.and
  )
  (export "main" (func $main))
)
