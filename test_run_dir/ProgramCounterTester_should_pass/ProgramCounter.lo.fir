FIRRTL version 1.2.0
circuit ProgramCounter :
  module ProgramCounter :
    input clock : Clock
    input reset : UInt<1>
    input io_stop : UInt<1> @[src/main/scala/ProgramCounter.scala 5:14]
    input io_jump : UInt<1> @[src/main/scala/ProgramCounter.scala 5:14]
    input io_run : UInt<1> @[src/main/scala/ProgramCounter.scala 5:14]
    input io_programCounterJump : UInt<16> @[src/main/scala/ProgramCounter.scala 5:14]
    output io_programCounter : UInt<16> @[src/main/scala/ProgramCounter.scala 5:14]

    reg cntReg : UInt<16>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[src/main/scala/ProgramCounter.scala 15:23]
    node _T = eq(io_run, UInt<1>("h0")) @[src/main/scala/ProgramCounter.scala 17:15]
    node _T_1 = eq(io_stop, UInt<1>("h1")) @[src/main/scala/ProgramCounter.scala 19:21]
    node _T_2 = eq(io_jump, UInt<1>("h0")) @[src/main/scala/ProgramCounter.scala 19:43]
    node _T_3 = and(_T_1, _T_2) @[src/main/scala/ProgramCounter.scala 19:32]
    node _T_4 = eq(io_run, UInt<1>("h1")) @[src/main/scala/ProgramCounter.scala 21:21]
    node _T_5 = eq(io_stop, UInt<1>("h0")) @[src/main/scala/ProgramCounter.scala 21:43]
    node _T_6 = and(_T_4, _T_5) @[src/main/scala/ProgramCounter.scala 21:32]
    node _T_7 = eq(io_jump, UInt<1>("h0")) @[src/main/scala/ProgramCounter.scala 21:66]
    node _T_8 = and(_T_6, _T_7) @[src/main/scala/ProgramCounter.scala 21:55]
    node _io_programCounter_T = add(io_programCounter, UInt<1>("h1")) @[src/main/scala/ProgramCounter.scala 22:44]
    node _io_programCounter_T_1 = tail(_io_programCounter_T, 1) @[src/main/scala/ProgramCounter.scala 22:44]
    node _cntReg_T = add(cntReg, UInt<1>("h1")) @[src/main/scala/ProgramCounter.scala 23:22]
    node _cntReg_T_1 = tail(_cntReg_T, 1) @[src/main/scala/ProgramCounter.scala 23:22]
    node _T_9 = eq(io_run, UInt<1>("h1")) @[src/main/scala/ProgramCounter.scala 24:23]
    node _T_10 = eq(io_stop, UInt<1>("h0")) @[src/main/scala/ProgramCounter.scala 24:45]
    node _T_11 = and(_T_9, _T_10) @[src/main/scala/ProgramCounter.scala 24:34]
    node _T_12 = eq(io_jump, UInt<1>("h1")) @[src/main/scala/ProgramCounter.scala 24:68]
    node _T_13 = and(_T_11, _T_12) @[src/main/scala/ProgramCounter.scala 24:57]
    node _GEN_0 = mux(_T_8, _cntReg_T_1, cntReg) @[src/main/scala/ProgramCounter.scala 21:78 23:12 15:23]
    node _GEN_1 = mux(_T_3, cntReg, _GEN_0) @[src/main/scala/ProgramCounter.scala 15:23 19:55]
    node _GEN_2 = mux(_T, cntReg, _GEN_1) @[src/main/scala/ProgramCounter.scala 15:23 17:27]
    io_programCounter <= io_programCounterJump @[src/main/scala/ProgramCounter.scala 25:23]
    cntReg <= mux(reset, UInt<16>("h0"), _GEN_2) @[src/main/scala/ProgramCounter.scala 15:{23,23}]
