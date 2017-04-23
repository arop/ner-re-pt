for /l %%r in (2, 1, 3) do (
	echo "\n*****repeat "%%r"*****\n"
	for /l %%i in (0,1,9) do (
		echo "\n*****fold "%%i"*****\n"
		echo "\n***training categories***\n"
		python ../../src/change-prop.py ../../props/prop.prop cat %%r %%i
		java -d64 -Xmx14g -cp ../stanford-corenlp.jar edu.stanford.nlp.ie.crf.CRFClassifier -prop "../../props/prop.prop"
		
		echo "\n***training filtered***\n"
		python ../../src/change-prop.py ../../props/prop.prop filtered %%r %%i
		java -d64 -Xmx14g -cp ../stanford-corenlp.jar edu.stanford.nlp.ie.crf.CRFClassifier -prop "../../props/prop.prop"
	)
)
