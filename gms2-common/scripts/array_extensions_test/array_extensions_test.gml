function ArrayExtensionsTest() : GMLTest_Harness() constructor {
	function setup() {
	}
	
	function tearDown() {
	}
}

test_f(ArrayExtensionsTest, "array_to_tsrict should work fine", function() {
	var result = array_to_struct(["hello", " ", "world"]);
	gmltest_expect_eq(result[$ 0], "hello");
	gmltest_expect_eq(result[$ 1], " ");
	gmltest_expect_eq(result[$ 2], "world");
});
