import chisel3._
import chisel3.util._

class ProgramCounter extends Module {
  val io = IO(new Bundle {
    val stop = Input(Bool())
    val jump = Input(Bool())
    val run = Input(Bool())
    val programCounterJump = Input(UInt(16.W))
    val programCounter = Output(UInt(16.W))
  })

  //Implement this module here (respect the provided interface, since it used by the tester)

  val cntReg = RegInit(0.U(16.W))

  when(io.run === false.B){
    io.programCounter := io.programCounter
} .elsewhen(io.stop === true.B && io.jump === false.B){
    io.programCounter := io.programCounter
  }.elsewhen(io.run === true.B && io.stop === false.B && io.jump === false.B){
    io.programCounter := io.programCounter + 1.U
    cntReg := cntReg + 1.U
  }. otherwise(io.run === true.B && io.stop === false.B && io.jump === true.B)
    io.programCounter := io.programCounterJump
}
