import chisel3._
import chisel3.util._

class RegisterFile extends Module {
  val io = IO(new Bundle {
    val aSel = Input(UInt(3.W))
    val bSel = Input(UInt(3.W))
    val writeSel = Input(UInt(3.W))
    val writeData = Input(UInt(32.W))
    val writeEnable = Bool()
    val a = Output(UInt(32.W))
    val b = Output(UInt(32.W))
  })
}