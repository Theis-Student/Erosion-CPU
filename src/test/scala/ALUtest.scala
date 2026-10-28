import chiseltest.{ChiselScalatestTester, WriteVcdAnnotation}
import org.scalatest.flatspec.AnyFlatSpec
import chisel3._
import chiseltest._
import java.util

class ALUtest extends AnyFlatSpec with ChiselScalatestTester{
  "ALUtest" should "pass" in {
    test(new ALU())
      .withAnnotations(Seq(WriteVcdAnnotation)) { dut =>

        dut.clock.setTimeout(0)

        //ALU testing add
        dut.io.a.poke(6)
        dut.io.b.poke(7)
        dut.io.fn.poke(0)
        dut.clock.step(1)
        dut.io.y.expect(13)

        //ALU testing Multi
        dut.io.a.poke(20)
        dut.io.b.poke(2)
        dut.io.fn.poke(1)
        dut.clock.step(1)
        dut.io.y.expect(40)

        //ALU testing add immediate
        dut.io.a.poke(2)
        dut.io.c.poke(1)
        dut.io.fn.poke(2)
        dut.clock.step(1)
        dut.io.y.expect(3)

        //ALU testing sub immediate
        dut.io.a.poke(3)
        dut.io.c.poke(1)
        dut.io.fn.poke(3)
        dut.clock.step(1)
        dut.io.y.expect(2)
      }
  }
}
