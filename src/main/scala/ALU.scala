import chisel3._
import chisel3.util._

class ALU extends Module {
  val io = IO(new Bundle {
    val a = Input(UInt(32.W))
    val b = Input(UInt(32.W))
    val fn = Input(UInt(5.W))
    val y = Input(UInt(32.W))
    val c = Input(UInt(5.W))

  })

  switch(io.fn){
    is(0.U){io.y := io.a + io.b}
    is(1.U){io.y := io.a * io.b}
    is(2.U){io.y := io.a + io.c}
    is(3.U){io.y := io.a - io.c}
  }
}