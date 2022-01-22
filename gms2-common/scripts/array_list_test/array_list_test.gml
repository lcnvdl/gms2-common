function ArrayListTest() : GMLTest_Harness() constructor {
	function setup() {
	}
	
	function tearDown() {
	}
}

test_f(ArrayListTest, "ArrayListTest", function() {
	var result = new ArrayList([1, 2, 3]);
	var json = result.ToString();
	gmltest_expect_eq(json, "[ 1.0, 2.0, 3.0 ]");
});
