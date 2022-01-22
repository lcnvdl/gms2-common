function DsQueueEnumeratorTest() : GMLTest_Harness() constructor {
	function setup() {
		queue = ds_queue_create();
	}
	
	function tearDown() {
		ds_queue_destroy(queue);
	}
}

test_f(DsQueueEnumeratorTest, "ds_queue to ArrayList", function() {
	ds_queue_enqueue(queue, 1);
	ds_queue_enqueue(queue, 2);
	ds_queue_enqueue(queue, 3);

	var result = new DsQueueEnumerator(queue);
	var json = result.ToArrayList().ToString();
	gmltest_expect_eq(json, "[ 1.0, 2.0, 3.0 ]");
});

test_f(DsQueueEnumeratorTest, "ds_queue count", function() {
	ds_queue_enqueue(queue, 1);
	ds_queue_enqueue(queue, 2);
	ds_queue_enqueue(queue, 3);

	var enumerator = new DsQueueEnumerator(queue);
	gmltest_expect_eq(enumerator.Count(), 3);
});

test_f(DsQueueEnumeratorTest, "ds_queue any", function() {
	var enumerator = new DsQueueEnumerator(queue);
	gmltest_expect_false(enumerator.Any());
	
	ds_queue_enqueue(queue, 1);
	ds_queue_enqueue(queue, 2);
	ds_queue_enqueue(queue, 3);
	
	gmltest_expect_true(enumerator.Any());
	gmltest_expect_false(enumerator.Any(function(m) { return false }));
});
