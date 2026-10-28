import chiseltest.{ChiselScalatestTester, WriteVcdAnnotation}
import org.scalatest.flatspec.AnyFlatSpec
import chisel3._
import chiseltest._
import java.util

class ALUtest extends AnyFlatSpec with ChiselScalatestTester{
  "ALU" should "pass" in {
    test(new ALUtest())
      .withAnnotations(Seq(WriteVcdAnnotation)) { dut =>

        dut.clock()
      }
  }
}
