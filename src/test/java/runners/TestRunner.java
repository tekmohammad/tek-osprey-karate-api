package runners;

import com.intuit.karate.junit5.Karate;

public class TestRunner {

    @Karate.Test
    Karate runTest() {
        return Karate
                .run("classpath:features")
                .tags("@CreateAccount_2");
    }
}
