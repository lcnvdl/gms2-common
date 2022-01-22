function LinqTestTest() : GMLTest_Harness() constructor {
	function setup() {
	}
	
	function tearDown() {
		global.__path_separator = "\\";
	}
}

test_f(LinqTestTest, "ForEach - Test", function() {
	ds = GetStructureOf([]);
	
	GetLinq([1,2,3]).ForEach(function(m) { ds.Push(m + 1) });
	
	gmltest_expect_eq(ds.ToString(), "[ 2.0, 3.0, 4.0 ]");
});

test_f(LinqTestTest, "Map - Test", function() {
	ds = GetLinq([1,2,3]).Map(function(m) { return m + 1 }).ToArrayList();
	
	gmltest_expect_eq(ds.ToString(), "[ 2.0, 3.0, 4.0 ]");
});

test_f(LinqTestTest, "SumTest - Empty sum should add the array values", function() {
	var result = GetLinq([1,2,3]).Sum();
	
	gmltest_expect_eq(result, 6);
});


test_f(LinqTestTest, "SumTest - Sum with custom fn", function() {
	var result = GetLinq([1,2,3]).Sum(function(m){ return m*0.5; });
	
	gmltest_expect_eq(round(result), 3);
});

