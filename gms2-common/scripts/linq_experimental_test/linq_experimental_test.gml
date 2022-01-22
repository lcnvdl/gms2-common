/*function LinqTestTest() : GMLTest_Harness() constructor {
	function setup() {
	}
	
	function tearDown() {
		global.__path_separator = "\\";
	}
}

test_f(LinqTestTest, "ForEachTest", function() {
	ds = _auto([]);
	
	 ForEach([1,2,3], lm1_ ds.Push(arg1 + 1) _lm);
	
	gmltest_expect_eq(ds.ToString(), "[ 2.0, 3.0, 4.0 ]");
});

test_f(LinqTestTest, "SumTest - Empty sum should add the array values", function() {
	var result = _from(_auto([1, 2, 3])).Sum();
	
	gmltest_expect_eq(result, 6);
});


test_f(LinqTestTest, "SumTest - Sum with custom fn", function() {
	var result = _from(_auto([1, 2, 3])).Sum(lm1_ arg1*.5 _lm);
	
	gmltest_expect_eq(round(result), 3);
});
*/
