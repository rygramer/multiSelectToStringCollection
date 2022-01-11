public with sharing class Inv_multiSelectToStringCollection {
    @InvocableMethod(
        label= 'Transform multi-selections into a string collection'
    )
    public static List<Output> split(List<Input> inputs){
        List<Output> outputs = new List<Output>();

        for(Input input : inputs){
            String stringToSplit = input.stringToSplit;
            String delimeter = input.delimeter;
            if(stringToSplit == null) stringToSplit = '';
            if(delimeter == null) delimeter = ';';

            Output output = new Output();
            output.collection = new List<String>(stringToSplit.split(delimeter));

            outputs.add(output);
        }

        return outputs;
    }

    public class Input{
        @InvocableVariable(
            label= 'Multi-selections to Split'
        )
        public String stringToSplit;

        @InvocableVariable(
            label= 'Delimeter (defaults to \';\')'
        )
        public String delimeter;
    }

    public class Output{
        @InvocableVariable(
            label= 'String Collection'
        )
        public List<String> collection;
    }
}
