function BaseEnumerator() constructor {
	static Any = function() {
		Reset();
		return MoveNext();
	};
	
	static Count = function() {
		Reset();
		var n = 0;
		while(MoveNext()) {
			n += 1;	
		}
		
		return n;
	};
	
	static ForEach = function(_cb) {
		Reset();
		while(MoveNext()) {
			_cb(GetCurrent());	
		}
	};
	
	static Sum = function(_cb) {
		Reset();
		var sum = 0;
		
		while(MoveNext()) {
			var v = GetCurrent();
			sum += is_undefined(_cb) ? v : _cb(v);	
		}
		
		return sum;
	};
	
	static Select = function(_cb) {
		var arrayList = new ArrayList();
		Reset();
		while(MoveNext()) {
			arrayList.Push(_cb(GetCurrent()));	
		}
		return arrayList.GetEnumerator();
	};
	
	static Where = function(_cb) {
		var arrayList = new ArrayList();
		Reset();
		while(MoveNext()) {
			var current = GetCurrent();
			if(_cb(current)) {
				arrayList.Push(current);
			}
		}
		return arrayList.GetEnumerator();
	};
	
	static First = function() {
		Reset();
		MoveNext();
		var current = GetCurrent();
		
		if (is_undefined(current)) {
			throw "Empty collection";	
		}
		
		return current;
	};
	
	static FirstOrDefault = function() {
		Reset();
		MoveNext();
		return GetCurrent();
	};

	static Last = function() {
		Reset();
		var last = undefined;
		while(MoveNext()) {
			last = GetCurrent();
		}
		
		if (is_undefined(last)) {
			throw "Empty collection";	
		}
		
		return last;
	};

	static LastOrDefault = function() {
		Reset();
		var last = undefined;
		while(MoveNext()) {
			last = GetCurrent();
		}
		return last;
	};
	
	//	Convertions
	
	static ToArrayList = function() {
		var arrayList = new ArrayList();
		Reset();
		while(MoveNext()) {
			arrayList.Push(GetCurrent());	
		}
		return arrayList;
	};
	
	//	Alias
	static Map = function(_cb) { return Select(_cb); };
	static Filter = function(_cb) { return Where(_cb); };
}