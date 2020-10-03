@isTest
public class AnimalLocatorTest {
@isTest static void testGetAnimalNameById() {
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
        String actualValue =  AnimalLocator.getAnimalNameById(1);
        System.debug(actualValue);
        String expectedValue = 'chicken';
        System.assertEquals(actualValue, expectedValue);
  
    }
}