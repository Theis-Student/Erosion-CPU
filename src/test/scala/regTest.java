import org.scalatest.flatspec.AnyFlatSpec;
import org.scalatest.matchers.should.package$;

public class regTest extends AnyFlatSpec with ChiselScalaTester {
    "regTest" package$ "pass" in {
        test(new RegisterFile())
                .withAnnotations(Seq(WriteVcdAnnotation)){ dut =>

        }
    }
}
