FIRRTL version 1.2.0
circuit ALU :
  module ALU :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<32> @[src/main/scala/ALU.scala 5:14]
    input io_b : UInt<32> @[src/main/scala/ALU.scala 5:14]
    input io_fn : UInt<5> @[src/main/scala/ALU.scala 5:14]
    output io_y : UInt<32> @[src/main/scala/ALU.scala 5:14]
    input io_c : UInt<7> @[src/main/scala/ALU.scala 5:14]

    node _T = eq(UInt<1>("h0"), io_fn) @[src/main/scala/ALU.scala 15:16]
    node _io_y_T = add(io_a, io_b) @[src/main/scala/ALU.scala 16:26]
    node _io_y_T_1 = tail(_io_y_T, 1) @[src/main/scala/ALU.scala 16:26]
    node _T_1 = eq(UInt<1>("h1"), io_fn) @[src/main/scala/ALU.scala 15:16]
    node _io_y_T_2 = mul(io_a, io_b) @[src/main/scala/ALU.scala 17:26]
    node _T_2 = eq(UInt<2>("h2"), io_fn) @[src/main/scala/ALU.scala 15:16]
    node _io_y_T_3 = add(io_a, io_c) @[src/main/scala/ALU.scala 18:26]
    node _io_y_T_4 = tail(_io_y_T_3, 1) @[src/main/scala/ALU.scala 18:26]
    node _T_3 = eq(UInt<2>("h3"), io_fn) @[src/main/scala/ALU.scala 15:16]
    node _io_y_T_5 = sub(io_a, io_c) @[src/main/scala/ALU.scala 19:26]
    node _io_y_T_6 = tail(_io_y_T_5, 1) @[src/main/scala/ALU.scala 19:26]
    node _GEN_0 = mux(_T_3, _io_y_T_6, UInt<1>("h0")) @[src/main/scala/ALU.scala 15:16 19:18 13:8]
    node _GEN_1 = mux(_T_2, _io_y_T_4, _GEN_0) @[src/main/scala/ALU.scala 15:16 18:18]
    node _GEN_2 = mux(_T_1, _io_y_T_2, _GEN_1) @[src/main/scala/ALU.scala 15:16 17:18]
    node _GEN_3 = mux(_T, _io_y_T_1, _GEN_2) @[src/main/scala/ALU.scala 15:16 16:18]
    io_y <= bits(_GEN_3, 31, 0)
