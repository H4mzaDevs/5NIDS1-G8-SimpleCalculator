package tn.esprit;

import org.junit.Test;
import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

public class CalculatorTest {
    @Test
    public void testAdd() {
        Calculator calculator = new Calculator();
        int result = calculator.add(2, 3);
        assertEquals(5, result);
    }

    @Test
    public void testAddWithMockito() {
        Calculator calculator = mock(Calculator.class);
        when(calculator.add(2, 3)).thenReturn(5);

        int result = calculator.add(2, 3);
        assertEquals(5, result);
    }
}