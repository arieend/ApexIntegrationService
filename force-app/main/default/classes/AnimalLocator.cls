public class AnimalLocator {
    public static String getAnimalNameById(Integer animal_id) {
        String animal_name;
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals' + '/'+ animal_id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
            System.debug('Received the following results:' + results );
            Map<String, Object> animal = (Map<String, Object>)results.get('animal');
            System.debug('Received the following results:' + animal );
            animal_name = (String)animal.get('name');
            System.debug(animal_name );
        }
        
        return animal_name;
    }
    
}