@isTest
public with sharing class multiSelectToStringCollection_Test {
    static Integer numberOfLoops = 200;

    @isTest
    public static void null_string_to_split(){
        List<Inv_multiSelectToStringCollection.Input> inputs = instatiateInputList();

        Inv_multiSelectToStringCollection.Input input = instatiateInput(null, null);

        inputs.add(input);

        List<Inv_multiSelectToStringCollection.Output> outputs = Inv_multiSelectToStringCollection.split(inputs);

        system.assert(!outputs.isEmpty());
    }

    @isTest
    public static void string_to_split(){
        List<String> listToString = new List<String>{'Ryan','Mercer'};
        String delimeter = '.';

        String stringToSplit = string.join(listToString,delimeter);

        List<Inv_multiSelectToStringCollection.Input> inputs = instatiateInputList();

        for(Integer i = 1; i <= numberOfLoops; i++){
            Inv_multiSelectToStringCollection.Input input = instatiateInput(stringToSplit, delimeter);

            inputs.add(input);    
        }
        
        List<Inv_multiSelectToStringCollection.Output> outputs = Inv_multiSelectToStringCollection.split(inputs);

        system.assert(outputs.size() == numberOfLoops);
        for(Inv_multiSelectToStringCollection.Output output : outputs){
            for(Integer i = 0; i < output.collection.size(); i++){
                system.assertEquals(listToString[i], output.collection[i]);
            }
        }
    }

    private static List<Inv_multiSelectToStringCollection.Input> instatiateInputList(){
        return new List<Inv_multiSelectToStringCollection.Input>();
    }

    private static Inv_multiSelectToStringCollection.Input instatiateInput(String stringToSplit, String delimeter){
        Inv_multiSelectToStringCollection.Input input = new Inv_multiSelectToStringCollection.Input();
        input.stringToSplit = stringToSplit;
        input.delimeter = delimeter;

        return input;
    }
}
